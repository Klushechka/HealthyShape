//
//  ViewController.swift
//  Healthy Shape
//
//  Created by Ольга Клюшкина on 12.03.17.
//  Copyright © 2017 klyushkina. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet var getWeight: UITextField!
    @IBOutlet var getHeight: UITextField!
    
    @IBAction func calculate(_ sender: Any) {
    }
    
    var myBMI: Float = 0.0
    var resume: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getWeight.delegate = self
        self.getHeight.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        func textFieldShouldReturn(_ getWeight: UITextField) -> Bool {
            getWeight.resignFirstResponder()
            return false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController: ViewTwo = segue.destination as! ViewTwo
       
        func countBMI(userWeight: Float?, userHeight: Float?){
            if userWeight != nil && userHeight != nil && userWeight != 0 && userHeight != 0 {
            myBMI = userWeight!/(userHeight!*userHeight!)
            } else {
                // create the alert
                let alert = UIAlertController(title: "Need Info", message: "Please enter both weight and height values.", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        func getResume(myBMI: Float) {
            switch(myBMI) {
            case 0:
                resume = " . Please set weight and height values."
            case 1..<18.5:
                resume = ". You are underweighted."
            case 18.5...24.9:
                resume = ". You have a healthy weight."
            case 25.0...29.9:
                resume = ". You are overweighted."
            case 30.0...9999999999999999999999999999:
                resume = ". You have an obese."
            default: break
            }
        }
    
        let weight = Float(getWeight.text!)
        let height = (Float(getHeight.text!)!)/100
        
        countBMI(userWeight: weight, userHeight: height)
        getResume(myBMI: myBMI)
        
        DestViewController.BodyMassText = "Your BodyMassIndex is " + String(myBMI) + resume
    }
}

