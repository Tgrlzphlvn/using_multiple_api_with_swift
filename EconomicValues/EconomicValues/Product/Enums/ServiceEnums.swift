//
//  ServiceEnums.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 4.10.2022.
//

import Foundation


enum ServiceTags : String {
    case creditBid = "/creditBid"
    case mevduat = "/mevduat"
    case ihtiyacKredi = "/ihtiyacKredi"
    case konutKredi = "/konutKredi"
    case tasitKredi = "/tasitKredi"
    case creditBidDetails = "/creditBidDetails"
}

enum MevduatDateParameters : String {
    case month = "?data.time=ay&data.int="
    case year = "?data.time=yil&data.int="
}

enum QueryParameters : String {
    case ihtiyac = "&data.query=ihtiyac"
    case konut = "&data.query=konut"
    case tasit = "&data.query=tasit"
}

enum MonthParameters : String {
    case three = "&data.month=3"
    case six = "&data.month=6"
    case ten = "&data.month=10"
    case twelve = "&data.month=12"
    case twentyFour = "&data.month=24"
    case thirtySix = "&data.month=36"
}

enum PriceParameters : String {
    case price = "&data.price="
    case creditBidPrice = "?data.price="
}

enum BankCodeParameters : String {
    case ingBank = "&data.bank-code="
}

enum CreditBidDetailsNameParameters : String {
    case ihtiyac = "?data.name=ihtiyac-kredisi"
    case konut = "?data.name=konut-kredisi"
    case tasit = "?data.name=tasit-kredisi"
}

struct ServicePlugins {
    static let headers = ["content-type": "application/json", "authorization" : "apikey 1EsSsgSZMq46ACLKsM4kSQ:4hdbRpcDUlbMSOizgexY86"]
    static let url = "https://api.collectapi.com/credit"
    static let getMethod = "GET"
}
