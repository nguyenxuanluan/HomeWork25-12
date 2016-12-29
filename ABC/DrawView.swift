//
//  DrawView.swift
//  ABC
//
//  Created by LuanNX on 12/28/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import UIKit

class DrawView: UIView{
    
    var center1: CGPoint!
    var segment = 0 { didSet { setNeedsDisplay() } }
    var text1:CGFloat = 40 { didSet  { setNeedsDisplay() } }
    var text2:CGFloat = 50  { didSet  { setNeedsDisplay() } }
    var text3:CGFloat = 30  { didSet  { setNeedsDisplay() } }
    static let instance = DrawView()
    weak var delegate : Share?
    func change123(textA:CGFloat,textB:CGFloat,textC:CGFloat){
        self.text1 = textA
        self.text2 = textB
        self.text3 = textC
    }
    func change12(textA:CGFloat,textB:CGFloat){
        self.text1 = textA
        self.text2 = textB
    }

    override func draw(_ rect: CGRect) {
        center1 = CGPoint(x: rect.width/2, y: rect.height/2)
        switch segment {
        case 0:
            drawTriangle(sideA: text1, sideB: text2, sideC: text3)
        case 1:
            drawRectangle(width: text1, height: text2)
        case 2:
            drawArc(radius: text1, degree: text2)
        case 3:
            drawEllipse(big: text1, small: text2)
        default: break
            
        }
    }
    func removePreviousPath(){
        let linePath = UIBezierPath()
        linePath.move(to: center1)
        UIColor.red.setStroke()
        linePath.lineWidth = 0
        linePath.stroke()
    }
    func calTriangle(sideA: CGFloat, sideB:CGFloat, sideC:CGFloat) -> (CGFloat,CGFloat){
        let half = ( sideA + sideB + sideC )/2
        let area = sqrt(half*(half - sideC)*(half - sideA)*(half - sideB))
        return (area,2*half)
    }
    func calRectangle(width: CGFloat, height: CGFloat) -> (CGFloat,CGFloat){
        
        let area = width*height
        let perimeter = 2*(width + height)
        return (area,perimeter)
    }
    func calArc(radius: CGFloat, degree: CGFloat) -> (CGFloat,CGFloat){
        let radian = degree*CGFloat(M_PI)/360
        let area = (radian * radius * radius)/2
        let perimeter = 2*radius +  radian*radius
        return (area,perimeter)
    }
    func calEllipese(big:CGFloat, small: CGFloat) -> (CGFloat,CGFloat){
        let halfBig = big/2
        let halfSmall = small/2
        let abc = (halfSmall*halfSmall + halfBig*halfBig)/2
        let perimeter = 2 * M_PI * sqrt(Double(abc))
        let area = CGFloat(M_PI)*big*small/4
        return (area,CGFloat(perimeter))
    }
    func drawTriangle(sideA: CGFloat, sideB:CGFloat, sideC:CGFloat)  {
        
        let mA:CGFloat = sqrt(2*sideC*sideC + 2*sideB*sideB - sideA*sideA)/2
        let mB:CGFloat = sqrt(2*sideC*sideC + 2*sideA*sideA - sideB*sideB)/2
        let lengthA = mA * 2/3
        let lengthB = mB * 2/3
        let halfCir = ( lengthA + lengthB + sideC )/2
        let subArea = sqrt(halfCir*(halfCir - sideC)*(halfCir - lengthA)*(halfCir - lengthB))
        let height = subArea*2/sideC
        let subSideC1 = sqrt(lengthA*lengthA - height*height)
        let subSideC2 = sqrt(lengthB*lengthB - height*height)
        let pointA = center1.add(x: -subSideC1, y: height)
        let pointB = center1.add(x: subSideC2, y: height)
        let pointC = CGPoint(x: (3*center1.x - pointA.x - pointB.x), y: (3*center1.y - pointA.y - pointB.y))
        print(pointA)
        print(pointB)
        print(pointC)
        let linePath = UIBezierPath()
        linePath.move(to: pointA)
        linePath.addLine(to: pointB)
        linePath.addLine(to: pointC)
        linePath.addLine(to: pointA)
        UIColor.red.setStroke()
        linePath.lineWidth = 2
        linePath.stroke()
        
        
    }
    func drawRectangle(width: CGFloat, height: CGFloat) {
        let halfWidth = width/2
        let halfHeight = height/2
        let pointA = center1.add(x: -halfWidth, y: -halfHeight)
        let pointB = center1.add(x: halfWidth, y: -halfHeight)
        let pointC = center1.add(x: -halfWidth, y: halfHeight)
        let pointD = center1.add(x: halfWidth, y: halfHeight)
        let linePath = UIBezierPath()
        linePath.move(to: pointA)
        linePath.addLine(to: pointB)
        linePath.addLine(to: pointD)
        linePath.addLine(to: pointC)
        linePath.addLine(to: pointA)
        UIColor.red.setStroke()
        linePath.lineWidth = 2
        linePath.stroke()
        
    }
    func drawArc(radius: CGFloat, degree: CGFloat){
        
        let radian = degree*CGFloat(M_PI)/360
       
        let linePath = UIBezierPath()
        linePath.move(to: center1)
        linePath.addArc(withCenter: center1, radius: radius, startAngle: -radian - CGFloat(M_PI_2), endAngle: radian - CGFloat(M_PI_2), clockwise: true)
        linePath.addLine(to: center1)
        UIColor.red.setStroke()
        linePath.lineWidth = 2
        linePath.stroke()
    }
    
    func drawEllipse( big:CGFloat, small: CGFloat) {
        let originEllip = center1.add(x: -big/2, y: -small/2)
        let linePath = UIBezierPath(ovalIn: CGRect(origin: originEllip, size: CGSize(width: big, height: small)))
        UIColor.red.setStroke()
        linePath.lineWidth = 2
        linePath.stroke()
    }
    
}
