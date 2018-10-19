//
//  ContactsViewController.swift
//  mcpttapp
//
//  Created by Raju Maramulla on 09/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import Foundation
import UIKit

protocol ChannelListProtocol: AnyObject {
    func launchConversationView()
}

final class ContactListViewController: UIViewController, ChannelListProtocol, UITableViewDataSource, UITableViewDelegate {
    
    var contactModelDictionary = [String: [Contact]]()
    var contactNameTitles = [String]()
    var contacts = [Contact]()
    
    var groups = ["Special TF A(999)", "Special TF B(999)", "Special TF C(999)"]
    
     var contactSectionTitlesUpdated = [String]()
   
    @IBOutlet weak var contactListTableView: UITableView!
    @IBOutlet private weak var icFabButton: UIButton!
    
    let screenSize = UIScreen.main.bounds
    
    lazy var viewModel: ContactsListViewModel = {
        return ContactsListViewModel()
    }()
    
    //to launch the conversationView from the contact list
    func launchConversationView() {
        let conversationViewController = ConversationViewController.instantiate(storyboardName: "Channel", storyboardId: "ConversationViewController")
        self.parent?.navigationController?.pushViewController(conversationViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init view model
        contactListTableView.register(UINib.init(nibName: "ContactListHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "ContactListHeaderView")
        setupICFabButtons()
        initVM()
 
        self.contactListTableView.delegate = self
        self.contactListTableView.dataSource = self
        
        for contactModel in viewModel.cellViewModels {
            //print(names)
            contacts.append(contactModel)
        }
       
        for contactModel in contacts {
            let contactKey = String(contactModel.contactName.prefix(1))
            if var contactListArray = contactModelDictionary[contactKey] {
                contactListArray.append(contactModel)
                contactModelDictionary[contactKey] = contactListArray
            } else {
                contactModelDictionary[contactKey] = [contactModel]
            }
        }
        contactNameTitles = [String](contactModelDictionary.keys)
        contactNameTitles = contactNameTitles.sorted(by: { $0 < $1 })
        contactSectionTitlesUpdated = ["Me", "Groups"]
        contactSectionTitlesUpdated += contactNameTitles
        
    }
    
    func initVM() {
        viewModel.initFetch()
        
        viewModel.reloadCollectionViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.contactListTableView.reloadData()
            }
        }
    }
    private func setupICFabButtons() {
        icFabButton.setTitle("IC", for: .normal)
        icFabButton.backgroundColor = UIColor.darkGray
        icFabButton.layer.cornerRadius = 27
        icFabButton.layer.masksToBounds = true
        icFabButton.layer.zPosition = 1
    }
    @IBAction func icFabButtonAction(_ sender: Any) {
        let contactSearchViewContoller = ContactSearchViewController.instantiateFromStoryboard("Contact", storyboardId: "ContactSearchViewController")
        navigationController?.pushViewController(contactSearchViewContoller, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return contactSectionTitlesUpdated.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return groups.count
        default:
            let contactKey = contactSectionTitlesUpdated[section]
            if let contactValue = contactModelDictionary[contactKey] {
                return contactValue.count
            }
            return 0
        }
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ContactListHeaderView") as? ContactListHeaderView
         headerView?.contactListHeader.text = contactSectionTitlesUpdated[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalCell", for: indexPath) as? PersonalCell
            cell?.translatesAutoresizingMaskIntoConstraints = false
            cell?.contactNameLabel.text = "Jeanette Mchale"
            cell?.mcidLabel.text = "MCID"
            cell?.selectionStyle = .none
            return cell ?? PersonalCell()
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsListCell", for: indexPath) as? GroupsListCell
            cell?.translatesAutoresizingMaskIntoConstraints = false
            cell?.groupNameLabel.text = groups[indexPath.row]
            cell?.selectionStyle = .none
            return cell  ?? GroupsListCell()
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell", for: indexPath) as? ContactListCell
            cell?.delegate = self
            cell?.translatesAutoresizingMaskIntoConstraints = false
            let contactKey = contactSectionTitlesUpdated[indexPath.section]
            if let contactModel = contactModelDictionary[contactKey] {
                cell?.configureChanneListCell(contactVM: contactModel[indexPath.row])
            }
            cell?.selectionStyle = .none
            return cell ?? ContactListCell()
        }
    }
    
     func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return contactNameTitles
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 1:
            let memberDetailVc = GroupsListMemberViewController.instantiateFromStoryboard("Contact", storyboardId: "GroupsListMemberViewController")
            self.navigationController?.pushViewController(memberDetailVc, animated: true)
        default:
            let memberDetailVc = MemberDetailViewController.instantiateFromStoryboard("Contact", storyboardId: "MemberDetailViewController")
            let contactKey = contactSectionTitlesUpdated[indexPath.section]
            if let contactModel = contactModelDictionary[contactKey] {
            memberDetailVc.contactListModel = contactModel[indexPath.row]
                self.navigationController?.pushViewController(memberDetailVc, animated: true)
            }
        }
    }
}
