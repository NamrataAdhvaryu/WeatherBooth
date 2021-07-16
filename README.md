
# WeatherBooth
 
WeatherBooth is an iOS application used with Open Weather API which will forecast the  current,daily and weekly weather report of the current location.

# Technical Stack

- swiftUI
- iOS 14
- Generic API Manager
- Lottie Animation
- Core Location
- Xcode 12
- Cocoapods
- Combine
- Local Notificaltion
- MVVM(Coding Pattern)
- Google Mobile Ads
- Unit test cases
- Swift Package Dependencies

# Installation

This can be easily insatlled in 2 ways

1. Clone the link
2. Download the project directly

Once downloaded or cloned one can directly run the application by selecting any available simulator. 
If any problem persists, 
    Please Simulate location if it won’t auto update in simulator
    please install pods and try
    
# Execution

1. "**Globe**" symbol will direct you to raw data.
2. In Content view remove comment line "**GADBannerViewController()**" for Google mobile add.
    

# Project Details

This project is developed in **SwiftUI** using MVVM pattern, API client with POP(Protocol Oriented Programming) used for making server calls are native and using the URLSession. Used today's best practices like generics, Codable, Extensions, MVVM, Computed properties and also OOPS concepts for ENDPoint class, which ever new client is required it can be easily created by overriding the required properties.

Constants are created for the application for the easy localization or any content change. SwiftUI views are used to display the results, details and few settings actions, Computed properties are used in the model which will give the leverage to keep the codable keys as it is and access the user required data with ease.

1.**Reachabiliy** :Class for network change 

2.**LocationManager** :Class for the location request and authorization change observation.

3.**BGAPIHelpers** : Are added just to show the other way with swift client to use.

4.**Unit test cases** : Are being added for the possible places and the code coverage has been done as much as possible, ofcourse the 100% coverage is not possible in the real world but tried to cover as much as possible due to the time constraint.


![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 13 13 39](https://user-images.githubusercontent.com/70209068/125987970-f87005b2-8c70-40ff-b6be-299fb5c0091d.png)
![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 13 12 28](https://user-images.githubusercontent.com/70209068/125987977-3e63ceb1-2100-47cf-8d94-864ba61b4edb.png)
![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 13 12 09](https://user-images.githubusercontent.com/70209068/125987998-32807b25-c743-43a7-abd0-d8e1ff014bb9.png)
![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 13 14 13](https://user-images.githubusercontent.com/70209068/125988005-12264a24-18d2-44ed-9495-14fbab95a9cd.png)
![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 13 14 09](https://user-images.githubusercontent.com/70209068/125988011-81463d35-dc5d-4c29-a9a3-0f2975928a6e.png)
![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 13 14 17](https://user-images.githubusercontent.com/70209068/125988017-f9211b0e-4f8e-4aaf-b075-ec1d8e68812c.png)
![notification](https://user-images.githubusercontent.com/70209068/126001170-da0b7a07-9d36-42c8-a1df-c892ad9ddd92.png)
![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 14 51 40](https://user-images.githubusercontent.com/70209068/126001191-20b0fed9-28ee-4773-a1b8-73f6908400b8.png)
![Simulator Screen Shot - iPhone 12 Pro - 2021-07-16 at 14 51 31](https://user-images.githubusercontent.com/70209068/126001197-7acff315-e517-4acd-9209-e428900ea481.png)

