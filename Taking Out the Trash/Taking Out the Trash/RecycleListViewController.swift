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

    @IBOutlet weak var recycleTableView: UITableView!
    
    var recycle: Results<Trash>! {
        didSet {
            recycleTableView.reloadData()
        }
    }
    
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
            let createTrashViewController = segue.destinationViewController as! CreateTrashViewController
            createTrashViewController.fromWhere = "Recycle"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        recycle = RealmHelper.retrieveTrash()
        recycles = Array(recycle)
        recycles = recycles?.filter({$0.type == 2})
        recycleTableView.reloadData()
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

extension RecycleListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recycles?.count ?? 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecycleCell") as! TrashTableViewCell
        if let recycles = recycles{
            cell.recycleLabel.text = recycles[indexPath.row].name
        }
        return cell
    }
}
