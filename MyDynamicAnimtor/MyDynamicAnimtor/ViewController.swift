//
//  ViewController.swift
//  MyDynamicAnimtor
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 huxinqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    lazy var animator = UIDynamicAnimator(referenceView: self.backView)
    let gravity = UIGravityBehavior()
    let collsion = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        animator.addBehavior(gravity)
        animator.addBehavior(collsion)
        
        
        //将边界设置为碰撞的参考
        collsion.translatesReferenceBoundsIntoBoundary = true
    }

    @IBAction func add(_ sender: Any) {
        //随机位置
        let width = Int(backView.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x: randx, y: 0, width: width, height: width))
        label.text = "H"
        label.backgroundColor = UIColor.white
        label.textAlignment = .center
        
        backView.addSubview(label)
        gravity.addItem(label)
        collsion.addItem(label)
    }
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        for item in self.backView.subviews{
            if item is UILabel{
                item.removeFromSuperview()
                gravity.removeItem(item)
                collsion.removeItem(item)
            }
        }
    }
}

