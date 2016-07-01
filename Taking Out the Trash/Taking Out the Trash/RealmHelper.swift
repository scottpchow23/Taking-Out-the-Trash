//
//  RealmHelper.swift
//  Taking Out the Trash
//
//  Created by Scott Chow on 6/29/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func addTrash(trash: Trash) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(trash)
        }
    }
    
    static func deleteTrash(trash: Trash) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(trash)
        }
    }
    
    static func retrieveTrash() -> Results<Trash> {
        let realm = try! Realm()
        let trashObs = realm.objects(Trash)
        return trashObs
    }
    
    static func updateTrash(trashToBeEdited: Trash, newTrash: Trash) {
        let realm = try! Realm()
        try! realm.write() {
            trashToBeEdited.name = newTrash.name
            trashToBeEdited.fileName = newTrash.fileName
        }
    }
}