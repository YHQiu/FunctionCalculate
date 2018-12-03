//
//  ViewController.swift
//  FunctionCalculate
//
//  Created by https://github.com/YHQiu on 11/26/2018.
//  Copyright (c) 2018 https://github.com/YHQiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

