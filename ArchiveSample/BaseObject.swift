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
    public func copy(with zone: NSZone? = nil) -> Any {
        let obj:BaseObject = type(of: self).init();
        obj.age = self.age;
        obj.name = self.name;
        
        self.copyObject(obj: obj);
        return obj;
    }
    
    func copyObject(obj:BaseObject) {
        
        // 由子类实现
    }
    
    
    // NSCoding 协议
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.age, forKey: "age");
        aCoder.encode(self.name, forKey: "name");
    }
    
    // NS_DESIGNATED_INITIALIZER
    required init?(coder aDecoder: NSCoder) {
        
        self.age = aDecoder.decodeInteger(forKey: "age");
        
        // Swift中没有对String归档的直接支持,需要转NSString
        self.name = aDecoder.decodeObject(forKey: "name") as! String;
        
    }
    
}
