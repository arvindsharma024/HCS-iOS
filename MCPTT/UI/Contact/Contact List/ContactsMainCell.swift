//
//  ContactsMainCell.swift
//  mcpttapp
//
//  Created by Raju Maramulla on 09/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

enum ContactAvailability: String {
    case online
    case offline
    case dnd
}

class ContactsMainCell: UICollectionViewCell {

    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactEmailLabel: UILabel!
    @IBOutlet weak var contactAvailabiltyStatus: UIImageView!
    @IBOutlet weak var callContactButton: UIButton!
    var delegate: ChannelListDelegate?
    @IBOutlet weak var separatorLineLabel: UILabel!
    
    @IBAction func callContact(_ sender: Any) {
        delegate?.launchConversationView()
    }
    
    func configureContactCell(contactMainCellVM: ContactsMainCellViewModel) {
        
        contactNameLabel.text = contactMainCellVM.contactName
        contactEmailLabel.text = contactMainCellVM.contactEmail
        switch contactMainCellVM.contactAvailablabilityStatus {
            case ContactAvailability.online.rawValue:
                contactAvailabiltyStatus.image = UIImage(named: "blue-circele")
            case ContactAvailability.offline.rawValue:
                contactAvailabiltyStatus.image = UIImage(named: "orange-circle")
            case ContactAvailability.dnd.rawValue:
                contactAvailabiltyStatus.image = UIImage(named: "gray-circlepng")
            default:
                contactAvailabiltyStatus.image = UIImage(named: "blue-circele")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
