var isMac: Bool {
  #if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
  return true
  #else
  return false
  #endif
}
