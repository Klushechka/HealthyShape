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
    @IBOutlet weak var genderSwitcher: UISegmentedControl!
    
    
    @IBAction func calculate(_ sender: Any) {
    }
    
    var myBMI: Float = 0.0
    var resume: String = ""
    var gender: UInt8 = 2 // default value which is Man
    
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
            if gender == 2 { // When gender is Man
                switch(myBMI) {
                    case 0:
                        resume = " . Please set weight and height values."
                    case 1.0..<16.0:
                            resume = ". You are dangerously underweighted."
                    case 16..<18.5:
                            resume = ". You are underweighted."
                    case 18.5..<25.0:
                            resume = ". You have a healthy weight."
                    case 25.0..<30:
                            resume = ". You are overweighted."
                    case 30.0..<35.0:
                            resume = ". You have an obese (Class I)."
                    case 35.0..<40.0:
                            resume = ". You have an obese (Class II)."
                    case 40.0...9999999999999999999999999999:
                            resume = ". You have a morbid obese (Class III)."
                    default: break
                }
            } else { // When gender is Woman
                    switch(myBMI) {
                    case 0:
                        resume = " . Please set weight and height values."
                    case 1.0..<16.0:
                        resume = ". You are dangerously underweighted."
                    case 16.0..<18.0:
                        resume = ". You are underweighted."
                    case 18.0..<25.0:
                        resume = ". You have a healthy weight."
                    case 25.0..<30:
                        resume = ". You have an obese (Class I)."
                    case 30.0..<40.0:
                        resume = ". You have an obese (Class II)."
                    case 40.0...9999999999999999999999999999:
                        resume = ". You have a morbid obese (Class III)."
                    default: break
                }
            }
        }
    
        let weight = Float(getWeight.text!)
        let height = (Float(getHeight.text!)!)/100
        
        countBMI(userWeight: weight, userHeight: height)
        getResume(myBMI: myBMI)
        
        DestViewController.BodyMassText = "Your BodyMassIndex is " + String(format: "%.1f", myBMI) + resume
    }
    
    @IBAction func genderSwitchButton(_ sender: UISegmentedControl) {
        switch genderSwitcher.selectedSegmentIndex {
        case 0:
            gender = 2 // this is Man
        case 1:
            gender = 3 // this is Woman
        default: break
        }
    }
}

