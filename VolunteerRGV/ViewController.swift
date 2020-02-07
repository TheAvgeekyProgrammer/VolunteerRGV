//
//  ViewController.swift
//  VolunteerRGV
//
//  Created by Vivianna on 2/7/20.
//  Copyright © 2020 Science Academy TSA. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var ref:DatabaseReference!
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // set the firebase reference
        ref = Database.database().reference()

        // retrieve the posts and listen for changes
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: {(snapshot) in
            // code when child is added under posts
            // take the value from the snapshot and add it to the postData array
            let post = snapshot.value as? String
            if let actualPost = post{
                self.postData.append(actualPost)
                
                // reload tableView
                self.tableView.reloadData()
            }
        
            
        })
        
        
        
        
        
        
        
            // executing code when child is added
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        return cell!
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
