//
//  ChatMessageCell.swift
//  mcpttapp
//
//  Created by Hemanth Kumar H N on 04/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageCell: UICollectionViewCell {
    @IBOutlet weak var messageSender: UILabel?
    @IBOutlet weak var messageDate: UILabel?
    @IBOutlet weak var messageTime: UILabel?
    
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textViewWidthConst: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConst: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingCont: NSLayoutConstraint!
    @IBOutlet weak var commentViewWidthConst: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(senderName: String, senderDate: Date, messageText: String) {
        
          textView?.text      = messageText
        
        //Updating the cell based on the sender and receiver
        if senderName.elementsEqual(ConversationViewModel.shared.currentSender.displayName) {
            updateSenderView()
        } else {
            updateRecieveView()
        }
        //bind the model to cell
        messageSender?.text = senderName
        messageDate?.text   = "dec 25 2018"
        messageTime?.text   = "04:00"
    }
    
    func updateSenderView() {
        commentImageView.image = UIImage(named: "bubble_sent")?.resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21), resizingMode: .stretch)
        let estimatedFrame = NSString(string: (textView?.text) ?? " ").boundingRect(with: CGSize(width: textView.layer.bounds.width, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "Helvetica Neue", size: 14.0) ?? 14.0], context: nil)
        textViewWidthConst.constant = estimatedFrame.width - 10
        commentViewWidthConst.constant = estimatedFrame.width + 20
        imageViewTrailingCont.constant = 18
       
        if estimatedFrame.height < 18 {
            textView?.textAlignment     = .right
        }
        
        imageViewLeadingConst.constant = 138
        messageSender?.textAlignment     = .right
        profileView.isHidden             = true
    }
    
    func updateRecieveView() {
        commentImageView.image = UIImage(named: "bubble_received")?.resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21), resizingMode: .stretch)
        let estimatedFrame = NSString(string: (textView?.text) ?? " ").boundingRect(with: CGSize(width: textView.layer.bounds.width, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "Helvetica Neue", size: 14.0) ?? 14.0], context: nil)
        textViewWidthConst.constant = estimatedFrame.width
        commentViewWidthConst.constant = estimatedFrame.width + 20
        imageViewTrailingCont.constant = 98
        imageViewLeadingConst.constant = 58
        messageSender?.textAlignment     = .left
        profileView.isHidden             = false
    }
    
}
