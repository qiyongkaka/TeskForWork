import UIKit
class ViewControllerB :UIViewController{
    //闭包定义
    var closure:((Int,String)->())?
    override func viewDidLoad() {
        
        self.view.backgroundColor = .brown
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //闭包调用
        closure!(1314,"Hyx Love Hxy")
        self.dismiss(animated: true)
    }
}
