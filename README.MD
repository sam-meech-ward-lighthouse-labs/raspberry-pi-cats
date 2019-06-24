# Raspberry Pi

> Our mission is to put the power of computing and digital making into the hands of people all over the world. We do this so that more people are able to harness the power of computing and digital technologies for work, to solve problems that matter to them, and to express themselves creatively.
> - https://www.raspberrypi.org/

## Setup Pi

1. Watch my videos on getting setup: http://bit.ly/rpi_sam
2. Install some dependencies:
    ```shell
    # Swift Dependencies
    sudo apt install -y clang-3.8 libicu-dev libcurl4-nss-dev
    sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 100
    sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 100
    # Vapor Dependencies
    sudo apt install -y libz-dev libssl1.0-dev
    ```

## Installing Swift

1. go to https://github.com/uraimo/buildSwiftOnARM
2. scroll down to prebuilt binaries 
3. Choose one of the following
    * Raspbian ARMv6	All RaspberryPis: Classic, Zero, 2, 3	5.0.1
    * DebianARMv7	Every ARMv7 board, RaspberryPis 2/3 included
4. copy the link address, which will be something like `https://github.com/uraimo/buildSwiftOnARM/releases/download/5.0.1/swift-5.0.1-armv7-DebianStretch.tgz`
5. `ssh` onto the raspberry pi and download the image 
    ```shell
    wget https://github.com/uraimo/buildSwiftOnARM/releases/download/5.0.1/swift-5.0.1-armv7-DebianStretch.tgz
    ```
6. unzip the image 
    ```shell
    tar -xvzf swift-5.0.1-RPi0123-RaspbianStretch.tgz
    ```
7. Add the following code to the pi's `.profile` file. `nano ~/.profile`:
    ```shell
    if [ -d "$HOME/usr/bin" ] ; then
        PATH="$HOME/usr/bin:$PATH"
    fi
    ```
8. Make sure everything is working by running `swift --version`

## Sysfs

https://www.kernel.org/doc/Documentation/gpio/sysfs.txt

### Bash

```bash
echo 27 echo 1 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio27/direction
echo 1 > /sys/class/gpio/gpio27/value
```

### Swift

```swift
#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
import Darwin
#else
import Glibc
#endif

func write(string: String, toFile file: String) {
  let file = fopen(file, "w")
  fputs(string, file)
  fclose(file)
}

write(string: "27", toFile: "/sys/class/gpio/export");
write(string: "out", toFile: "/sys/class/gpio/gpio27/direction");
write(string: "1", toFile: "/sys/class/gpio/gpio27/value");
```

## SwiftyGPIO

https://github.com/uraimo/SwiftyGPIO

## Rsync

```shell
rsync -a --exclude "*.xcodeproj" --exclude ".build" ./ pi@raspberrypi.local:/home/pi/myapp
```

## Vapor

```shell
swift run AppName --hostname 0.0.0.0 --port 4000
```