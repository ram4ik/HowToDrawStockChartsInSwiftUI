//
//  ChartLoader.swift
//  HowToDrawStockChartsInSwiftUI
//
//  Created by ramil on 22.10.2020.
//

import SwiftUI

struct ChartLoader: View {
    @State private var isAtMaxSize = false
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    private let maxScale: CGFloat = 1.5
    
    var body: some View {
        VStack {
            Text("Loading")
                .font(.custom("Avinir", size: 16))
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)
                .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                .scaleEffect(CGSize(width: isAtMaxSize ? maxScale : 0.01, height: 1.0))
                .onAppear() {
                    withAnimation(animation) {
                        self.isAtMaxSize.toggle()
                    }
                }
        }
    }
}

struct ChartLoader_Previews: PreviewProvider {
    static var previews: some View {
        ChartLoader()
    }
}
