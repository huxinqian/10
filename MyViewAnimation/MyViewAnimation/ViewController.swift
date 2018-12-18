//
//  ViewController.swift
//  MyViewAnimation
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 huxinqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var myView: UIView!
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            (mytimer) in
            self.myView.center.x += 10
        })
    }

    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func go(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            (mytimer) in
            self.myView.center.x += 10
        })
    }
    
    @IBAction func transform(_ sender: Any) {
        timer.invalidate()
            //UIView的animate方法
            //其中第一个参数设置整个动画完成所需要的时间；
            //第二个参数设置延迟多少秒之后将该动画加入线程队列中,
            //第三个是一些动画的参数选项这里选择了动画淡入；
            //第四个参数设置动画的内容，我们只需要设置在动画结束那一个时刻的视图的状态，中间的过渡Swift会帮你计算；
            //最后一个参数是动画整体完成之后的一些设置了。
            UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn,.curveEaseOut], animations: {
                self.myView.alpha = 1
                self.myView.transform = CGAffineTransform(scaleX: 3, y: 4)//设置缩放比例
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))//设置旋转角度
                self.myView.transform = CGAffineTransform.identity//设置还原操作
            }, completion: nil)
    }
    
}

