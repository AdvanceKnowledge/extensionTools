//
//  ViewController.swift
//  Tools
//
//  Created by 王延磊 on 2018/11/14.
//  Copyright © 2018 追@寻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.backgroundColor = UIColor.colorWithString(colorStr: "FF8348")
        view2.backgroundColor = UIColor.RGB(R: 100, G: 131, B: 72, Alp: 1)
        let hellor = "Hello,World"
        print(hellor.mySubstring(from: 1))
        print(hellor.mySubstring(to: 3))
        print(hellor.mySubstring(after: ","))
        print(hellor.mySubstring(before: ","))
        print(hellor.mySubstring(start: 1, length: 3))
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

