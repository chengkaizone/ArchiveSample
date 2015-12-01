//
//  ViewController.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var archive = ArchiveObject();
        
        var obj = SubObjectOne(rect: CGRectMake(0, 0, 20, 20), person: Person(classId: 3, className: "haha"));
        
        archive.dataArray.append(obj);
        
        var otherObj = obj.copy() as! SubObjectOne;
        
        archive.dataArray.append(otherObj);
        
        var otherArchive = archive.copy() as! ArchiveObject;
        
        if archive.dataArray == otherArchive.dataArray {
            NSLog("数据是引用");
        }
        
        // 修改
        for baseObj:BaseObject in otherArchive.dataArray {
            
            baseObj.age = 123457;
        }
        
        // 验证
        for baseObj:BaseObject in archive.dataArray {
            
            print("\(baseObj.age)");
        }
        
        print("===========================");
        
        for baseObj:BaseObject in otherArchive.dataArray {
            
            print("\(baseObj.age)");
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
        
        
        
        
        print("\(obj.age) , \(obj.name), \(obj.rect), \(obj.person?.classId), \(obj.person?.className)");
        
        print("\(otherObj.age) , \(otherObj.name), \(otherObj.rect), \(otherObj.person?.classId), \(otherObj.person?.className)");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

