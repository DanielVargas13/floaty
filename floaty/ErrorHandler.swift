//
//  ErrorHandler.swift
//  Floaty
//
//  Created by James Zaghini on 9/1/19.
//  Copyright © 2019 James Zaghini. All rights reserved.
//

import Foundation
import CocoaLumberjack

class ErrorHandler {

    static let shared = ErrorHandler()

    func wrap<ReturnType>(function: () throws -> ReturnType?) -> ReturnType? {
        do {
            return try function()
        } catch let error {
            DDLogError("\(error) \n Stack Symbols: \(Thread.callStackSymbols)")
            return nil
        }
    }

}
