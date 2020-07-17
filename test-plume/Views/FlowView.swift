//
//  ContentView.swift
//  test-plume
//
//  Created by Angel on 13/07/2020.
//  Copyright © 2020 Angel. All rights reserved.
//

import SwiftUI
import Charts
struct FlowView: View {
    @ObservedObject var viewModel: MessuresViewModel
    
    @State var starDate = Date()
    @State var endDate = Date()
    
    @State var chartChoioce = 0
    var charts = ["Bar", "Line"]
    
    var body: some View {
        VStack{
            //charts
            ChartFactory().createView(chartType: ChartType(rawValue:chartChoioce)!, chartData:self.viewModel.messures)
                .padding()
                .onAppear{
                    //viewModel managed loading 
                    self.viewModel.loadMessures()
            }
            Divider()
            //segment
            Picker("Charts type", selection: $chartChoioce) {
                ForEach(0 ..< charts.count) { index in
                    Text(self.charts[index])
                        .tag(index)
                }
            }.onReceive([self.chartChoioce].publisher.first(), perform: { (value) in
                //print changing
                debugPrint(ChartType(rawValue:value)!)
            })
                .pickerStyle(SegmentedPickerStyle())
            
            Form {
                //date pickers
                DatePicker("Date de debut", selection: $starDate, displayedComponents: [.date,.hourAndMinute]).padding()
                DatePicker("Date de fin", selection: $endDate, displayedComponents:[.date,.hourAndMinute]).padding()
                //valide button
                Button(action: {
                    self.viewModel.dateBetween(start: self.starDate, end: self.endDate)
                }) {
                    Text("Valide date")
                }
                
                
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FlowView(viewModel: MessuresViewModel(service: MessuresService()))
    }
}
