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
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let person = Person(classId: self.classId, className: self.className);
        
        return person;
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.classId, forKey: "classId");
        aCoder.encode(self.className, forKey: "className");
    }
    
    // NS_DESIGNATED_INITIALIZER
    required init?(coder aDecoder: NSCoder) {
        
        self.classId = aDecoder.decodeInteger(forKey: "classId")
        self.className = aDecoder.decodeObject(forKey: "className") as! String;
    }
    
}
