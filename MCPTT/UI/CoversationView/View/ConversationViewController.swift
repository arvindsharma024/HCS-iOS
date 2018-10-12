//
//  ConversationViewController.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 01/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

class ConversationViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var pttToggleBtn: UIButton!
    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var ChatCollectionView: UICollectionView!
    @IBOutlet weak var PTTView: UIView!
    
    @IBOutlet weak var ChatCollectionViewHeightConst: NSLayoutConstraint!
    @IBOutlet weak var messageViewHightConst: NSLayoutConstraint!
    @IBOutlet weak var PTTViewHeightConst: NSLayoutConstraint!
    
    var isPTTEnabled: Bool = true
    var PTTViewHeight: CGFloat?
    var labelText: UILabel?
    var messageList: [ConversationModel] = []
    
    override func viewDidLoad() {
        
        ChatCollectionView.delegate   = self
        ChatCollectionView.dataSource = self
        messageView.layer.borderWidth = 1.0
        messageView.layer.borderColor = UIColor.darkGray.cgColor
        
        //Updating the image icon in navigatoritem for more and call
        let moreImage   = UIImage(named: "nav_more_icon")
        let callImage   = UIImage(named: "call_icon")
        
        let moreButton   = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(switchToUserList))
        let callButton   = UIBarButtonItem(image: callImage, style: .plain, target: self, action: #selector(activatePTT)) //todo to enable call icon
        self.navigationItem.rightBarButtonItems = [moreButton, callButton]
        self.navigationItem.hidesBackButton = false
        self.navigationItem.title = "Private chat" //todo

        //Registering the chat message cell todo: audiocell
        let nib = UINib(nibName: "ChatMessageCell", bundle: nil)
        ChatCollectionView.register(nib, forCellWithReuseIdentifier: "ChatMessageCell")
        
        DispatchQueue.global(qos: .userInitiated).async {
            ConversationViewModel.shared.getMessages(count: 10) { messages in
                DispatchQueue.main.async { //todo: remove count
                    self.messageList = messages
                    self.ChatCollectionView.reloadData()
                }
            }
        }
        
        //observer for keyboard show and hide
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ConversationViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: Keyboard and PTT toggle
    @IBAction func togglePTTAndKeyboard(_ sender: Any) {
        if isPTTEnabled {
            messageText.becomeFirstResponder()
            pttToggleBtn.setImage(UIImage(named: "keyboard"), for: .normal)
        } else {
            pttToggleBtn.setImage(UIImage(named: "ptt_launcher_icon"), for: .normal)
            messageText.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if (isPTTEnabled) {
            isPTTEnabled = !isPTTEnabled
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                PTTViewHeight =  PTTView.layer.bounds.height
                PTTViewHeightConst.constant =  keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        isPTTEnabled = !isPTTEnabled
        guard let pttViewHeight = PTTViewHeight else {
            return
        }
        PTTViewHeightConst.constant = pttViewHeight
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
}
extension ConversationViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = ChatCollectionView.dequeueReusableCell(withReuseIdentifier: "ChatMessageCell", for: indexPath) as? ChatMessageCell {
            let details: ConversationModel = messageList[indexPath.row]
            switch details.kind {
            case .text(let text):
                cell.configure(senderName: details.sender.displayName, senderDate: details.sentDate, messageText: text)
            case .audio(_):
                //todo audio
                cell.configure(senderName: details.sender.displayName, senderDate: details.sentDate, messageText: "")
            }
            return cell
        }
        let emptyCell = ChatMessageCell()
        return emptyCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let details: ConversationModel =  messageList[indexPath.row]
        let size = CGSize(width: 369, height: 1000)
        var cellHeight: CGFloat! = 14
            switch details.kind {
            case .text(let text):
                let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "Helvetica Neue", size: 14.0) ?? 14.0], context: nil)
            
            cellHeight = estimatedFrame.height + 77
            case .audio(_): break
                //todo
        }
        return CGSize(width: view.frame.width, height: cellHeight)
    }
}
extension ConversationViewController: UICollectionViewDelegateFlowLayout {

}
