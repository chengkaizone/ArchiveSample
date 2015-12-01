//
//  Person.swift
//  ArchiveSample
//
//  Created by lance on 15/12/1.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

/** 模拟引用类型 */
class Person: NSObject, NSCopying, NSCoding {
    
    var classId:Int;
    var className:String;
    
    override init() {
        self.classId = 0;
        self.className = "";
        
    }
    
    init(classId:Int, className:String) {
        self.classId = classId;
        self.className = className;
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
    
        let person = Person(classId: self.classId, className: self.className);
        
        return person;
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeInt(Int32(self.classId), forKey: "classId");
        aCoder.encodeObject(self.className, forKey: "className");
    }
    
    // NS_DESIGNATED_INITIALIZER
    required init?(coder aDecoder: NSCoder) {
        
        self.classId = Int(aDecoder.decodeIntForKey("classId"));
        self.className = aDecoder.decodeObjectForKey("className") as! String;
    }
    
}
