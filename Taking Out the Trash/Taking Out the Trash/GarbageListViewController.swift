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
    
    @IBOutlet weak var garbageTableView: UITableView!
    
    var garbage: Results<Trash>! {
        didSet {
            garbageTableView.reloadData()
        }
    }
    
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
            let createTrashViewController = segue.destinationViewController as! CreateTrashViewController
            createTrashViewController.fromWhere = "Garbage"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        garbage = RealmHelper.retrieveTrash()
        garbages = Array(garbage)
        garbages = garbages?.filter({$0.type == 3})
        garbageTableView.reloadData()
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

extension GarbageListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garbages?.count ?? 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GarbageCell") as! TrashTableViewCell
        if let garbages = garbages {
            cell.garbageLabel.text = garbages[indexPath.row].name
        }
        return cell
    }
    
    
}