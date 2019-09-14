defineClass('SwiftDemo.ViewController',[], {
                viewDidLoad: function() {
                    console.log('js viewDidLoad begin-server--')
                    self.ORIGviewDidLoad()
                    console.log('js viewDidLoad end-server--')
                },
            
                testLog:  function() {
                    console.log('js ViewController testlog-server--')
                },
            
                tableView_numberOfRowsInSection: function(tableView, section) {
                    return 10
                },
                xxxx: function() {
                        console.log('-------js----fdsafdsafd-----server--')

                }
            },{
                testLog: function() {
                console.log('-------js----xxxxx------server--')
                }
            
            })

defineClass('SwiftDemo.TestObject', {
	testLog: function() {
		console.log('js TestObject testlog-server--')
	}
})
