//
//  CurveTextView.swift
//  Eventa
//
//  Created by Jai Khurana on 05/02/25.
//

import UIKit

class CurvedTextView: UIView {
    var text: String = "ARTIST • NOVELS"
    var font: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
    var radius: CGFloat = 100 // Adjust based on image size
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let charSpacing = CGFloat.pi * 2 / CGFloat(text.count) // Even spacing

        context.translateBy(x: center.x, y: center.y)
        
        for (index, char) in text.enumerated() {
            let angle = -CGFloat.pi / 2 + CGFloat(index) * charSpacing
            
            let charX = cos(angle) * radius
            let charY = sin(angle) * radius
            
            let charStr = String(char)
            let attrStr = NSAttributedString(string: charStr, attributes: [
                .font: font,
                .foregroundColor: UIColor.black
            ])
            
            let textSize = attrStr.size()
            let transform = CGAffineTransform(rotationAngle: angle + CGFloat.pi / 2)
            
            context.saveGState()
            context.translateBy(x: charX - textSize.width / 2, y: charY - textSize.height / 2)
            context.concatenate(transform)
            attrStr.draw(at: .zero)
            context.restoreGState()
        }
    }
}
