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
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var takePictureButton: UIButton!
    
    var fromWhere: String = ""
    var numberOfTrash = 0
    var photoTakingHelper: PhotoTakingHelper?
    var gotImage: UIImage?
    var trash: Trash?
    
    @IBOutlet weak var trashNameTextField: UITextField!
    
    @IBAction func saveTrash(sender: AnyObject) {
        let newTrash: Trash = Trash()
        if (trashNameTextField.text != nil) && (trashNameTextField.text != ""){
            newTrash.name = trashNameTextField.text!
        }
        if fromWhere == "Compost" {
            newTrash.type = 1
            if let gotImage = gotImage {
                //ImageHelper.compostImages.append(nil)
                newTrash.fileName = ImageHelper.insertCompostImage(gotImage, count: numberOfTrash)
            } else {
                newTrash.fileName = "a\(numberOfTrash)"
            }
        }
        else if fromWhere == "Recycle" {
            newTrash.type = 2
            if let gotImage = gotImage {
                //ImageHelper.compostImages.append(nil)
                newTrash.fileName = ImageHelper.insertRecycleImage(gotImage, count: numberOfTrash)
            } else {
                newTrash.fileName = "b\(numberOfTrash)"
            }
        }
        else if fromWhere == "Garbage" {
            newTrash.type = 3
            if let gotImage = gotImage {
                //ImageHelper.compostImages.append(nil)
                newTrash.fileName = ImageHelper.insertGarbageImage(gotImage, count: numberOfTrash)
            } else {
                newTrash.fileName = "c\(numberOfTrash)"
            }
        }
        
        if let trash = trash {
            if let gotImage = gotImage {
                ImageHelper.replaceImage(gotImage, fileName: trash.fileName)
            }
            newTrash.fileName = trash.fileName
            RealmHelper.updateTrash(trash, newTrash: newTrash)
        } else {
            RealmHelper.addTrash(newTrash)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        photoTakingHelper = PhotoTakingHelper(viewController: self) { (trashImage) in
            self.gotImage = trashImage
            
            
            
            
            if self.fromWhere == "Compost" {
                //ImageHelper.compostImages.append(trashImage)
            }
            else if self.fromWhere == "Recycle" {
                //ImageHelper.recycleImages.append(trashImage)
            }
            else if self.fromWhere == "Garbage" {
                //ImageHelper.garbageImages.append(trashImage)
            }
            self.takePictureButton.setBackgroundImage(trashImage, forState: .Normal)
            self.takePictureButton.setTitle("", forState: .Normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.enabled = false
        if let trash = trash {
            trashNameTextField.text = trash.name
            saveButton.enabled = true
            
            
            
            var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
            path = path + trash.fileName
            if let image = UIImage(contentsOfFile: path) {
                
                self.takePictureButton.setTitle("", forState: .Normal)
                
                
                takePictureButton.setBackgroundImage(image, forState: .Normal)
            }
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func trashEdited(sender: AnyObject) {
        let textField = sender as! UITextField
        if textField.text != "" {
            saveButton.enabled = true
        }
        else {
            saveButton.enabled = false
        }
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

