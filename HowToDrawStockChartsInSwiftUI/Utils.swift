//
//  Utils.swift
//  HowToDrawStockChartsInSwiftUI
//
//  Created by ramil on 22.10.2020.
//

import SwiftUI

extension Array where Element == CGFloat {
    // return the elements ot the sequence, normalized
    var normalized: [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min) }
        }
        return []
    }
}
