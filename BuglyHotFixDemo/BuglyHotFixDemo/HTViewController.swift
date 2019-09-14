//
//  ViewController.swift
//  BuglyHotFixDemo
//
//  Created by Richard on 13/9/2019.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit
@objcMembers
class HTViewController: UIViewController {
    //public
//   var pubVariable = "pubVariable"
//      public  var pubVariable = "pubVariable"

  @objc dynamic private var priVariable = "priVariable"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        ViewController.testLog()
//        StructTest.testLog()
//        testLog()
//        extensionTest()
//        let s =  ViewController.instanceMethod(for: #selector(testLog))
//        print("s : ",s)
//        StructTest.testLog()
//        enumTest(language: .Swift)
//        enumTest(language: .Swift)
//
//
//        let struc = ["name":"CGDemo",
//                     "types":"f ",
//                     "keys":"testLog"
//        ]
//        JPEngine.defineStruct(struc)
//        CGDemo().testLog()
        
        
//        let s = CGDemo()
//        print(Unmanaged.passUnretained(s as AnyObject).toOpaque())
//        st(arg: s)
        
//        enumTest(language: .Swift)
//        enumTestNoPar()
//        enumTest(language: .Python)
//        say(hello: "hello")
//        call(name: "tom", eat: "apple")
        call(name: "Tom", eat: "Apple") { res in
            print("res : \(res)")
        }
        
    }
    
    func st(arg: CGDemo){
        print(Unmanaged.passUnretained(arg as AnyObject).toOpaque())
    }

    @IBAction func click(_ sender: Any) {
        testLog()

    }
    dynamic  func enumTestNoPar() {
        print("ViewController orig enumTestNoPar")
    }
    
    dynamic  func enumTest(language :ProgrammingLanguage){
        print("language: \(language.rawValue)")
    }
    
    
    dynamic func testLog() {
        print("ViewController orig testLog")
    }
    
    dynamic  static func testLog() {
        print("ViewController orig static testLog")
    }
    
    dynamic func say(hello : String) {
        print("hello: \(hello)")
    }
    
    dynamic func call(name: String, eat: String) {
        print("call \(name) eat \(eat)");
    }
    
//    typealias  result = (_ result: Bool) -> ()
    
    dynamic func call(name: String, eat: String, result:  (Bool ) -> ()){
        print("call \(name) eat \(eat)")
        result(true)
    }
    
}

struct CGDemo {
    dynamic  func testLog() {
        print("CGDemo orig testLog")
    }
}


@objc
extension UIViewController {
   dynamic func extensionTest(){
        print("ViewController orig extensionTest")
    }
}

@objc enum ProgrammingLanguage : Int {
    case Swift = 0
    case Java = 1
    case Python =  2
}



