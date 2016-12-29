//
//  ViewController.swift
//  HOmeWork2512
//
//  Created by LuanNX on 12/27/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var segment:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSegment()
     
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addSegment(){
        let items = ["Triangle","Rectangle","Arc","Ellipse"]
        segment = UISegmentedControl(items: items)
        //segment.frame = CGRect(x: 100, y: 100, width: 300, height: 100)
        segment.frame.origin = CGPoint(x: 0, y: 50)
        //segment.selectedSegmentIndex = 1
        self.view.addSubview(segment)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
 
