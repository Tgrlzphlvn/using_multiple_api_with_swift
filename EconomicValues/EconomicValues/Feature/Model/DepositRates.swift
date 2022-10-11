//
//  DepositRates.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 11.10.2022.
//

import Foundation

// MARK: - Mevduat
struct Mevduat: Codable {
    let result: [MevduatResults]?
    let success: Bool?
}

// MARK: - Result
struct MevduatResults: Codable, Identifiable {
    var id = UUID()
    let image: String?
    let status, oran, tl, ay: String?
    let url: String?
}
