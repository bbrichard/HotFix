
defineClass(
            'BuglyHotFixDemo.ViewController',
            [],
            {
            viewDidLoad: function() {
                require('UIView')
                var view = UIView.alloc().init()
                view.setBackgroundColor(require('UIColor').grayColor())
                view.setAlpha(0.5)
                self.ORIGviewDidLoad()

            },
            },
            {
            
            })
            
            


