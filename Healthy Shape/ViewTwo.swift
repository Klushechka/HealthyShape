//
//  ViewTwo.swift
//  Healthy Shape
//
//  Created by Ольга Клюшкина on 12.03.17.
//  Copyright © 2017 klyushkina. All rights reserved.
//
import UIKit
import Foundation

class ViewTwo: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    var BodyMassText = String()
    
    override func viewDidLoad() {
        Label.text = BodyMassText
    }
}
