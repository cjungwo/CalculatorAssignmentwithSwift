//
//  ErrorChecker.swift
//  calc
//
//  Created by JungWoo Choi on 11/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

struct ErrorChecker {
    private var expr: [String]
    private let operArray = ["+", "-", "x", "/", "%"]
    
    init(expr: [String]) {
        self.expr = expr
    }
    
    // check input characters are valid
    // if odd args are valid number and even args are vaild operators
    // it can pass
    func checkInputCharacters() throws {
        //it is for checking even characters are numbers
        var count = 1
        
        // check length of expression arg is odd
        // if it is even number
        // it throws error
        guard self.expr.count % 2 == 1 else {
            throw Errors.invalidExpression
        }
        
        // check for valid arg
        for arg in args {
            if(count % 2 == 0 && !self.operArray.contains(arg)) {
                // if even order
                // check for vaild operators
                throw Errors.invalidOperator
            } else if(count % 2 == 1 && Int(arg) == nil) {
                // if odd order
                // check for valid numbers
                throw Errors.invalidNumber
            }
            
            count += 1
        }
    }
    
    // if valid expression
    // return true
    mutating func isValidExpr() throws -> Bool  {
        do {
            try checkInputCharacters()
            return true
        } catch {
            throw error
        }
    }
}
