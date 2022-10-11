//
//  CreditRates.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 5.10.2022.
//

import Foundation


// MARK: - İhtiyacKredi
struct CreditRates: Codable {
    let success: Bool?
    let result: [CreditRatesResult]?
}

// MARK: - Result
struct CreditRatesResult: Codable, Identifiable {
    var id = UUID()
    let query: CreditQuery?
    let bank: String?
    let bankCode: CreditBankCode?
    let kredi, name, faiz: String?
    let min: CreditMin?
    let max: CreditMax?

    enum CodingKeys: String, CodingKey {
        case query, bank
        case bankCode
        case kredi, name, faiz, min, max
    }
}

enum CreditBankCode: String, Codable {
    case undefined = "undefined"
}

enum CreditMax: String, Codable {
    case the164 = "% 1,64"
    case the36Ay = "36 Ay"
    case the6Ay = "6 Ay"
}

enum CreditMin: String, Codable {
    case the12Ay = "12 Ay"
    case the1Ay = "1 Ay"
    case the3Ay = "3 Ay"
}

enum CreditQuery: String, Codable {
    case ihtiyac = "ihtiyac"
}
