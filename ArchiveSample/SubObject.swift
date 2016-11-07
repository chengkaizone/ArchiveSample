//
//  SubObjectOne.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit
import AVFoundation

class SubObject: BaseObject {
    
    var rect:CGRect;
    
    var time:CMTime!
    
    var person:Person?;
    
    required init() {
        
        self.rect = CGRect.zero;
        self.time = CMTimeMake(30, 30)
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
        
        self.rect = aDecoder.decodeCGRect(forKey: "rect")
        self.person = aDecoder.decodeObject(forKey: "person") as? Person;
        //self.time = aDecoder.decodeTime(forKey: "time")
        
        super.init(coder: aDecoder);
    }
    
    // NSCoding 协议
    override func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.rect, forKey: "rect");
        aCoder.encode(self.person, forKey: "person");
        //aCoder.encode(self.time, forKey: "time")
        
        super.encode(with: aCoder);
    }
    
    override func copyObject(obj:BaseObject) {
        super.copyObject(obj: obj)
        
        let tmpObj = obj as! SubObject;
        
        tmpObj.rect = self.rect;
        tmpObj.person = self.person?.copy() as? Person;
        
        // 由子类实现
    }
    
}
