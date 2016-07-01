//
//  GarbageListViewController.swift
//  Taking Out the Trash
//
//  Created by Scott Chow on 6/29/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import UIKit
import RealmSwift

class GarbageListViewController: UIViewController {
    
    var garbage: Results<Trash>! {
        didSet {
            
        }
    }
    
    var trashCollectionViewController: TrashCollectionViewController?
    
    var garbages: [Trash]?

    override func viewDidLoad() {
        super.viewDidLoad()
        garbage = RealmHelper.retrieveTrash()
        garbages = Array(garbage)
        garbages = garbages?.filter({$0.type == 3})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier != nil {
            if segue.identifier == "fromGarbage" {
                let createTrashViewController = segue.destinationViewController as! CreateTrashViewController
                createTrashViewController.fromWhere = "Garbage"
                createTrashViewController.numberOfTrash = (garbages?.count)!
            }
            else if segue.identifier == "fromGarbageContainer" {
                trashCollectionViewController = segue.destinationViewController as? TrashCollectionViewController
                trashCollectionViewController?.trashType = 3
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        garbage = RealmHelper.retrieveTrash()
        garbages = Array(garbage)
        garbages = garbages?.filter({$0.type == 3})
        
        trashCollectionViewController?.trashCollection = garbages ?? []
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
