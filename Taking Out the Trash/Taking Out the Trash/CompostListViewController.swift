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
    
    @IBOutlet weak var compostTableView: UITableView!
    
    var compost: Results<Trash>! {
        didSet {
            compostTableView.reloadData()
        }
    }
    
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
            let createTrashViewController = segue.destinationViewController as! CreateTrashViewController
            createTrashViewController.fromWhere = "Compost"
        }
    }

    override func viewWillAppear(animated: Bool) {
        compost = RealmHelper.retrieveTrash()
        composts = Array(compost)
        composts = composts?.filter({$0.type == 1})
        compostTableView.reloadData()
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

extension CompostListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return composts?.count ?? 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CompostCell") as! TrashTableViewCell
        if let composts = composts {
            cell.compostLabel.text = composts[indexPath.row].name
        }
        return cell
    }
}
