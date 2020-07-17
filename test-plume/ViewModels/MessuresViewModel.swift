//
//  MessureViewModels.swift
//  test-plume
//
//  Created by Angel on 13/07/2020.
//  Copyright © 2020 Angel. All rights reserved.
//

import Foundation
import Combine

class MessuresViewModel: ObservableObject, Identifiable{
    
    let service: MessuresService
    @Published var messures = [String]() // use Messure model from Bluetooh/Flow/Plum api
    @Published var dateStart = Date()
    @Published var dateEnd = Date()
    
    
    init(service: MessuresService) {
        self.service = service
    }
    
    //filter by date
    func dateBetween(start: Date, end: Date){
        debugPrint("date 1", start)
        debugPrint("date 2", end)
        //to do update messures
        self.messures = ["test1"] // just a test
    }
    
    func loadMessures() {
        //call bluetooth/messures service
        self.service.refreshMessures()
    }
}
