//
//  GPIOManager.swift
//  Async
//
//  Created by Sam Meech-Ward on 2019-06-24.
//
import SwiftyGPIO
import Foundation

class GPIOManager: GPIOManagerType {
  
  let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPi3)
  var gp: GPIO!
  
  init() {
    gp = gpios[.P27]!
    gp.direction = .OUT
  }
  
  func on() {
    gp.value = 1
  }
  
  func off() {
    gp.value = 0
  }
  
}
