//
//  File.swift
//  Async
//
//  Created by Sam Meech-Ward on 2019-06-24.
//

import Foundation

class FakeGPIOManager: GPIOManagerType {
  func on() {
    print("Fake on gpio")
  }
  
  func off() {
    print("Fake off gpio")
  }
}
