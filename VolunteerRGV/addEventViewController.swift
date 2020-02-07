//
//  addEventViewController.swift
//  VolunteerRGV
//
//  Created by Vivianna on 2/6/20.
//  Copyright © 2020 Science Academy TSA. All rights reserved.
//

import UIKit
import FirebaseDatabase

class addEventViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPost(_ sender: Any) {
        // Post the data to firebase
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        
        //  Dispose of any resources that can be created
        // closes out of the window
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancelPost(_ sender: Any) {
    
        
        // Dismiss the popover
        // closes out of the window
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
