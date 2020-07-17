//
//  ChartFactory.swift
//  test-plume
//
//  Created by Angel on 14/07/2020.
//  Copyright © 2020 Angel. All rights reserved.
//

import Foundation
import SwiftUI
import Charts

public enum ChartType: Int {
    case bar = 0
    case line = 1
}

protocol PlumeChart {
    var data: [String] {get set} // REPLACE BY  Array of MESSURE from Bluetooth framwork

    func configure()
    
}

class Bar: PlumeChart {
    
    var data: [String] = []

    init(data : [String]) {
        self.data = data
    }
    
    func configure() {
        
    }

}

class Line: PlumeChart {
    var data: [String] = []
    
    init(data : [String]) {
        self.data = data
    }
    
    func configure() {
        
    }

    func makeChart() -> LineView {
        return LineView(entries: BarView.entriesMock())
    }
}

class ChartFactory {
    // REPLACE BY  Array of MESSURE from Bluetooth framwork
    func createView(chartType: ChartType, chartData: [String])->
        some View {
            debugPrint("chartData ",chartData)
        switch chartType {
        case .bar:
            //let bar: some PlumeChart = Bar(data: chartData)
            return AnyView(BarView(entries: BarView.entriesMock()))
        case .line:
            //let line: some PlumeChart = Line(data: chartData)
            return AnyView(LineView(entries: LineView.entriesMock()))
        }
    }
}
