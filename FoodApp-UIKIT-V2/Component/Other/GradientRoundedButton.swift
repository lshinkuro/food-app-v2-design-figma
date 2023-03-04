//
//  GradientRoundedButton.swift
//  FoodApp-UIKIT-V2
//
//  Created by Macbook on 04/03/23.
//

import UIKit

class GradientRoundedButton: UIButton {
    
    let firstColor =  UIColor.foodBrightLinear1
    let secondColor = UIColor.foodBrightLinear1
    let startPoint = CGPoint(x: 0, y: 1)
    let endpoint = CGPoint(x: 1, y: 1)
    var gradientLayer: CAGradientLayer!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        gradientLayer.frame =  rect
        makeCornerRadius(rect.height/2, maskedCorner: nil)
    }
    
    func setup() {
        gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.colors = [firstColor, secondColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint =  endpoint
        self.layer.addSublayer(gradientLayer)
        
        if let buttonImage = self.imageView {
            self.bringSubviewToFront(buttonImage)
        }
        
        setTitleColor(UIColor.foodRed1, for: .normal)
    }
}
