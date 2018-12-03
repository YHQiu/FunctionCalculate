//
//  Permutation.swift
//  FunctionCalculate
//
//  Created by 邱弘宇 on 2018/11/30.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

/**
 For permutation calculate
 */
class Permutation: FunctionCalculateProtocol {
    
    public func calculate(param1: Float, param2: Float) -> Float {
        let zero = 0
        guard Int(param1) > zero else {return 0}
        guard Int(param2) > zero else {return 0}
        if Int(param2) == zero {
            return Float(zero)
        }
        var result:Float = 0
        var c = param1
        let d = param2
        let condition = c - d
        var resultNum1 = param1
        
        while c > condition {
            
            let t_c = c - 1
            if (t_c > 0 && t_c != condition){
                resultNum1 *= t_c
            }
            c -= 1
            
        }
        
        result = resultNum1
        
        return result
        
    }
    
}
