//
//  Person.swift
//  ArchiveSample
//
//  Created by lance on 15/12/1.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class Person: NSObject, NSCopying {
    
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
    
}
