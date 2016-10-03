//
//  Plane.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Plane: Vehicle {
    
    let maxAltitude: Double
    var altitude = 0.0
    var inFlight: Bool { return speed > 0 && altitude > 0 }
    
    init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        self.maxAltitude = maxAltitude
        super.init(name: name, weight: weight, maxSpeed: maxSpeed)
    }
    
    func takeOff() {
        if inFlight == false {
            speed = (0.1 * maxSpeed)
            altitude = (0.1 * maxAltitude)
        }
    }
    
    func land() { speed = 0.0; altitude = 0.0 }
    
    func climb() {
        if altitude < maxAltitude && inFlight && speed > 0 {
            altitude += (0.1 * maxAltitude)
            super.decelerate()
        }
        if altitude > maxAltitude { altitude = maxAltitude }
        
    }
    
    func dive() {
        if altitude > 0 && inFlight && speed < maxSpeed {
            altitude -= (0.1 * maxAltitude)
            super.accelerate()
        }
        if altitude < 0 { altitude = 0 }
    }
    
    func bankRight() {
        if inFlight == true { heading += 45; speed -= (0.1 * speed) }
    }
    
    func bankLeft() {
        if inFlight == true { heading += 315; speed -= (0.1 * speed) }
    }

    
}
