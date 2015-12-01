//
//  ArchiveObject.swift
//  ArchiveSample
//
//  Created by lance on 15/12/1.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class ArchiveObject: NSObject, NSCopying {
    
    var dataArray:[BaseObject];
    
    override init() {
        dataArray = [BaseObject]();
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        let obj = ArchiveObject();
        
        //self.dataArray.unshare();
        obj.dataArray = self.dataArray;
        
        return obj;
    }

}
