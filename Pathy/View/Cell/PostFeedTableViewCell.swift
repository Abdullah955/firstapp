//
//  PostFeedTableViewCell.swift
//  Pathy
//
//  Created by Abdullah Alatter on 22/01/2021.
//

import UIKit

final class PostFeedTableViewCell: UITableViewCell {
    
    let offSet:CGFloat = 20.0
    let circleRadius:CGFloat = 5.0
    
    static let identifer = "PostFeed"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(tableV)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configur(){
    // Configure cell
    }
    
    
    override func draw(_ rect: CGRect) {

        //creating a circle
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: offSet,y: circleRadius), radius: CGFloat(circleRadius), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2.0
        circlePath.stroke()

        //creating a line with dashed pattern
        let  dashPath = UIBezierPath()
        let  startPoint = CGPoint(x:offSet  ,y:circleRadius * 2)
        dashPath.move(to: startPoint)

        let  endPoint = CGPoint(x:offSet,y: self.bounds.maxY)
        dashPath.addLine(to: endPoint)

        let  dashes: [ CGFloat ] = [4, 1] //line with dash pattern of 4 thick and i unit space
        dashPath.setLineDash(dashes, count: dashes.count, phase: 0)
        dashPath.lineWidth = 2.0
        dashPath.lineCapStyle = .butt
        UIColor.black.set()
        dashPath.stroke()

    }

    
    
}



