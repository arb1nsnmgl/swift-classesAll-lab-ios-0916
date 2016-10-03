//
//  Jet.swift
//  CatchEmAll
//
//  Created by Michael Dippery on 8/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Jet: Plane {
    
    override init(name: String, weight: Double, maxSpeed: Double, maxAltitude: Double) {
        super.init(name: name, weight: weight, maxSpeed: maxSpeed, maxAltitude: maxAltitude)
    }
    
    
    override func climb() {
        if altitude < maxAltitude && inFlight && speed > 0 {
            altitude += (0.2 * maxAltitude)
            super.decelerate()
        }
        if altitude > maxAltitude { altitude = maxAltitude }
    }
    
    override func dive() {
        if altitude > 0 && inFlight && speed < maxSpeed {
            altitude -= (0.2 * maxAltitude)
            super.accelerate()
        }
        if altitude < 0 { altitude = 0 }
    }
    
    func afterburner() {
        if inFlight == true && speed == maxSpeed {
            speed = (2 * maxSpeed)
        }
    }
        
}
