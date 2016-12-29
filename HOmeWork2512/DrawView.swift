//
//  DrawView.swift
//  HOmeWork2512
//
//  Created by LuanNX on 12/28/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import UIKit

class DrawView: UIView{
    static let instance = DrawView()
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        //let linePath = drawTriangle(center:center,sideA: sideA, sideB: sideB, sideC: sideC)
        //let linePath = drawRectangle(center: center, width: 100, height: 50)
        //let linePath = drawArc(center: center, radius: 50, degree: 500)
        let linePath = drawEllipse(center: center, big: 100, small: 50)
        UIColor.red.setStroke()
        linePath.lineWidth = 2
        linePath.stroke()
    }
    func drawTriangle(center: CGPoint,sideA: CGFloat, sideB:CGFloat, sideC:CGFloat) -> UIBezierPath {
        let mA:CGFloat = sqrt(2*sideC*sideC + 2*sideB*sideB - sideA*sideA)/2
        let mB:CGFloat = sqrt(2*sideC*sideC + 2*sideA*sideA - sideB*sideB)/2
        let lengthA = mA * 2/3
        let lengthB = mB * 2/3
        let halfCir = ( lengthA + lengthB + sideC )/2
        let subArea = sqrt(halfCir*(halfCir - sideC)*(halfCir - lengthA)*(halfCir - lengthB))
        let height = subArea*2/sideC
        let subSideC1 = sqrt(lengthA*lengthA - height*height)
        let subSideC2 = sqrt(lengthB*lengthB - height*height)
        let pointA = center.add(x: -subSideC1, y: height)
        let pointB = center.add(x: subSideC2, y: height)
        let pointC = CGPoint(x: (3*center.x - pointA.x - pointB.x), y: (3*center.y - pointA.y - pointB.y))
        let linePath = UIBezierPath()
        linePath.move(to: pointA)
        linePath.addLine(to: pointB)
        linePath.addLine(to: pointC)
        linePath.addLine(to: pointA)
        return linePath
    }
    func drawRectangle(center: CGPoint,width: CGFloat, height: CGFloat) -> UIBezierPath{
        let halfWidth = width/2
        let halfHeight = height/2
        let pointA = center.add(x: -halfWidth, y: -halfHeight)
        let pointB = center.add(x: halfWidth, y: -halfHeight)
        let pointC = center.add(x: -halfWidth, y: halfHeight)
        let pointD = center.add(x: halfWidth, y: halfHeight)
        let linePath = UIBezierPath()
        linePath.move(to: pointA)
        linePath.addLine(to: pointB)
        linePath.addLine(to: pointD)
        linePath.addLine(to: pointC)
        linePath.addLine(to: pointA)
        return linePath
        
    }
    func drawArc(center:CGPoint,radius: CGFloat, degree: CGFloat) -> UIBezierPath{
        let radian = degree*CGFloat(M_PI)/360
        let linePath = UIBezierPath()
        linePath.move(to: center)
        linePath.addArc(withCenter: center, radius: radius, startAngle: -radian - CGFloat(M_PI_2), endAngle: radian - CGFloat(M_PI_2), clockwise: true)
        linePath.addLine(to: center)
        return linePath
    }
    func drawEllipse(center:CGPoint, big:CGFloat, small: CGFloat) -> UIBezierPath{
        let originEllip = center.add(x: -big/2, y: -small/2)
        let linePath = UIBezierPath(ovalIn: CGRect(origin: originEllip, size: CGSize(width: big, height: small)))
        return linePath
    }
    
}
