//
//  InterestRates.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 4.10.2022.
//

import Foundation


// MARK: - CreditBid
struct CreditBid : Codable {
    let success: Bool?
    let result: [CreditBidResults]?
}

// MARK: - Result
struct CreditBidResults : Codable, Identifiable {
    var id = UUID()
    let ay: String?
    let ayInt: Double?
    let tl: String?
    let tlInt: Double?
    let oran: String?
    let oranInt: Double?
    let status, name, bankCode: String?

 }
