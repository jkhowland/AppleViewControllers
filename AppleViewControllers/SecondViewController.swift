//
//  SecondViewController.swift
//  AppleViewControllers
//
//  Created by Joshua Howland on 2/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBAction func share(sender: AnyObject) {
        
        if let image = imageView.image {
            let viewController = UIActivityViewController(activityItems: [image], applicationActivities: [])
            
            viewController.completionWithItemsHandler = { activityType, completed, items, error in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            presentViewController(viewController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func updateImageTapped(sender: AnyObject) {
    
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        let photoChoiceAlert = UIAlertController(title: "Select Photo Location:", message: nil, preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
        
            photoChoiceAlert.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { _ in
               
                imagePicker.sourceType = .Camera
                self.presentViewController(imagePicker, animated: true, completion: nil)
                
            }))
        }
        
        photoChoiceAlert.addAction(UIAlertAction(title: "Library", style: .Default, handler: { _ in
           
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }))
        
        photoChoiceAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(photoChoiceAlert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        if let editedVersion = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageView.image = editedVersion
        } else {
            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
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

