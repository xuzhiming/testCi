//
//  testSwiftObA.swift
//  testCi
//
//  Created by xzming on 2019/2/26.
//  Copyright © 2019年 HZMC. All rights reserved.
//

import UIKit

@objc protocol TestProtocol {
    init(parm : Int)
    func testName();
    
}

class testSwiftObA: NSObject, TestProtocol{
    required init(parm: Int) {
        
    }
    
    func testName() {
        
    }
    
   
    func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }
    
    var testA : String?
    let floatv : Float = 4
    @objc func testsum(_ a : Int, b : Int) -> Int {
        return a+b
    }
    
    @objc func testStr(_ str: TestProtocol) -> TestProtocol {
        return str;
    }
    
    func testmax<T : Comparable>(_ values : [T]) -> T {
        return values.max(by: { ( L, R) -> Bool in
            return L <= R
        })!
       
    }
    
    @objc func testfa() -> Void {
        let arrayv = [1, 2, 3, 4] as [Int]
        let strarray = arrayv.compactMap { (Int) -> String? in
            return String(Int)
        }
        
        var possibleNumbers = ["1", "2", "three", "///4///", "5"]
        possibleNumbers.sort { (L, R) -> Bool in
            return L > R
        }
        
        let testp = possibleNumbers.map { (str) -> Int! in
            return Int(str)
        }
        
        let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
        // [1, 2, nil, nil, 5]
        
        let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
        // [1, 2, 5]
        
        NSLog("string : %@", strarray)
    }
    
}
