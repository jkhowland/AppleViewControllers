//
//  FirstViewController.swift
//  AppleViewControllers
//
//  Created by Joshua Howland on 2/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import MessageUI

class FirstViewController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet var songTextField: UITextField!
    
    @IBAction func shareButtonTapped() {
        
        let shareViewController = MFMailComposeViewController()
        
        shareViewController.setToRecipients(["me@jkhowland.com"])
        shareViewController.setSubject("Favorite Song")
        
        if let song = songTextField.text {
            shareViewController.setMessageBody(song, isHTML: false)
        }
        
        
        shareViewController.mailComposeDelegate = self
        
        presentViewController(shareViewController, animated: true, completion: nil)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
            
        print(error)
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

