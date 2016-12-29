//
//  ViewController.swift
//  ABC
//
//  Created by LuanNX on 12/28/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    let draw = DrawView()
    var oldValue:CGFloat = 0.5
    @IBOutlet weak var seg4Label2: UILabel!
    @IBOutlet weak var frameview: DrawView!
    @IBOutlet weak var seg4Label1: UILabel!
   
    @IBOutlet weak var seg3Label2: UILabel!
    @IBOutlet weak var seg3Label1: UILabel!
    @IBOutlet weak var seg2Label2: UILabel!
    @IBOutlet weak var seg2Label1: UILabel!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var seg1Label1: UILabel!
   
    @IBOutlet weak var seg1Label2: UILabel!
    @IBOutlet weak var seg1Label3: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    let instance = DrawView.instance
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSeg2(bool: true)
        updateSeg3(bool: true)
        updateSeg4(bool: true)
        frameview.delegate = self
        //instance.change123(textA: (text1.text?.toDouble())!, textB: (text2.text?.toDouble())!, textC: (text3.text?.toDouble())!)
        
    }
    func updateSeg1(bool: Bool){
        seg1Label1.isHidden = bool
        seg1Label2.isHidden = bool
        seg1Label3.isHidden = bool
        text3.isHidden = bool
        
    }
    func updateSeg2(bool: Bool){
        seg2Label1.isHidden = bool
        seg2Label2.isHidden = bool
    }
    func updateSeg3(bool: Bool){
        seg3Label1.isHidden = bool
        seg3Label2.isHidden = bool
    }
    func updateSeg4(bool: Bool){
        seg4Label1.isHidden = bool
        seg4Label2.isHidden = bool
    }
    @IBOutlet weak var segment: UISegmentedControl!

    @IBOutlet weak var area: UILabel!
   
    @IBOutlet weak var perimeter: UILabel!
    @IBOutlet weak var calculate: UIButton!
    @IBAction func touchCalculate(_ sender: Any) {
        let choice = segment.selectedSegmentIndex
        
        switch choice {
        case 0:
            frameview.segment = 0
            frameview.text1 = text1!.text!.toDouble()
            frameview.text2 = text2!.text!.toDouble()
            frameview.text3 = text3!.text!.toDouble()
            let cal = frameview.calTriangle( sideA: (text1.text?.toDouble())!, sideB: (text2.text?.toDouble())!, sideC: (text3?.text?.toDouble())!)
            area.text = "\(cal.0)"
            perimeter.text = "\(cal.1)"
            break
        case 1:
            frameview.segment = 1
            frameview.text1 = text1!.text!.toDouble()
            frameview.text2 = text2!.text!.toDouble()
            let cal = frameview.calRectangle( width: (text1.text?.toDouble())!, height: (text2.text?.toDouble())!)
            area.text = "\(cal.0)"
            perimeter.text = "\(cal.1)"
            break
        case 2:
            frameview.segment = 2
            frameview.text1 = text1!.text!.toDouble()
            frameview.text2 = text2!.text!.toDouble()
            let cal = frameview.calArc( radius: (text1.text?.toDouble())!, degree: (text2.text?.toDouble())!)
            area.text = "\(cal.0)"
            perimeter.text = "\(cal.1)"
        case 3:
            frameview.segment = 3
            frameview.text1 = text1!.text!.toDouble()
            frameview.text2 = text2!.text!.toDouble()
            let cal = frameview.calEllipese( big: (text1.text?.toDouble())!, small: (text2.text?.toDouble())!)
            area.text = "\(cal.0)"
            perimeter.text = "\(cal.1)"
        default: break
    }
    }
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        let choice = sender.selectedSegmentIndex
        
        area.text = ""
        perimeter.text = ""
        switch choice {
        case 0:
            updateSeg1(bool: false)
            updateSeg2(bool: true)
            updateSeg3(bool: true)
            updateSeg4(bool: true)
        case 1:
            updateSeg1(bool: true)
            updateSeg2(bool: false)
            updateSeg3(bool: true)
            updateSeg4(bool: true)
        case 2:
            updateSeg1(bool: true)
            updateSeg2(bool: true)
            updateSeg3(bool: false)
            updateSeg4(bool: true)
        case 3:
            updateSeg1(bool: true)
            updateSeg2(bool: true)
            updateSeg3(bool: true)
            updateSeg4(bool: false)
        
        default: print()
            
        }
    }
    @IBAction func changeValueSlider(_ sender: UISlider) {
        let value1 = text1.text?.toDouble()
        let value2 = text2.text?.toDouble()
        let value3 = text3.text?.toDouble()
        let value:CGFloat = CGFloat(sender.value)
        text1.text = "\(value1!*value/oldValue)"
        text2.text = "\(value2!*value/oldValue)"
        text3.text = "\(value3!*value/oldValue)"
        frameview.text1 = text1!.text!.toDouble()
        frameview.text2 = text2!.text!.toDouble()
        frameview.text3 = text3!.text!.toDouble()
        oldValue = value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
}
protocol Share: class {
   
    
}
extension ViewController: Share {
    
}


