//
//  Shared.swift
//  Pace calculator
//
//  Created by Axel Gislason on 28/02/2017.
//  Copyright © 2017 Axel Gislason. All rights reserved.
//
import Foundation

func fetchNumber(data: String) -> Double {
    return Double(data) ?? 0
}

func minutesToHoursMinutesSeconds (minutes : Double) -> (Int, Int, Int) {
    if (minutes != minutes) {
        return (0,0,0)
    }
    return (Int(minutes / 60), Int(fmod(minutes, 60.0)), (Int(fmod((fmod(minutes, 60)*60),60))))
}

let picker1Data = ["Meters", "Kilometers", "Yards", "Miles", "5K", "10K", "Half marathon", "Marathon"]

let picker2Data = ["Kilometers", "Miles"]

let metrics = [1,
               1000,
               0.9144,
               1609.34,
               5000,
               10000,
               26100,
               42200] as [Double]

let paceMetrics = [1000,
                   1609] as [Double]
