//
//  Errors.swift
//  calc
//
//  Created by JungWoo Choi on 11/3/2024.
//  Copyright © 2024 UTS. All rights reserved.
//

import Foundation

// Defintion about possible error
enum Errors: Error {
    case invalidExpression
    case invalidOperator
    case invalidNumber
    case divisionByZero
}
