//
//  CreateTrashViewController.swift
//  Taking Out the Trash
//
//  Created by Scott Chow on 6/29/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import UIKit
import RealmSwift

class CreateTrashViewController: UIViewController {
    
    var fromWhere: String = ""
    
    @IBOutlet weak var trashNameTextField: UITextField!
    
    @IBAction func saveTrash(sender: AnyObject) {
        let newTrash: Trash = Trash()
        if (trashNameTextField.text != nil) && (trashNameTextField.text != ""){
            newTrash.name = trashNameTextField.text!
        }
        if fromWhere == "Compost" {
            newTrash.type = 1
        }
        else if fromWhere == "Recycle" {
            newTrash.type = 2
        }
        else if fromWhere == "Garbage" {
            newTrash.type = 3
        }
        RealmHelper.addTrash(newTrash)
        self.navigationController?.popViewControllerAnimated(true)
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
