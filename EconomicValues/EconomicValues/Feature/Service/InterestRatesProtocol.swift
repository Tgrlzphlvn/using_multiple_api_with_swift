//
//  InterestRatesProtocol.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 4.10.2022.
//

import Foundation


protocol InterestRatesProtocol {
    
    func fetchCreditBid(tag : ServiceTags, pricePrameter : PriceParameters, price : String, monthParameter : MonthParameters, queryParameter : QueryParameters, completion : @escaping (Result<[CreditBidResults]?, Error>) -> Void)
    
    func fetchCreditBidDetail(tag : ServiceTags, nameParameter : CreditBidDetailsNameParameters, bankParameter : BankCodeParameters, bankCode : String, priceParamater : PriceParameters, price : String, monthParameter : MonthParameters, queryParameter : QueryParameters , completion : @escaping (Result<CreditBidDetails?, Error>) -> Void)
    
    func fetchMevduat(tag : ServiceTags, monthParameter : MevduatDateParameters, monthCount : String, price : String, completion : @escaping (Result<[MevduatResults]?, Error>) -> Void)
    
    func fetchSelectedCredit(tag : ServiceTags, completion : @escaping (Result<[CreditRatesResult]?, Error>) -> Void)
        
}
