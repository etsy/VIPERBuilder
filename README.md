# VIPERBuilder
![](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![](https://img.shields.io/badge/swift-4.0-brightgreen.svg)
![](https://img.shields.io/badge/test%20coverage-100%25-brightgreen.svg)

Scaffolding for building apps in a clean way with VIPER architecture ([what is VIPER?](https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52#.us2szxd78)).

VIPER inherently has a few problems:

* Boilerplate
* Potential retain cycles due to management of many classes
* Cognitive overhead of setup

This framework aims to address those problems by providing a set of base classes to divide your app's functionality and builder object to manage the connections.

## Installation

### Cocoapod
Add `pod VIPERBuilder` to your Podfile

Run `pod install`

## Usage
1. Create subclasses of `VIPERInteractor`, `VIPERPresenter` and `VIPERRouter` as needed
2. Create a strong reference to an instance of `VIPERBuilder` with the new subclasses specified. Lazy loading in Swift will ensure that the builder object is available as soon as it is called

Swift

	lazy var viperBuilder: VIPERBuilder<NewInteractor, NewPresenter, NewRouter> = {
	    return VIPERBuilder(controller: self)
	}()

Objective C

    self.viperBuilder = [[VIPERBuilderObjc alloc] initWithInterator:[NewInteractor class] presenter:[NewPresenter class] router:[NewRouter class] controller:self];
    
	
Note: If not all classes are needed for the implementation passing the superclass to the Builder object is supported

For a more detailed implementation, please check out the demo project included in this repo

## Code Separation
This framework provides three base classes for the three main parts of VIPER: Interactor, Presenter, Router. Each class should contain certain pieces of code and has references to other classes for specific reasons, however these can be extended through subclassing.

---

#### Interactor
##### Purpose
* User interaction (directly and through delegation from other classes)
* Data fetching/mutation

###### Reference usages
* Presenter: should be used to update view after fetching or mutating data
* Router: Used for navigation based on actions taken

---

#### Presenter
##### Purpose
* Configuring view/view model (entity objects)
* Presenting modals/loading screens

###### Reference usages
* Controller: Presenting modals/error messages
* Interactor: Can be used as a delegate for any actions from views

---

#### Router
##### Purpose
* Navigation (pushing views onto UINavigationController's stack)

###### Reference usages
* Navigation controller: Used for pushing screens

---
