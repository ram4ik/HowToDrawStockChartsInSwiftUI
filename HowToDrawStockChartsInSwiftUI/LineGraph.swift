//
//  LineGraph.swift
//  HowToDrawStockChartsInSwiftUI
//
//  Created by ramil on 22.10.2020.
//

import SwiftUI

struct LineGraph: Shape {
    // Normalized data point between 0 and 1
    var dataPoints: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        
        func point(at ix: Int) -> CGPoint {
            let point = dataPoints[ix]
            let x = rect.width * CGFloat(ix) / CGFloat(dataPoints.count - 1)
            let y = (1 - point) * rect.height
            return CGPoint(x: x, y: y)
        }
        
        //Circle().path(in: rect)
        return Path { p in
            // Bad cases
            guard dataPoints.count > 1 else { return }
            
            let start = dataPoints[0]
            p.move(to: CGPoint(x: 0, y: (1 - start) * rect.height))
            
            for idx in dataPoints.indices {
                p.addLine(to: point(at: idx))
            }
        }
    }
}
