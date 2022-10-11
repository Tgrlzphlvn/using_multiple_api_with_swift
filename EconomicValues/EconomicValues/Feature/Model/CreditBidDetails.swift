//
//  CreditBidDetails.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 5.10.2022.
//

import Foundation



// MARK: - CreditBidDetails
struct CreditBidDetails: Codable {
    let success: Bool?
    let result: CreditBidDetailsResult?
}

// MARK: - Result
struct CreditBidDetailsResult: Codable {
    let details: Details?
    let paymenttable: [Paymenttable]?
}

// MARK: - Details
struct Details: Codable, Identifiable {
    var id = UUID()
    let tip, isim, minvade, maxvade: String?
    let mintutar, maxtutar, faizorani, ektutar: String?
    let digertutar, toplamtutar: String?
}

// MARK: - Paymenttable
struct Paymenttable: Codable, Identifiable {
    var id = UUID()
    let taksitsayi: String?
    let taksittutarı: String?
    let aylikanapara, aylikfaiz, aylikkkdf, aylikbsmv: String?
    let kalantutar: String?
}
