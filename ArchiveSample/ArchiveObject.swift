//
//  ArchiveObject.swift
//  ArchiveSample
//
//  Created by lance on 15/12/1.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class ArchiveObject: NSObject, NSCopying, NSCoding {
    
    var dataArray:[BaseObject];
    
    override init() {
        dataArray = [BaseObject]();
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        let obj = ArchiveObject();
        
        //self.dataArray.unshare();
        obj.dataArray = [BaseObject]();
        
        for tmp:BaseObject in self.dataArray {
            
            obj.dataArray.append(tmp.copy() as! BaseObject);
        }
        
        return obj;
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.dataArray, forKey: "dataArray");
    }
    
    // NS_DESIGNATED_INITIALIZER
    required init?(coder aDecoder: NSCoder) {
        
        self.dataArray = aDecoder.decodeObjectForKey("dataArray") as! Array;
    }
    
    // 归档到本地,并返回归档的路径
    func saveToPath() ->String? {
        
        let docDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString;
        
        let fileName = "\(Int64(NSDate().timeIntervalSince1970)).archive";
        let path = docDir.stringByAppendingPathComponent(fileName);
        
        let result = NSKeyedArchiver.archiveRootObject(self, toFile: path);
        
        if result {
            return path;
        }
        
        return nil;
    }
    
    // 从指定路径中恢复对象
    class func restoreFromPath(path:String) ->ArchiveObject? {
        
        let obj = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? ArchiveObject;
        
        return obj;
    }

}
