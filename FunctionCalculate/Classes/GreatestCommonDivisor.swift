//
//  GreatestCommonDivisor.swift
//  FunctionCalculate
//
//  Created by 邱弘宇 on 2018/11/30.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

/**
 For greatest common divisor calculate
 */
class GreatestCommonDivisor: FunctionCalculateProtocol {
    func calculateStringResultWithMultiParam(params: [Float]) -> String? {
        var result:String = ""
        var divisorNumsArray:[[(primeNum:Int,residueNum:Int,totalNum:Int)]] = Array(repeating: [(primeNum:1,residueNum:1,totalNum:1)], count: params.count)
        var index = 0
        for param in params{
            var divisorNum:Int = Int(param)
            let compareNum:Int = Int(param)
            var index_sub = 0
            var totalNum = 1
            repeat{
                let divisorNumElement = divisorNumMethod(num:divisorNum,totalNum: totalNum)
                divisorNum = divisorNumElement.residueNum
                totalNum = divisorNumElement.totalNum
                divisorNumsArray[index].append(divisorNumElement)
                index_sub += 1
            }
            while(totalNum < compareNum)
            
            index += 1
        }
        
        let firstDivisorNums = divisorNumsArray[0]
        var results:[Int] = []
        for divisorNumElement in firstDivisorNums{
            if divisorNumElement.primeNum > 1{
                var equalCount = 0
                for other_index in 1...divisorNumsArray.count-1{
                    var other_sub_index = 0
                    for other_divisorNumElement in divisorNumsArray[other_index]{
                        if divisorNumElement.primeNum == other_divisorNumElement.primeNum{
                            equalCount += 1
                            divisorNumsArray[other_index].remove(at: other_sub_index)
                            break
                        }
                        else{
                            other_sub_index += 1
                        }
                    }
                }
                if equalCount == divisorNumsArray.count-1{
                    results.append(divisorNumElement.primeNum)
                }
            }
        }
        
        results.sort()
        
        var resultInteger = 1
        for resultElement in results{
            if (NSIntegerMax/resultInteger > resultElement){
                resultInteger = resultInteger * resultElement
            }
            else{
                resultInteger = -1
            }
            var countString = ""
            var count = 1
            for counter in results{
                if resultElement == counter{
                    if (resultElement > 1){
                        if (count > 1){
                            countString = " * " + "\(resultElement)" + "^" + "\(count)"
                        }
                        else{
                            countString = " * " + "\(resultElement)"
                        }
                        
                    }
                    results.remove(at: 0)
                    count += 1
                }
            }
            result = result + countString
        }
        if resultInteger > 0 {
            result = String(resultInteger)
        }
        return result;

    }
    
    func divisorNumMethod(num:Int,totalNum:Int)->(primeNum:Int,residueNum:Int,totalNum:Int){
        
        if (num % 2 == 0){
            return (2,num/2,totalNum*2)
        }
        else if (num % 3 == 0){
            return (3,num/3,totalNum*3)
        }
        else if (num % 5 == 0){
            return (5,num/5,totalNum*5)
        }
        else if (num % 7 == 0){
            return (7,num/7,totalNum*7)
        }
        else if (num % 11 == 0){
            return (11,num/11,totalNum*11)
        }
        else if (num % 13 == 0){
            return (13,num/13,totalNum*13)
        }
        else{
            var divisorNum = num
            while divisorNum >= 17{
                if (num % divisorNum == 0){
                    return (divisorNum,num/divisorNum,totalNum*divisorNum)
                }
                divisorNum -= 2
            }
        }
        
        return (1,num,num)
        
    }
    
}
