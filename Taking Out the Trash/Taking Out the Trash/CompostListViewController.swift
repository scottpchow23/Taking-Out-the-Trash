//
//  CompostListViewController.swift
//  Taking Out the Trash
//
//  Created by Scott Chow on 6/29/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import UIKit
import RealmSwift

class CompostListViewController: UIViewController {
    
    var compost: Results<Trash>! {
        didSet {
        }
    }
    
    var trashCollectionViewController: TrashCollectionViewController?
    
    var composts: [Trash]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        compost = RealmHelper.retrieveTrash()
        composts = Array(compost)
        composts = composts?.filter({$0.type == 1})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier != nil {
            if segue.identifier == "fromCompost" {
                let createTrashViewController = segue.destinationViewController as! CreateTrashViewController
                createTrashViewController.fromWhere = "Compost"
                createTrashViewController.numberOfTrash = (composts?.count)!
            }
            else if segue.identifier == "fromCompostContainer" {
                trashCollectionViewController = segue.destinationViewController as? TrashCollectionViewController
                trashCollectionViewController?.trashType = 1
                
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        compost = RealmHelper.retrieveTrash()
        composts = Array(compost)
        composts = composts?.filter({$0.type == 1})

        trashCollectionViewController!.trashCollection = composts ?? []
        
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
