//
//  ConversationViewController.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

protocol ChatAudioRecordProtocol {
    func playPauseAudio(isPlayAudio: Bool, completion:( @escaping (_ isAudioDidFinished: Bool) -> Void))
}

class ConversationViewController: UIViewController, UITextViewDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate, UICollectionViewDelegateFlowLayout, ChatAudioRecordProtocol {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var pttToggleBtn: UIButton!
    @IBOutlet weak var messageText: UITextView!
    
    @IBOutlet weak var pushToTalkButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var chatCollectionView: UICollectionView!
    
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var sendMessageBtn: UIButton!
    @IBOutlet weak var pttView: UIView!

    @IBOutlet weak var messageViewHightConst: NSLayoutConstraint!
    @IBOutlet private weak var pttButton: UIButton!
    var pttState: PTTState = .idleState

    @IBOutlet weak var pttViewHeightConst: NSLayoutConstraint!
    
    var recordingSession: AVAudioSession?
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    var playercompelition: (Bool) -> Void = { _ in }
    
    @IBAction func muteAction(_ sender: Any) {
    }
    
    @IBAction func sendMessageAction(_ sender: Any) {
        ConversationViewModel.shared.sendMessage(text: messageText.text, senderName: ConversationViewModel.shared.currentSender.displayName, senderId: "123434", messageKind: .text(messageText.text), completion: { message in
            self.messageList.append(message)//todo: remove hardcode value
        })
        chatCollectionView.performBatchUpdates({() -> Void in
          let indexPath = NSIndexPath(item: messageList.count - 1, section: 0)
            chatCollectionView.insertItems(at: [indexPath as IndexPath])
            DispatchQueue.main.async {
                self.chatCollectionView.scrollToItem(at: indexPath as IndexPath, at: .top, animated: true)
            }
        }, completion: nil)
        messageText.text = ""
        sendMessageBtn.isEnabled = false
        sendMessageBtn.alpha = 0.8
    }

    var isPTTEnabled: Bool = true
    var isAudioRecording: Bool = false
    var pttViewHeight: CGFloat?
    var labelText: UILabel?
    var messageList: [ConversationModel] = []
    var pttStateChangeTimer: Timer!

    var selectedAudioIndexPath: IndexPath?
   
