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
    
    var isDraft:Bool = true;
    
    var draftId:Int64 = 0;
    
    override init() {
        dataArray = [BaseObject]();
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let obj = ArchiveObject();
        
        //self.dataArray.unshare();
        obj.dataArray = [BaseObject]();
        
        for tmp:BaseObject in self.dataArray {
            
            obj.dataArray.append(tmp.copy() as! BaseObject);
        }
        
        return obj;
    }

    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.dataArray, forKey: "dataArray");
        
        aCoder.encode(self.isDraft, forKey: "isDraft");
        aCoder.encode(self.draftId, forKey: "draftId");
    }
    
    // NS_DESIGNATED_INITIALIZER
    required init?(coder aDecoder: NSCoder) {
        
        self.dataArray = aDecoder.decodeObject(forKey: "dataArray") as! Array;
        
        self.isDraft = aDecoder.decodeBool(forKey: "isDraft");
        self.draftId = aDecoder.decodeInt64(forKey: "draftId");
    }
    
    // 归档到本地,并返回归档的路径
    func saveToPath() ->String? {
        
        let docDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString;
        
        let fileName = "\(Int64(NSDate().timeIntervalSince1970)).archive";
        let path = docDir.appendingPathComponent(fileName);
        
        let result = NSKeyedArchiver.archiveRootObject(self, toFile: path);
        
        if result {
            return path;
        }
        
        return nil;
    }
    
    // 从指定路径中恢复对象
    class func restoreFromPath(path:String) ->ArchiveObject? {
        
        let obj = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? ArchiveObject;
        
        return obj;
    }

}
