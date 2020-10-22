//
//  ChartViewModel.swift
//  HowToDrawStockChartsInSwiftUI
//
//  Created by ramil on 22.10.2020.
//

import SwiftUI

final class ChartViewModel: ObservableObject {
    @Published var chartData = [CGFloat]()
    
    func loadData(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.chartData = [
                0.234234231, 0.3, 0.2, 0.6345345, 0.1, 0.32423423, 0.2, 0.23423426,
                0.452451, 0.35434, 0.2, 0.6, 0.1, 0.3, 0.2, 0.697898,
                0.1, 0.234233, 0.2, 0.6, 0.53431, 0.3, 0.2, 0.6786786,
                0.1867867, 0.3, 0.456452, 0.6, 0.1, 0.867863, 0.2, 0.678678676
            ].normalized
            completion()
        }
    }
}
