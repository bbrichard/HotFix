
defineClass(
            'BuglyHotFixDemo.HTViewController',
            [],
            {
                viewDidLoad: function() {
//                    console.log('js viewDidLoad begin')
                    self.ORIGviewDidLoad()
//                    console.log('js viewDidLoad end')
                },
            
//                testLog:  function() {
//                    console.log('js ViewController testlog')
////    ======================public 变量 start=====================
//                    var data = self.pubVariable()
//                    console.log('pubVariable output: ' + data.toJS())
////                    调用set方法
//                    self.setPubVariable('JSPatchP---pubVariable')
////                  调用get方法
//                    console.log('change---------: ' + self.pubVariable().toJS())
////    ======================public 变量 end=====================

////    ======================private 变量 start=====================
//                var privateData = self.priVariable()
//                console.log('priVariable output: ' + privateData.toJS())
//
//                self.setPriVariable('Private JSPatch')
//                console.log('priVariable output: ' + self.priVariable().toJS())
////    ======================private 变量 end=====================

//                },
////    ====================== extension start=====================
//            extensionTest: function(){
//                console.log('------js-----extensionTest---')
//            }
////    ====================== extension end=====================
            
            
////    ====================== enum start===================
       
//            enumTestWithLasnguage:function(language){
//                console.log('----js-----' +  language)
//            },
//            enumTestNoPar: function() {
//             console.log('-------js----enumTestNoPar-----')
//
//            }
////    ====================== enum end=====================
//            sayWithHello: function(hello) {
//                console.log('------js------' + hello.toJS())
//            }
//            callWithName_eat: function(name, fruit) {
//                console.log('-------js----- call' + name.toJS() + ' eat ' + fruit.toJS())
//            }
//                callWithName_eat_result: function(name, fruit, result) {
//
//                }
            callWithName_eat_result: function (name, fruit, result){
                console.log('----js-fruit----   ' + result )
                result(false)
            }
            },
            {
                testLog: function() {
                console.log('-------js----xxxxx-----')
                }
            
            }
)



defineClass( 'BuglyHotFixDemo.CGDemo',[],{
            testLog : function() {
                console.log('-------js----Struct-----inst-')
            }
            },{
            testLog : function() {
            console.log('-------js----Struct-----cls---')
            }
            })
