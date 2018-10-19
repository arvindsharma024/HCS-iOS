//
//  LandingViewController.swift
//  mcpttapp
//
//  Created by Sunil Kumar Yadav on 08/10/18.
//  Copyright © 2018 Harman connected services. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var scrollPager: ScrollPager!
    
     var channelListViewController: ChannelListViewController?
    
     var contactListViewController: ContactListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "MCPTT"
        scrollPager.delegate = self
        
         channelListViewController = ChannelListViewController.instantiate(storyboardName: "Channel", storyboardId: "ChannelListViewController")
        
        contactListViewController = ContactListViewController.instantiate(storyboardName: "Contact", storyboardId: "ContactListViewController")
        
        if let channelListViewController = channelListViewController {
            addChildViewController(channelListViewController)
            view.addSubview(channelListViewController.view)
            channelListViewController.didMove(toParentViewController: self)
        }
        
        if let contactListViewController = contactListViewController {
            addChildViewController(contactListViewController)
            view.addSubview(contactListViewController.view)
            contactListViewController.didMove(toParentViewController: self)
        }
        
        if let channelView = channelListViewController?.view, let contactListView = contactListViewController?.view {
            
            scrollPager.addSegmentsWithTitlesAndViews(segments: [
                ("CHANNELS", channelView),
                ("CONTACTS", contactListView)
                ])
        }
        
        let settingImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysTemplate)
        let settingButton = UIBarButtonItem(image: settingImage, style: .plain, target: self, action: #selector(handleSettings))
        settingButton.tintColor = .gray
        
        navigationItem.rightBarButtonItems = [settingButton]
    }
    
    @objc func handleSettings() {
        var actions: [(String, UIAlertActionStyle)] = []
        actions.append(("Settings", UIAlertActionStyle.default))
        actions.append(("Sign Out", UIAlertActionStyle.default))
        actions.append(("Cancel", UIAlertActionStyle.cancel))
        
        CommonUtility.showActionsheet(viewController: self, title: nil, message: nil, actions: actions) { (index) in
            switch index {
            case 0:
                 let settingViewController = SettingsViewController.instantiateFromStoryboard("Setting", storyboardId: "SettingsViewController")
                 self.navigationController?.pushViewController(settingViewController, animated: true)
            case 1:
                let loginViewController = LoginViewContoller.instantiateFromStoryboard("Login", storyboardId: "LoginViewContoller")
                AppDelegate.sharedDelegate()?.window?.rootViewController = loginViewController
            return
            default:
                return
            }
        }
    }
}
extension LandingViewController: ScrollPagerDelegate {
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int) {
        print("scrollPager index changed: \(changedIndex)")
    }
}
