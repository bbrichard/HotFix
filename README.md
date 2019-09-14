#jsptch
JS 传递字符串给 OC，OC 通过 Runtime 接口调用和替换 OC 方法。

## 声明
### 类的继承

在 swift 中支持热更新的类必须继承 **NSObject**, 如:

**支持**
```
class DemoClass: UIViewController { }
or 
class DemoClass: NSObject { }
```
**不支持**
```
class DemoClass { }
```

### **Function**
如果没有在类的开始使用 **@objcMembers**,则需要在方法前面添加 **@objc**  和 **dynamic**

1、不使用 **objcMembers** 例：
```
class DemoClass: UIViewController {
    @objc  dynamic func testLog() {
        //方法内容
    }
}
```
2、使用 **objcMembers** 例：
```
@objcMembers
class DemoClass: UIViewController {
    dynamic func testLog() {
        //方法内容
    }
}
```
3、**Static Function**
```
@objcMembers
class DemoClass: UIViewController {
    dynamic static func testLog() {
        //方法内容
    }
}
```

4、**Class Function**
```
@objcMembers
class DemoClass: UIViewController {
    dynamic class func testLog() {
        //方法内容
    }
}
```
5、**Function with argc**

**🤞一个参数**

**Swift**
```
dynamic func say(hello : String) {
        print("hello: \(hello)")
}
```
**Js**
```
 sayWithHello: function(hello) {
                console.log('------js------' + hello.toJS())
 }
```

**✌️多个参数**

**Swift**
```
dynamic func call(name: String, eat: String) {
    print("call \(name) eat \(eat)");
}
```

**js**
```
callWithName_eat: function(name, fruit) {
    console.log(name.toJS() + ' eat ' + fruit.toJS())
}
```
**🖖参数中带有block**

注意点：**Swift** 中的 **block** 必须用 **@escaping** 修饰

**Swift**
```
dynamic func call(name: String, eat: String, result:  @escaping (Bool ) -> ()){
        print("call \(name) eat \(eat)")
        result(true)
 }
```
**js**
```
callWithName_eat_result: function (name, fruit, result){
    console.log('----js-fruit----   ' + result )
    result(false)
}
```




### **Variable**
1、 **public Variable**

 在 swift 中声明
 ```
 var pubVariable = "pubVariable"
 public  var pubVariable = "pubVariable"
 ```
 在 js 中写法
 ```
 读：self.pubVariable()
 写：self.setPubVariable('value')
 ```
 
 2、**private Variable**
 
  在 swift 中声明
  注：必须添加 **@objc dynamic** 关键词修饰。

  ```
  @objc dynamic private var priVariable = "priVariable"
  ```
  
  在 js 中写法
  
```
读： self.priVariable()
    
写：self.setPriVariable('Private JSPatch')
```

 

### extension
即使 **extension** 扩展了一个 **NSObject** 类，但是 **Xcode** 在处理语义的时候依旧认为 **extension UIViewController {}** 不是继承 **NSObject** ，故不能使用 **@objcMembers**修饰，需要使用 **@objc**

```
swift:

@objc
extension UIViewController {
   dynamic func extensionTest(){
        print("ViewController orig extensionTest")
    }
}

js:

extensionTest: function(){
                console.log('------js-----extensionTest---')
            }
```
### struct
### enum
**enum** 在热更新中的限制：
1、不能使用除整形之外的类型，如 **String**
```
@objc enum ProgrammingLanguage : String {
    case Swift = "Swift"
    case Java = "Java"
    case Python =  "Python"
}
```

2、**enum** 要加 **@objc** 修饰
````
@objc enum ProgrammingLanguage : Int {
    case Swift = 0
    case Java = 1
    case Python =  2
}
//这种写法在 OC 中无法调用
````
3、函数参数中带有 **enum** 在 **js** 中怎么写


在 **Swift** 中的写法
```
dynamic  func enumTest(language :ProgrammingLanguage){
        print("language: \(language.rawValue)")
}
```
在 **js** 中的写法
```
enumTestWithLasnguage:function(language){
    console.log('----js-----' +  language)
}
```




### Block

#关键词解释
##@objc修饰符
* 允许该函数在 运行时 通过OC的消息机制被调用。
* 重新声明方法或者变量的名字。

```
init(name: String) -> -initWithName:(NSString *)name
```

## dynamic
添加 @objc 修饰符并不意味着这个方法或者属性会变成动态派发，Swift 依然可能会将其优化为静态调用。如果你需要和 Objective-C 里动态调用时相同的运行时特性的话，你需要使用的修饰符是 dynamic。

## Static & Class
**Class func**  子类可以重写 
**Static func** 子类不可重写

## @Objc &  @objcMembers
https://www.hackingwithswift.com/example-code/language/what-is-the-objcmembers-attribute

## @noescape &  @escaping
**@noescape**: 非逃逸闭包
**@escaping**: 逃逸闭包

##参考 
https://tech.meituan.com/2018/08/23/deep-understanding-of-jscore.html



Invocation list 调用列表


如果可以在swift 中可以通过 runtime 的方法替换 struc 的 func, 则意味着 jspatch 可以添加swift 的支持