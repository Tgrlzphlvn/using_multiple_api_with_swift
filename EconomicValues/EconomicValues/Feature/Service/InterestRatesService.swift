//
//  InterestRatesService.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 4.10.2022.
//

import Foundation


class InterestRatesService : InterestRatesProtocol {
    
    func fetchCreditBid(tag : ServiceTags, pricePrameter : PriceParameters, price : String, monthParameter : MonthParameters, queryParameter : QueryParameters, completion : @escaping (Result<[CreditBidResults]?, Error>) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: ServicePlugins.url + tag.rawValue + pricePrameter.rawValue + price + monthParameter.rawValue + queryParameter.rawValue)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = ServicePlugins.getMethod
        request.allHTTPHeaderFields = ServicePlugins.headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(ServiceErrors.networkError))
            }
            
            do {
                print(data)
                let parseResult = try JSONDecoder().decode([CreditBidResults].self, from: data)
                print(parseResult)
                completion(.success(parseResult))
            } catch {
                completion(.failure(ServiceErrors.dataParsingError))
            }
        }.resume()
    }
    
    func fetchCreditBidDetail(tag : ServiceTags, nameParameter : CreditBidDetailsNameParameters, bankParameter : BankCodeParameters, bankCode : String, priceParamater : PriceParameters, price : String, monthParameter : MonthParameters, queryParameter : QueryParameters , completion : @escaping (Result<CreditBidDetails?, Error>) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: ServicePlugins.url + tag.rawValue + nameParameter.rawValue + bankParameter.rawValue + priceParamater.rawValue + price + monthParameter.rawValue + queryParameter.rawValue)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = ServicePlugins.getMethod
        request.allHTTPHeaderFields = ServicePlugins.headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(ServiceErrors.networkError))
            }
            
            guard let results = try? JSONDecoder().decode(CreditBidDetails.self, from: data) else {
                return completion(.failure(ServiceErrors.dataParsingError))
            }
            
            completion(.success(results))
        }.resume()
    }
    
    func fetchMevduat(tag: ServiceTags, monthParameter: MevduatDateParameters, monthCount: String, price: String, completion: @escaping (Result<[MevduatResults]?, Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: ServicePlugins.url + tag.rawValue + monthParameter.rawValue + monthCount + PriceParameters.price.rawValue + price)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = ServicePlugins.getMethod
        request.allHTTPHeaderFields = ServicePlugins.headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            
            guard let data = data , error == nil else {
                return completion(.failure(ServiceErrors.networkError))
            }
            
            guard let results = try? JSONDecoder().decode(Mevduat.self, from: data) else {
                return completion(.failure(ServiceErrors.dataParsingError))
            }
            
            completion(.success(results.result))
        }.resume()
    }
    
    func fetchSelectedCredit(tag: ServiceTags, completion: @escaping (Result<[CreditRatesResult]?, Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: ServicePlugins.url + tag.rawValue)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        request.httpMethod = ServicePlugins.getMethod
        request.allHTTPHeaderFields = ServicePlugins.headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, _, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(ServiceErrors.networkError))
            }
            
            guard let results = try? JSONDecoder().decode(CreditRates.self, from: data) else {
                return completion(.failure(ServiceErrors.dataParsingError))
            }
            
            completion(.success(results.result))
        }.resume()
    }
}
