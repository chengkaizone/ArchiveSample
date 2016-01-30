//
//  Sub2Object.swift
//  ArchiveSample
//
//  Created by lance on 16/1/30.
//  Copyright © 2016年 lance. All rights reserved.
//

import UIKit

class Sub2Object: SubObject {
    
    var sexName: String
    
    required init() {
        self.sexName = "";
        super.init();
    }
    
    init(sexName: String) {
        self.sexName = sexName;
        super.init();
        
        self.age = 13;
        self.name = "Sub2Object";
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.sexName = aDecoder.decodeObjectForKey("sexName") as! String;
        
        super.init(coder: aDecoder);
    }
    
    // NSCoding 协议
    override func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.sexName, forKey: "sexName");
        
        super.encodeWithCoder(aCoder);
    }
    
    override func copyObject(obj:BaseObject) {
        super.copyObject(obj)
        
        let tmpObj = obj as! Sub2Object;
        
        tmpObj.sexName = self.sexName;
        
        // 由子类实现
    }
    
}
