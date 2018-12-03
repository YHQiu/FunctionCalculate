# FunctionCalculate

[![CI Status](https://img.shields.io/travis/https://github.com/YHQiu/FunctionCalculate.svg?style=flat)](https://travis-ci.org/https://github.com/YHQiu/FunctionCalculate)
[![Version](https://img.shields.io/cocoapods/v/FunctionCalculate.svg?style=flat)](https://cocoapods.org/pods/FunctionCalculate)
[![License](https://img.shields.io/cocoapods/l/FunctionCalculate.svg?style=flat)](https://cocoapods.org/pods/FunctionCalculate)
[![Platform](https://img.shields.io/cocoapods/p/FunctionCalculate.svg?style=flat)](https://cocoapods.org/pods/FunctionCalculate)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

//Initial calculate
let fc = FunctionCalculate(param1: 11, param2: 5)

//Calculate combination
let combination = fc.calculate(calculateMethod: Combination())

//Calculate permutation
let permutation = fc.calculate(calculateMethod: Permutation())

//Calculate GrestestCommon LowestCommonMultiple
let fc1 = FunctionCalculate(params: 131072131072131072,646464,128128128,256256256,512512512,102410241024,204820482048,409640964096,819281928192,163841638416384,327683276832768,655366553665536)
//let fc1 = FunctionCalculate(params: 2,3,5,7,11,13,17,19,23,29,37,43)

let grestestCommon = fc1.calculate(calculateMethod: GreatestCommonDivisor())

let lowestCommon = fc1.calculate(calculateMethod: LowestCommonMultiple())

print("combination = "+"\(combination)");
print("combination = "+"\(combination.0)")
print("permutation = "+"\(permutation)");
print("permutation = "+"\(permutation.0)")
print("grestestCommon = "+"\(grestestCommon)")
print("grestestCommon = "+"\(grestestCommon.0)")
print("lowestCommon = "+"\(lowestCommon)")
print("lowestCommon = "+"\(lowestCommon.2!)")

combination = (462.0, 462, Optional("462.0"))
combination = 462.0
permutation = (55440.0, 55440, Optional("55440.0"))
permutation = 55440.0
grestestCommon = (64.0, 64, Optional("64"))
grestestCommon = 64.0
lowestCommon = (-1.0, -1, Optional(" * 2^6 * 3 * 5 * 7 * 11 * 13 * 37 * 10001 * 115597 * 295931 * 333667"))
lowestCommon =  * 2^6 * 3 * 5 * 7 * 11 * 13 * 37 * 10001 * 115597 * 295931 * 333667

## Requirements
only support swift

## Installation

FunctionCalculate is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FunctionCalculate'
```

## Author

https://github.com/YHQiu, 632244510@qq.com

## License

FunctionCalculate is available under the MIT license. See the LICENSE file for more info.
