//
//  ViewController.swift
//  Pace calculator
//
//  Created by Axel Gislason on 24/02/2017.
//  Copyright © 2017 Axel Gislason. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var metric: Double = 1.0
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var distance2: UITextField!
    @IBOutlet weak var TimeHours: UITextField!
    @IBOutlet weak var TimeMinutes: UITextField!
    @IBOutlet weak var TimeSeconds: UITextField!
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var calcPace: UIButton!
    
    
    @IBAction func onCalcPace(_ sender: AnyObject) {
            let hours = fetchNumber(data: TimeHours.text!) + (fetchNumber(data: TimeMinutes.text!) / 60) + (fetchNumber(data: TimeSeconds.text!) / 60 / 60)
            let distance = distanceToMeters(distance: distance2.text!) / 1000
            let a = 60 / (distance / hours)
            let (_,m,s) = minutesToHoursMinutesSeconds(minutes: a)
            paceLabel.text =  "Pace: " + String(format: "%02d", m) + ":" + String(format: "%02d", s) + " km/h"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func distanceToMeters(distance: String) -> (Double) {
        if (metric > 2000) {
            return metric
        }
        if (distance == "") {
            return 0.0;
        }
        return (Double(distance2.text!)!*metric)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        metric = metrics[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker1Data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker1Data.count
    }


}

