//
//  ContentView.swift
//  HowToDrawStockChartsInSwiftUI
//
//  Created by ramil on 22.10.2020.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel = ChartViewModel()

    @State private var animateChart = false
    @State private var showLoader = false
        
    var body: some View {
        ZStack {
            LineGraph(dataPoints: viewModel.chartData)
                .trim(to: animateChart ? 1 : 0)
                .stroke(Color.blue)
                .frame(width: 400, height: 300)
                //.border(Color.black)
                .onAppear() {
                    showLoader = true
                    viewModel.loadData {
                        showLoader = false
                        withAnimation(.easeOut(duration: 2)) {
                            animateChart = true
                        }
                    }
                }
            if showLoader {
                ChartLoader()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
