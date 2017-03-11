//
//  TimeController.swift
//  Pace calculator
//
//  Created by Axel Gislason on 28/02/2017.
//  Copyright © 2017 Axel Gislason. All rights reserved.
//

import Foundation
import UIKit

class TimeController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var paceMinutes: UITextField!
    @IBOutlet weak var paceSeconds: UITextField!
    @IBOutlet weak var paceMetric: UIPickerView!
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var distanceMetric: UIPickerView!
    @IBOutlet weak var time: UILabel!
    var distanceMetricDist: Double = 1.0
    var paceMetricDist: Double = 1.0
    @IBOutlet weak var calcButton: UIButton!
    
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
        if (pickerView == distanceMetric) {
            print("picker1", picker1Data[row])
            return picker1Data[row]
        } else {
            print("picker2", picker2Data[row])
            return picker2Data[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == distanceMetric) {
            distanceMetricDist = metrics[row]
        } else {
            paceMetricDist = paceMetrics[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == distanceMetric) {
            return picker1Data.count
        } else {
            return picker2Data.count
        }
    }
    
    @IBAction func onCalcTime(_ sender: Any) {
        
        let pace = (fetchNumber(data: paceMinutes.text!)) + (fetchNumber(data: paceSeconds.text!)/60)
        
        let distance = distanceToMeters(picker1: true) / 1000
        
        let (h,m,s) = minutesToHoursMinutesSeconds(minutes: (pace*distance))
        time.text = "Time: " + String(format: "%02d", h) + ":" + String(format: "%02d", m) + ":" + String(format: "%02d", s)
    }
    
    
    func distanceToMeters(picker1: Bool) -> (Double) {
        print(distanceMetricDist)
        if (picker1) {
            if (distanceMetricDist > 2000) {
                return distanceMetricDist
            }
            if (distance.text == "") {
                return 0;
            }
            return (Double(distance.text!)!*distanceMetricDist)
        } else {
            if (distance.text == "") {
                return 0;
            }
            return (Double(distance.text!)!*paceMetricDist)
        }
    }
    
    
}
