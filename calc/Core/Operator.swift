//
//  Operator.swift
//  calc
//
//  Created by JungWoo Choi on 11/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

struct Operator {
    
    //Add
    func add(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    //Subtract
    func sub(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    
    //Multiple
    func multi(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
    
    //Division
    func divide(num1: Int, num2: Int) throws -> Int {
        guard num2 != 0 else {
            throw Errors.divisionByZero
        }
        
        return num1 / num2
    }
    
    //Modulus
    mutating func modulus(num1: Int, num2: Int) throws -> Int {
        guard num2 != 0 else {
            throw Errors.divisionByZero
        }
        
        return num1 % num2
    }
    
}
