//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// data check then calculate expression
do {
    var checker = ErrorChecker(expr: args)

    if(try checker.isValidExpr()) {
        //calculate expression
        var calculate = Calculator(expr: args)
        let result = try calculate.calculateExpr()
        print(result)
        exit(0)
    }
} catch Errors.invalidExpression {
    print("ERROR: Invalid expression.")
    exit(1)
} catch Errors.invalidNumber {
    print("ERROR: Invalid number input")
    exit(1)
} catch Errors.invalidOperator {
    print("ERROR: Invalid oper input")
    exit(1)
} catch Errors.divisionByZero {
    print("ERROR: Divide by zero.")
    exit(1)
} catch {
    print("ERROR: \(error)")
    exit(1)
}
