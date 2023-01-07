//
//  ExtensionTimeInterval.swift
//  Cards_001
//
//  Created by Tuấn Anh on 07/01/2023.
//

import Foundation

extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
