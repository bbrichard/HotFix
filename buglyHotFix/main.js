defineClass("BuglyHotFixDemo.ViewController", [], {
    viewDidLoad: function() {
        console.log("js viewDidLoad begin---bugly-server");
        self.ORIGviewDidLoad();
        console.log("js viewDidLoad end---bugly-server");
    },
    testLog: function() {
        console.log("js ViewController testlog---bugly-server");
    },
    tableView_numberOfRowsInSection: function(tableView, section) {
        return 10;
    },
    xxxx: function() {
        console.log("-------js----fdsafdsafd--------bugly-server");
    }
}, {
    testLog: function() {
        console.log("-------js----xxxxx--------bugly-server");
    }
});