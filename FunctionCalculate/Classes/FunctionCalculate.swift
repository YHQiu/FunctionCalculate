//
//  FunctionCalculate.swift
//  FunctionCalculate
//
//  Created by 邱弘宇 on 2018/11/26.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

@objc protocol FunctionCalculateProtocol {
    
    @objc optional func calculate(param1:Float,param2:Float) -> Float;
    
    @objc optional func calculateStringResult(param1:Float,param2:Float) -> String?;
    
    @objc optional func calculateWithMultiParam(params:[Float]) -> Float;
    
    @objc optional func calculateStringResultWithMultiParam(params:[Float]) -> (String?);
    
    @objc optional func calculateWithModel(params:Any) -> Float;
    
    @objc optional func calculateStringWithModel(params:Any) -> String?;
    
}

@objc protocol FunctionCalculateDecimalProtocol {
    
    @objc optional func calculate(param1:Decimal,param2:Decimal) -> Decimal;
    
    @objc optional func calculateStringResult(param1:Decimal,param2:Decimal) -> String?;
    
    @objc optional func calculateWithMultiParam(params:[Decimal]) -> Decimal;
    
    @objc optional func calculateWithModel(params:Any) -> Decimal
    
}

/**
 What is shown in the class below reveals clearly that a convenience management class,but it's not conform design principle!!!
 Although,we suggestion that use a FunctionCalculate Class instead of use a class which inherits Protocol directly call a instance method.
 */
class FunctionCalculate {
    
    var param1:Float?
    
    var param2:Float?
    
    var params:Any?
    
    var result:Float = 0
    
    var resultInteger:Int = 0
    
    var resultString:String?
    
    var model:Any?
    
    init(param1:Float,param2:Float) {
        self.param1 = param1
        self.param2 = param2
        
    }
    
    init(params:Float...) {
        self.params = params
        
    }
    
    init(model:Any){
        self.model = model
        
    }
    
    func calculate(calculateMethod:FunctionCalculateProtocol)->(Float,Int,String?){
        
        (result,resultInteger,resultString) = (0,0,nil)
        
        //select calculate method
        if(self.param1 != nil && self.param2 != nil && ((calculateMethod.calculate?(param1: self.param1!,param2: self.param2!)) != nil)){
            self.result = calculateMethod.calculate!(param1: self.param1!, param2: self.param2!)
            self.resultInteger = Int(self.result)
            self.resultString = String(self.result)
            
        }
        //select calculateStringResult method
        else if(self.param1 != nil && self.param2 != nil && ((calculateMethod.calculateStringResult?(param1: self.param1!,param2: self.param2!)) != nil)){
            self.resultString = calculateMethod.calculateStringResult!(param1: self.param1!, param2: self.param2!)
            self.resultInteger = Int(self.resultString!) ?? -1
            self.result = Float(self.resultString!) ?? -1
            
        }
        //select calculateWithMultiParam method
        else if(self.params != nil && ((calculateMethod.calculateWithMultiParam?(params: self.params as! [Float] )) != nil)){
            self.result = calculateMethod.calculateWithMultiParam!(params: self.params as! [Float])
            self.resultString = String(self.result)
            self.resultInteger = Int(self.result)
            
        }
        //select calculateStringResultWithMultiParam method
        else if(self.params != nil && ((calculateMethod.calculateStringResultWithMultiParam?(params: self.params as! [Float])) != nil)){
            self.resultString = calculateMethod.calculateStringResultWithMultiParam!(params: self.params as! [Float])
            self.result = Float(self.resultString!) ?? -1
            self.resultInteger = Int(self.resultString!) ?? -1
            
        }
        //select calculateWithModel method
        else if(self.model != nil && ((calculateMethod.calculateWithModel?(params: self.model!)) != nil)){
            self.result = calculateMethod.calculateWithModel!(params: self.model!)
            self.resultString = String(self.result)
            self.resultInteger = Int(self.result)
            
        }
        //select calculateWithModel method
        else if(self.model != nil && ((calculateMethod.calculateWithModel?(params: self.model!)) != nil)){
            self.resultString = calculateMethod.calculateStringWithModel!(params: self.model!)
            self.result = Float(self.resultString!) ?? -1
            self.resultInteger = Int(self.resultString!) ?? -1
            
        }
        
        return (result,resultInteger,resultString)
    }
    
}

@objc public class FunctionCalculateDecimal:NSObject {
    
    var param1:Decimal?
    
    var param2:Decimal?
    
    var params:[Decimal]?
    
    var result:Decimal = 0
    
    var resultString:String?
    
    var model:Any?
    
    var stringValue:String{get{return result.description}}
    
    var floatValue:Float?{get{return Float(result.description)}}
    
    init(param1:Decimal,param2:Decimal) {
        self.param1 = param1
        self.param2 = param2
        
    }
    
    init(params:Decimal...) {
        self.params = params
        
    }
    
    init(model:Any){
        self.model = model
        
    }
    
    func calculate(calculateMethod:FunctionCalculateDecimalProtocol)->(Decimal,String?){
        
        if(self.param1 != nil && self.param2 != nil && ((calculateMethod.calculate?(param1: self.param1!,param2: self.param2!)) != nil)){
            self.result = calculateMethod.calculate!(param1: self.param1!, param2: self.param2!)
            self.resultString = self.result.description
            
        }
        else if(self.params != nil && ((calculateMethod.calculateWithMultiParam?(params: self.params ?? [])) != nil)){
            self.result = calculateMethod.calculateWithMultiParam!(params: self.params ?? [])
            self.resultString = self.result.description
            
        }
        else if(self.model != nil && ((calculateMethod.calculateWithModel?(params: self.model!)) != nil)){
            self.result = calculateMethod.calculateWithModel!(params: self.model!)
            self.resultString = self.result.description
            
        }
        
        return (result,resultString)
        
    }
    
}

