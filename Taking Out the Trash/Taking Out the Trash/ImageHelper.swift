//
//  ImageHelper.swift
//  Taking Out the Trash
//
//  Created by Sahith Bhamidipati on 7/1/16.
//  Copyright © 2016 Scott Chow. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
//    static var compostImages: [UIImage?] = []
//    static var recycleImages: [UIImage?] = []
//    static var garbageImages: [UIImage?] = []
    
    static func insertCompostImage(image: UIImage, count: Int) -> String{
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let fileName = "a\(count)"
        path = path + fileName
        UIImagePNGRepresentation(image)?.writeToFile(path, atomically: true)
        return fileName
    }
    static func insertRecycleImage(image: UIImage, count: Int) -> String{
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let fileName = "b\(count)"
        path = path + fileName
        UIImagePNGRepresentation(image)?.writeToFile(path, atomically: true)
        return fileName
    }

    static func insertGarbageImage(image: UIImage, count: Int) -> String{
        var path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let fileName = "c\(count)"
        path = path + fileName
        UIImagePNGRepresentation(image)?.writeToFile(path, atomically: true)
        return fileName
    }
    
    static func replaceImage(image: UIImage, fileName: String) {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] + fileName
        UIImagePNGRepresentation(image)?.writeToFile(path, atomically: true)
    }

}