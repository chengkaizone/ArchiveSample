//
//  SubObjectTwo.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class SubObjectTwo: BaseObject {
    
    var size:CGSize;
    
    var person:Person?;
    
    required init() {
        self.size = CGSizeZero;
        super.init();
    }
    
    init(size:CGSize) {
        self.size = size;
        super.init();
        
        self.age = 12;
        self.name = "SubObjectTwo";
    }
    
    init(size:CGSize, person:Person) {
        self.size = size;
        self.person = person;
        super.init();
        
        self.age = 12;
        self.name = "SubObjectTwo";
    }
    
    override func copyObject(obj:BaseObject) {
        
        let tmpObj = obj as! SubObjectTwo;
        
        tmpObj.size = self.size;
        tmpObj.person = self.person?.copy() as? Person;
        
        // 由子类实现
    }
    
}
