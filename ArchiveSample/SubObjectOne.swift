//
//  SubObjectOne.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class SubObjectOne: BaseObject {
    
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
        self.name = "SubObjectOne";
    }
    
    init(rect:CGRect, person:Person) {
        self.rect = rect;
        self.person = person;
        super.init();
        
        self.age = 10;
        self.name = "SubObjectOne";
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func copyObject(obj:BaseObject) {
        
        let tmpObj = obj as! SubObjectOne;
        
        tmpObj.rect = self.rect;
        tmpObj.person = self.person?.copy() as? Person;
        
        // 由子类实现
    }
    
}
