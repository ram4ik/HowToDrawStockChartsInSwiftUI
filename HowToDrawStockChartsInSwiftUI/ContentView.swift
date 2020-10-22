//
//  ContentView.swift
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

extension Array where Element == CGFloat {
    // return the elements ot the sequence, normalized
    var normalized: [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min) }
        }
        return []
    }
}

struct ContentView: View {
    var body: some View {
        LineGraph(dataPoints: [0.1, 0.3, 0.2, 0.6, 0.1, 0.3, 0.2, 0.6].normalized)
            .stroke(Color.blue)
            .frame(width: 400, height: 300)
            .border(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
