//
//  LineView.swift
//  test-plume
//
//  Created by Angel on 14/07/2020.
//  Copyright © 2020 Angel. All rights reserved.
//

import SwiftUI
import Charts

struct LineView : UIViewRepresentable {

    var entries : [ChartDataEntry]
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> LineChartView {
        //crate new chart
        let chart = LineChartView()
        chart.data = addData()
        return chart
    }
    
    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: LineChartView, context: Context) {
        //when data changes chartd.data update is required
        uiView.data = addData()
    }
    
    func addData() -> LineChartData{
        let data = LineChartData()
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.blue]
        dataSet.label = "Plume Chart Line"
        data.addDataSet(dataSet)
        return data
    }
    
    typealias UIViewType = LineChartView
    
}

extension LineView {
    static func entriesMock()-> [ChartDataEntry]{
        return [
            //x - position of a bar, y - height of a bar
            ChartDataEntry(x: 1, y: 0.5),
            ChartDataEntry(x: 2, y: 6),
            ChartDataEntry(x: 3, y: 1.5),
            ChartDataEntry(x: 4, y: 3),
            ChartDataEntry(x: 5, y: 9)
        ]
    }
}


struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(entries: LineView.entriesMock())
    }
}
