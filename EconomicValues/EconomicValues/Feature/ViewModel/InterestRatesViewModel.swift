//
//  InterestRatesViewModel.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 5.10.2022.
//

import Foundation


class InterestViewModel : ObservableObject {
    var service = InterestRatesService()
    
    @Published var creditBidList = [CreditBidResults]()
    @Published var selectedCreditList = [CreditRatesResult]()
    @Published var mevduatList = [MevduatResults]()
    
    func getCreditBid(tag: ServiceTags, price: String, monthParameter: MonthParameters, queryParameter: QueryParameters) {
        service.fetchCreditBid(tag: tag, pricePrameter: PriceParameters.creditBidPrice, price: price, monthParameter: monthParameter, queryParameter: queryParameter) { result in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.creditBidList = items ?? []
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSelectedCredit(tag: ServiceTags) {
        service.fetchSelectedCredit(tag: tag) { result in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.selectedCreditList = items ?? []
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getMevduat(tag: ServiceTags, monthParameter: MevduatDateParameters, monthCount: String, price: String) {
        service.fetchMevduat(tag: tag, monthParameter: monthParameter, monthCount: monthCount, price: price) { result in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.mevduatList = items ?? []
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
