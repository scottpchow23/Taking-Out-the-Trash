//
//  Trash.swift
//  Taking Out the Trash
//
//  Created by Scott Chow on 6/29/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import Foundation
import RealmSwift

class Trash: Object {
    
    enum TrashType: Int{
        case Compost = 1,
             Recycle,
             Garbage
    }
    
    dynamic var name = ""
    dynamic var type = 1
    dynamic var fileName = ""
    
}
