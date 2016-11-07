//
//  ViewController.swift
//  ArchiveSample
//
//  Created by lance on 15/11/30.
//  Copyright © 2015年 lance. All rights reserved.
//

import UIKit
import CoreMedia

/** 验证 NSCopying, NSCoding协议 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        validateCoding();

    }

    // 验证复杂对象归档及恢复对象
    func validateCoding() {
        let archive = ArchiveObject();
        let obj = SubObject(rect: CGRect(x:0, y:0, width:20, height:20), person: Person(classId: 3, className: "haha"));
        let obj2 = obj.copy() as! SubObject;
        
        obj2.age = 6543;
        obj2.name = "obj2";
        obj2.rect = CGRect(x:10, y:10, width:30, height:30);
        obj2.person?.classId = 4334;
        obj2.person?.className = "claasName";
        
        archive.dataArray.append(obj);
        archive.dataArray.append(obj2);
        
        // 归档前的数据
        printArchive(archive: archive);
        
        let path = archive.saveToPath();
        
        if path != nil {
            print("path---->\(path!)");
            
            let otherArchive = ArchiveObject.restoreFromPath(path: path!);
            
            if otherArchive != nil {
                // 验证对象恢复
                printArchive(archive: otherArchive!);
            }
            
        }
        
    }
    
    // 验证含继承结构对象的深拷贝---ok
    func validateCopying() {
        let archive = ArchiveObject();
        let obj = SubObject(rect: CGRect(x:0, y:0, width:20, height:20), person: Person(classId: 3, className: "haha"));
        let otherObj = obj.copy() as! SubObject;
        let sub2Obj = Sub2Object(sexName: "呵呵")
        let otherSub2Obj = sub2Obj.copy() as! Sub2Object
        
        archive.dataArray.append(obj);
        archive.dataArray.append(otherObj);
        archive.dataArray.append(sub2Obj);
        archive.dataArray.append(otherSub2Obj);
        
        let otherArchive = archive.copy() as! ArchiveObject;
        
        // 未修改前 验证
        printArchive(archive: archive);
        print("-------------------------");
        printArchive(archive: otherArchive);
        
        print("<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>");
        
        obj.age = 27;
        obj.name = "One";
        obj.person?.classId = 5;
        obj.person?.className = "hehe";
        obj.rect = CGRect(x:10, y:10, width:30, height:30);
        
        otherObj.person?.classId = 15;
        otherObj.person?.className = "hehe56789";
        otherObj.age = 28;
        otherObj.name = "Two";
        otherObj.rect = CGRect(x:10, y:10, width:40, height:40);
        
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
            
            i += 1;
        }
        
        // 验证
        printArchive(archive: archive);
        print("-------------------------");
        printArchive(archive: otherArchive);

        
    }
    
    func printArchive(archive:ArchiveObject) {
        
        for baseObj:BaseObject in archive.dataArray {
            
            let obj = baseObj as! SubObject;
            print("\(obj.age) , \(obj.name), \(obj.rect), \(obj.time), \(obj.person?.classId), \(obj.person?.className)");
        }
    }
    
}

