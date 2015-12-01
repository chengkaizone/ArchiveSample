//
//  BaseObject.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class BaseObject: NSObject, NSCopying, NSCoding {
    
    var age:Int;
    
    var name:String;
    
    required override init() {
        self.age = 0;
        self.name = "";
        
        super.init();
    }
    
    init(age:Int, name:String) {
        self.age = age;
        self.name = name;
    }
    
    // NSCopying
    func copyWithZone(zone: NSZone) -> AnyObject {
        
        let obj:BaseObject = self.dynamicType.init();
        obj.age = self.age;
        obj.name = self.name;
        
        self.copyObject(obj);
        return obj;
    }
    
    func copyObject(obj:BaseObject) {
        
        // 由子类实现
    }
    
    
    // NSCoding 协议
    func encodeWithCoder(aCoder: NSCoder) {
        
    }
    
    // NS_DESIGNATED_INITIALIZER
    required init?(coder aDecoder: NSCoder) {
        
        self.age = Int(aDecoder.decodeIntForKey("age"));
        self.name = "";
        
        
        //self.name = aDecoder.decode
    }
    
}
