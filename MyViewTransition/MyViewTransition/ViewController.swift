//
//  ViewController.swift
//  MyViewTransition
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 huxinqian. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var firstView: UIView!
    var secondView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        transition()
    }
    func transition() {
        let btn = UIButton(frame: CGRect(x:150, y: 600, width: 100, height: 30))
        btn.setTitle("change", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        self.view.addSubview(btn)
        
        firstView = UIView(frame: CGRect(x: 150, y: 300, width: 100, height: 100))
        firstView.backgroundColor = UIColor.purple
        self.view.addSubview(firstView)
        
        secondView = UIView(frame: CGRect(x: 150, y: 300, width: 100, height: 100))
        secondView.backgroundColor = UIColor.blue
        self.view.addSubview(secondView)
    }
    @objc func changeView() {
        UIView.transition(from: secondView, to: firstView, duration: 3, options: [.transitionCurlUp], completion: nil)
    }
}

