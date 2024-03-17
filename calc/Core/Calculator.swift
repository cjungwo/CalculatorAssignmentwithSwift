//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

struct Calculator {
    private var expr: [String]
    private var opers = Operator()
    
    init(expr: [String]) {
        self.expr = expr
    }
    
    // check character is a priority character ("x", "/", "%")
    func isPriorityOper(oper: String) -> Bool{
        if("x" == oper || "/" == oper || "%" == oper) {
            return true
        } else {
            return false
        }
    }
    
    // identify operator and change to method (like "+" -> add())
    // calculate with two numbers
    // assign value to first index of expression and second number
    // return new array, new length of iteration
    mutating func handleOper(array: [String], index: Int, length: Int) throws -> ([String], Int, Int) {
        var tempArray = array
        var tempIndex = index
        var tempLength = length
        
        let num1 = Int(tempArray[index - 1])!
        let num2 = Int(tempArray[index + 1])!
        
        var result = 0
        
        do{
            switch tempArray[tempIndex] {
            case "x":
                result = self.opers.multi(num1: num1, num2: num2)
                break
            case "/":
                result = try self.opers.divide(num1: num1, num2: num2)
                break
            case "%":
                result = try self.opers.modulus(num1: num1, num2: num2)
                break
            case "+":
                result = self.opers.add(num1: num1, num2: num2)
                break
            case "-":
                result = self.opers.sub(num1: num1, num2: num2)
                break
            default:
                break
            }
            
            // assign evaluated result to first number
            tempArray[index - 1] = String(result)
            
            // remove operator
            tempArray.remove(at: index)
            
            // check array length
            if(index < tempLength) {
              // remove second number
                tempArray.remove(at: index)
            }
            
            // update length and index
            tempLength = tempLength - 2
            tempIndex = index - 1
            
            return(tempArray, tempLength, tempIndex)
        }
        catch {
            throw error
        }
        
    }
    
    mutating func evaluateExpr() throws -> Int {
        var array =  self.expr
        var length = array.count
        
        // iterate and check priority operators
        var i = 0
        
        while i < length {
            // check only when operator index
            if(i % 2 != 0) {
                if(isPriorityOper(oper: array[i])){
                    (array, length, i) = try handleOper(array: array, index: i, length: length)
                }
            }
            
            i += 1
        }
        
        // iterate and check other operators ("+", "-")
        var j = 0
        
        while j < length {
            // check only when operator index
            if(j % 2 != 0) {
                (array, length, j) = try handleOper(array: array, index: j, length: length)
            }
            
            j += 1
        }
        
        return Int(array[0])!
    }
    
    mutating func calculateExpr() throws -> Int {
        do {
            return try evaluateExpr()
        } catch {
            throw error
        }
    }
}
