//
//  testSwiftOb.swift
//  testCi
//
//  Created by xzming on 2019/2/26.
//  Copyright © 2019年 HZMC. All rights reserved.
//

import UIKit

protocol TestProt {
    func testprotm(param test: Int)->Int
}

struct Size : TestProt{
    var width : Float
    var height : Float
    
    func testprotm() -> Int {
        return 1;
    }
    
    func testprotm(param test: Int) -> Int {
        return test;
    }
}

extension Size{
    subscript(index:Int) -> Float{
        assert(index<2, "testmsg")
        if (0 == index%2){
            return self.width
        }else{
            return self.height
        }
    }
    
    func square() -> Float {
        return width * height
    }
}

@objc class testSwiftOb: NSObject {
    var aTestView : TestCview?
    var observer : NSKeyValueObservation?
    let consta : Int
    @objc convenience init(withTest val: Int){
        self.init(val);
    }
    
    
    init(_ val: Int) {
        self.consta = val
        var sa = Size(width: 10, height: 20)
        print("test size square: \(sa.square()), sub0: \(sa[0]), sub1: \(sa[1])")
//        print("test assert \(sa[2])")
    }
    
    @objc func createTestView() -> TestCview{
        aTestView = TestCview.init()
        observer = aTestView?.observe(\.backgroundColor, options: [.old, .new], changeHandler: { (object : TestCview, change) in
            print("view backgroundcolor changed: \(String(describing: change.newValue))")
        })
        return aTestView!
    }
    
}
