//
//  DistanceController.swift
//  Pace calculator
//
//  Created by Axel Gislason on 28/02/2017.
//  Copyright © 2017 Axel Gislason. All rights reserved.
//

import Foundation
import UIKit
class DistanceController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var paceMetricDist: Double = 1000.0
    
    @IBOutlet weak var timeHours: UITextField!
    @IBOutlet weak var timeMinutes: UITextField!
    @IBOutlet weak var timeSeconds: UITextField!
    @IBOutlet weak var paceMinutes: UITextField!
    @IBOutlet weak var paceSeconds: UITextField!
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var paceMetric: UIPickerView!
    @IBOutlet weak var distance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker2Data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker2Data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        paceMetricDist = paceMetrics[row]
    }

    
    
    @IBAction func onCalcDist(_ sender: Any) {
        let hours = (fetchNumber(data: timeHours.text!)*60) + (fetchNumber(data: timeMinutes.text!)) + (fetchNumber(data: timeSeconds.text!) / 60)
        
        let pace = (fetchNumber(data: paceMinutes.text!)) + (fetchNumber(data: paceSeconds.text!)/60)
        
        var calcDist = hours /  (pace)
        calcDist = (calcDist * 1000) / paceMetricDist
        distance.text = "Distance: " + String(format: "%.2f", calcDist) + " km"
    }
}
    
