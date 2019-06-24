var gpio: GPIOManagerType! = isMac ? FakeGPIOManager() : GPIOManager()

import Vapor

let app = try Application()
let router = try app.make(Router.self)

router.get("hello") { req in
  return "Hello, world."
}

router.post("off") { req -> String in
  gpio.off()
  return "🤗"
}

router.post("on") { req -> String in
  gpio.on()
  return "🤗"
}

try app.run()

