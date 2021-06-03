## Introduction

Huawei Map Kit provides powerful and convenient map services for you to implement personalized map display and interaction at ease.

For details please refer to [Official Documentation](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides-V5/android-sdk-introduction-0000001061991291-V5) 

- ### Function Overview

    - [Map Instance Creation](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides-V5/android-sdk-map-instance-creation-0000001062881706-V5)
    - [Map interaction](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides-V5/android-sdk-map-camera-0000001061885327-V5)


## Getting Started

1. Download the [SDK source file](/HmsMap.xcframework.zip).

2. Unpack the source file.

3. Drag HmsMap.xcframework to the Frameworks, Libraries and Embedded Content section of your project target.

Following code is a simple example to create HMSMapView:

```swift
import HmsMap

// Creating Map View
lazy var mapView: HMSMapView = {
        let view = HMSMapView(frame:CGRect(x:0,y:0,width:self.view.bounds.width, height: self.view.bounds.height))
        view.delegate = self// to listen HmsMapView delegate events.
        return view
}()

// Adding map view
 self.view.addSubview(mapView)
```

## Questions or Issues

If you have questions about how to use HMS samples, try the following options:

- [Stack Overflow](https://stackoverflow.com/questions/tagged/huawei-mobile-services) is the best place for any programming questions. Be sure to tag your question with **huawei-mobile-services**.
- [Huawei Developer Forum](https://forums.developer.huawei.com/forumPortal/en/home) is great for general questions, or seeking recommendations and opinions.
- [Huawei Developer Docs](https://developer.huawei.com/consumer/en/) is place to official documentation for all clients, you can find detailed documentations in there.

## Licensing and Terms

HmsMap Kit is licensed under the [Apache 2.0 license](LICENSE).