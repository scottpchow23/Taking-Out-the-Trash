//
//  RecycleListViewController.swift
//  Taking Out the Trash
//
//  Created by Scott Chow on 6/29/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import UIKit
import RealmSwift

class RecycleListViewController: UIViewController {
    
    var recycle: Results<Trash>! {
        didSet {
        }
    }
    
    var trashCollectionViewController: TrashCollectionViewController?
    
    var recycles: [Trash]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recycle = RealmHelper.retrieveTrash()
        recycles = Array(recycle)
        recycles = recycles?.filter({$0.type == 2})

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier != nil {
            if segue.identifier == "fromRecycle" {
                let createTrashViewController = segue.destinationViewController as! CreateTrashViewController
                createTrashViewController.fromWhere = "Recycle"
                createTrashViewController.numberOfTrash = (recycles?.count)!
            }
            else if segue.identifier == "fromRecycleContainer" {
                trashCollectionViewController = segue.destinationViewController as? TrashCollectionViewController
                trashCollectionViewController?.trashType = 2
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        recycle = RealmHelper.retrieveTrash()
        recycles = Array(recycle)
        recycles = recycles?.filter({$0.type == 2})
        
        trashCollectionViewController?.trashCollection = recycles ?? []
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
