//
//  GradientViewController.swift
//  TabBarControllerTask
//
//  Created by Nadiia Pavliuk on 6/12/18.
//  Copyright © 2018 Nadiia Pavliuk. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {
    
    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [ UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor]
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.bounds
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
}

