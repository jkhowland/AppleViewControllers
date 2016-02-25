//
//  ThirdViewController.swift
//  AppleViewControllers
//
//  Created by Joshua Howland on 2/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import SafariServices

class ThirdViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBAction func shareButtonTapped(sender: AnyObject) {
        
        if let text = textField.text, url = NSURL(string: text) {
            let viewController = SFSafariViewController(URL: url)
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