    func textViewDidChangeSelection(_ textView: UITextView) {
        if let text = textView.text, !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
            if !text.isEmpty {
            sendMessageBtn.isEnabled = true
            sendMessageBtn.alpha = 1
            } else {
            sendMessageBtn.isEnabled = false
            sendMessageBtn.alpha = 0.8
            }
        }
    }
    
    override func viewDidLoad() {
        sendMessageBtn.isEnabled = false
        sendMessageBtn.alpha = 0.8
        messageText.delegate = self
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        messageView.layer.borderWidth = 1.0
        messageText.layer.borderWidth = 0.5
        messageView.layer.borderColor = UIColor.darkGray.cgColor
        messageText.layer.borderColor = UIColor.lightGray.cgColor
        
        //Updating the image icon in navigatoritem for more and call
        let moreImage = UIImage(named: "nav_more_icon")
        let callImage = UIImage(named: "call_icon")
        
        let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(switchToUserList))
        moreButton.tintColor = .gray
        let callButton = UIBarButtonItem(image: callImage, style: .plain, target: self, action: #selector(activatePTT))
        self.navigationItem.rightBarButtonItems = [moreButton, callButton]
        self.navigationItem.hidesBackButton = false
        self.navigationItem.title = "Private chat" //todo

        //Registering the chat message cell
        let messageNib = UINib(nibName: "ChatMessageCell", bundle: nil)
        chatCollectionView.register(messageNib, forCellWithReuseIdentifier: "ChatMessageCell")
        let audioNib = UINib(nibName: "ChatAudioRecordCell", bundle: nil)
        chatCollectionView.register(audioNib, forCellWithReuseIdentifier: "ChatAudioRecordCell")
        
        DispatchQueue.global(qos: .userInitiated).async {
            ConversationViewModel.shared.getMessages(count: 10) { messages in
                DispatchQueue.main.async { //todo: remove count
                    self.messageList = messages
                    self.chatCollectionView.reloadData()
                }
            }
        }
        
        //Enabling the record session
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession?.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession?.overrideOutputAudioPort(AVAudioSessionPortOverride.speaker)
            try recordingSession?.setActive(true)
            recordingSession?.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.recordAction(self)
                        self.recordButton.isEnabled = true
                    } else {
                        self.recordButton.isEnabled = false
                    }
                }
            }
        } catch {
            // todo
        }
        
        //observer for keyboard show and hide
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // Setup PTT button
        pttButton.layer.cornerRadius = pttButton.frame.size.height/2
        pttButton.layer.borderWidth = 15
        changePttButton(color: pttState.colorCode)
        pttStateChangeTimer = Timer.scheduledTimer(timeInterval: 9, target: self, selector: #selector(changePTTState), userInfo: nil, repeats: true)
        pttStateChangeTimer.fire()

    }
    
    // MARK: Audio and Record
    @IBAction func recordAction(_ sender: Any) {
        isAudioRecording = !isAudioRecording
        if isAudioRecording {
            recordButton.setImage(UIImage(named: "stop_record"), for: .normal)
        } else {
            recordButton.setImage(UIImage(named: "start_record"), for: .normal)
        }
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
    }
   
    @objc func recordTapped() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("sound.caf")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 16000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
            ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
            finishRecording(success: false)
        }
    }
    
    func playPauseAudio(isPlayAudio: Bool, completion: @escaping ((Bool) -> Void)) {
        if isPlayAudio {
            do {
                playercompelition = completion
                audioPlayer = try AVAudioPlayer(contentsOf: getDocumentsDirectory().appendingPathComponent("sound.caf"))
                guard let player = audioPlayer else { return }
                audioPlayer?.delegate = self
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            audioPlayer?.pause()
        }
       // completion(true)
    }
    func playPauseAudio(isPlayAudio: Bool, selectedAudioCell: ChatAudioRecordCell) {
        selectedAudioIndexPath = self.chatCollectionView.indexPath(for: selectedAudioCell)
        if isPlayAudio {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: getDocumentsDirectory().appendingPathComponent("sound.caf"))
                guard let player = audioPlayer else { return }
                audioPlayer?.delegate = self
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            audioPlayer?.pause()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playercompelition(true)
    }
   
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func finishRecording(success: Bool) {
        audioRecorder?.stop()
        audioRecorder = nil
        
        if success {
            ConversationViewModel.shared.sendMessage(text: messageText.text, senderName: ConversationViewModel.shared.currentSender.displayName, senderId: "123434", messageKind: .audio("sample string"), completion: { message in
                self.messageList.append(message)//todo: remove hardcode value
            }
            )
            chatCollectionView.performBatchUpdates({() -> Void in
                let indexPath = NSIndexPath(item: messageList.count - 1, section: 0)
                chatCollectionView.insertItems(at: [indexPath as IndexPath])
                DispatchQueue.main.async {
                    self.chatCollectionView.scrollToItem(at: indexPath as IndexPath, at: .top, animated: true)
                }
            }, completion: nil)
        } else { // hemanth
            // recording failed :(
        }
    }
    
    // MARK: Keyboard and PTT toggle
    @IBAction func togglePTTAndKeyboard(_ sender: Any) {
        if isPTTEnabled {
            messageText.becomeFirstResponder()
            pttToggleBtn.setImage(UIImage(named: "ptt_launcher_icon"), for: .normal)
        } else {
            pttToggleBtn.setImage(UIImage(named: "keyboard"), for: .normal)
            messageText.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if (isPTTEnabled) {
            isPTTEnabled = !isPTTEnabled
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                pttViewHeight = pttView.layer.bounds.height
                pttViewHeightConst.constant = keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        isPTTEnabled = !isPTTEnabled
        guard let height = pttViewHeight else {
            return
        }
        pttViewHeightConst.constant = height
    }
    
    // MARK: Navigate to UserList
    @objc func switchToUserList() {
        var actions: [(String, UIAlertActionStyle)] = []
        actions.append(("Members", UIAlertActionStyle.default))
        actions.append(("Cancel", UIAlertActionStyle.cancel))
        CommonUtility.showActionsheet(viewController: self, title: nil, message: nil, actions: actions) { (index) in
            if index == 0 {
                let memberDetailVc = MemberListViewController.instantiateFromStoryboard("Channel", storyboardId: "MemberListViewController")
                self.navigationController?.pushViewController(memberDetailVc, animated: true)
            }
        }
    }
    
    // MARK: activate and Deactivate call
    @objc func activatePTT() {
        //todo hemanth
    }
    
    @objc func changePTTState() {
        if pttState == .busyState {
            pttState = .idleState
        } else {
            pttState = .busyState
        }
        changePttButton(color: pttState.colorCode)
    }
    
    func changePttButton(color: UIColor) {
        pttButton.layer.borderColor = color.cgColor
    }
    
    // When user release button press then this method will call
    @IBAction func pttButtonTouchInside() {
        changePttButton(color: pttState.colorCode)
    }

    // When user tap on button the this method will call
    @IBAction func pttButtonTouchDown() {
        changePttButton(color: pttState.colorForSpeakingMode)
    }
    
}
extension ConversationViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let details: ConversationModel = messageList[indexPath.row]
            switch details.kind {
            case .text(let text):
            if let cell = chatCollectionView.dequeueReusableCell(withReuseIdentifier: "ChatMessageCell", for: indexPath) as? ChatMessageCell {
                cell.configure(senderName: details.sender.displayName, senderDate: details.sentDate, messageText: text)
                return cell
            } else {
                
            }
            case .audio(_):
            //todo audio
                if let cell = chatCollectionView.dequeueReusableCell(withReuseIdentifier: "ChatAudioRecordCell", for: indexPath) as? ChatAudioRecordCell {
            cell.configure(senderName: details.sender.displayName, senderDate: details.sentDate, messageText: "Recorded", isAudioRecorded: true)//todo
                    cell.delegate = self
            return cell
                } else {
                    
                }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let details: ConversationModel =  messageList[indexPath.row]
        let size = CGSize(width: 369, height: 1000)
        var cellHeight: CGFloat! = 14
            switch details.kind {
            case .text(let text):
                let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "Helvetica Neue", size: 14.0) ?? 14.0], context: nil)
            
            cellHeight = estimatedFrame.height + 77
            case .audio(_):
                cellHeight = 92
        }
        return CGSize(width: view.frame.width, height: cellHeight)
    }
}
