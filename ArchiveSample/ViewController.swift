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
        
        
        //validateCopying();
        
        validateCoding();
        
    }

    // 验证复杂对象归档及恢复对象
    func validateCoding() {
        let archive = ArchiveObject();
        let obj = SubObject(rect: CGRectMake(0, 0, 20, 20), person: Person(classId: 3, className: "haha"));
        let obj2 = obj.copy() as! SubObject;
        
        obj2.age = 6543;
        obj2.name = "obj2";
        obj2.rect = CGRectMake(10, 10, 30, 30);
        obj2.person?.classId = 4334;
        obj2.person?.className = "claasName";
        
        archive.dataArray.append(obj);
        archive.dataArray.append(obj2);
        
        // 归档前的数据
        printArchive(archive);
        
        let path = archive.saveToPath();
        
        if path != nil {
            print("path---->\(path!)");
            
            let otherArchive = ArchiveObject.restoreFromPath(path!);
            
            if otherArchive != nil {
                // 验证对象恢复
                printArchive(otherArchive!);
            }
            
        }
        
    }
    
    // 验证含继承结构对象的深拷贝---ok
    func validateCopying() {
        let archive = ArchiveObject();
        let obj = SubObject(rect: CGRectMake(0, 0, 20, 20), person: Person(classId: 3, className: "haha"));
        let otherObj = obj.copy() as! SubObject;
        
        archive.dataArray.append(obj);
        archive.dataArray.append(otherObj);
        
        let otherArchive = archive.copy() as! ArchiveObject;
        
        // 未修改前 验证
        printArchive(archive);
        print("-------------------------");
        printArchive(otherArchive);
        
        print("<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>");
        
        obj.age = 27;
        obj.name = "One";
        obj.person?.classId = 5;
        obj.person?.className = "hehe";
        obj.rect = CGRectMake(10, 10, 30, 30);
        
        otherObj.person?.classId = 15;
        otherObj.person?.className = "hehe56789";
        otherObj.age = 28;
        otherObj.name = "Two";
        otherObj.rect = CGRectMake(10, 10, 40, 40);
        
        var i=0;
        // 修改后的验证
        for baseObj:BaseObject in otherArchive.dataArray {

            let obj = baseObj as! SubObject;
    
            if i == 0 {
                obj.age = 123457;
                obj.name = "Third";
                obj.person = nil;
            }else if i == 1 {
                obj.age = 765432;
                obj.name = "Fourth";
                obj.person?.classId = 65324;
                obj.person?.className = "class";
            }
            
            i++;
        }
        
        // 验证
        printArchive(archive);
        print("-------------------------");
        printArchive(otherArchive);

        
    }
    
    func printArchive(archive:ArchiveObject) {
        
        for baseObj:BaseObject in archive.dataArray {
            
            let obj = baseObj as! SubObject;
            print("\(obj.age) , \(obj.name), \(obj.rect), \(obj.person?.classId), \(obj.person?.className)");
        }
    }
    
}

