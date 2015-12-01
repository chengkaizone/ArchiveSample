//
//  SubObjectOne.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class SubObject: BaseObject {
    
    var rect:CGRect;
    
    var person:Person?;
    
    required init() {
        self.rect = CGRectZero;
        super.init();
    }
    
    init(rect:CGRect) {
        self.rect = rect;
        
        super.init();
        
        self.age = 10;
        self.name = "SubObject";
    }
    
    init(rect:CGRect, person:Person) {
        self.rect = rect;
        self.person = person;
        super.init();
        
        self.age = 10;
        self.name = "SubObject";
    }

    required init?(coder aDecoder: NSCoder) {
        
        self.rect = aDecoder.decodeCGRectForKey("rect");
        self.person = aDecoder.decodeObjectForKey("person") as? Person;
        
        super.init(coder: aDecoder);
    }
    
    // NSCoding 协议
    override func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeCGRect(self.rect, forKey: "rect");
        aCoder.encodeObject(self.person, forKey: "person");
        
        super.encodeWithCoder(aCoder);
    }
    
    override func copyObject(obj:BaseObject) {
        
        let tmpObj = obj as! SubObject;
        
        tmpObj.rect = self.rect;
        tmpObj.person = self.person?.copy() as? Person;
        
        // 由子类实现
    }
    
}
