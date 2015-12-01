//
//  ViewController.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

/** 验证 NSCopying, NSCoding协议 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        validateCopying();
        
        //validateCoding();
        
    }

    // 验证含继承结构对象的深拷贝
    func validateCopying() {
        let archive = ArchiveObject();
        let obj = SubObjectOne(rect: CGRectMake(0, 0, 20, 20), person: Person(classId: 3, className: "haha"));
        let otherObj = obj.copy() as! SubObjectOne;
        
        archive.dataArray.append(obj);
        archive.dataArray.append(otherObj);
        
        let otherArchive = archive.copy() as! ArchiveObject;
        
        // 修改
        for baseObj:BaseObject in otherArchive.dataArray {
            
            let obj = baseObj as! SubObjectOne;
            
            obj.age = 123457;
            obj.person = nil;
        }
        
        // 验证
        for baseObj:BaseObject in archive.dataArray {
            
            let obj = baseObj as! SubObjectOne;
            print("\(obj.age) , \(obj.name), \(obj.rect), \(obj.person?.classId), \(obj.person?.className)");
        }
        
        print("===========================");
        
        for baseObj:BaseObject in otherArchive.dataArray {
            
            let obj = baseObj as! SubObjectOne;
            print("\(obj.age) , \(obj.name), \(obj.rect), \(obj.person?.classId), \(obj.person?.className)");
        }
        
        //        obj.age = 27;
        //        obj.name = "One";
        //        obj.person?.classId = 5;
        //        obj.person?.className = "hehe";
        //        obj.rect = CGRectMake(10, 10, 30, 30);
        //
        //
        //        otherObj.person?.classId = 15;
        //        otherObj.person?.className = "hehe56789";
        //        otherObj.age = 28;
        //        otherObj.name = "Two";
        //        otherObj.rect = CGRectMake(10, 10, 40, 40);
        
        //        print("\(obj.age) , \(obj.name), \(obj.rect), \(obj.person?.classId), \(obj.person?.className)");
        //
        //        print("\(otherObj.age) , \(otherObj.name), \(otherObj.rect), \(otherObj.person?.classId), \(otherObj.person?.className)");
        
    }
    
    func validateCoding() {
        
        
    }
    
}

