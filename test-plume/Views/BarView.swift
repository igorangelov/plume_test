//
//  Bar.swift
//  test-plume
//
//  Created by Angel on 14/07/2020.
//  Copyright © 2020 Angel. All rights reserved.
//

import SwiftUI
import Charts

struct BarView : UIViewRepresentable {
    
    var entries : [BarChartDataEntry]
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> BarChartView {
        //crate new chart
        let chart = BarChartView()
        chart.data = addData()
        return chart
    }
    
    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: BarChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> BarChartData{
        let data = BarChartData()
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.red]
        dataSet.label = "Plume Chart Bar"
        data.addDataSet(dataSet)
        return data
    }
    
    typealias UIViewType = BarChartView
    
}

extension BarView {
    static func entriesMock()-> [BarChartDataEntry]{
        return [
            //x - position of a bar, y - height of a bar
            BarChartDataEntry(x: 1, y: 1),
            BarChartDataEntry(x: 2, y: 1),
            BarChartDataEntry(x: 3, y: 1),
            BarChartDataEntry(x: 4, y: 1),
            BarChartDataEntry(x: 5, y: 1)
        ]
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(entries: BarView.entriesMock())
    }
}
