//
//  MessuresService.swift
//  test-plume
//
//  Created by Angel on 17/07/2020.
//  Copyright © 2020 Angel. All rights reserved.
//

import Foundation
import Combine

protocol MessuresServiceProtocol {
    func refreshMessures()
}

struct MessuresService: MessuresServiceProtocol {
    
    init() {
    }
    func refreshMessures() {}
}
