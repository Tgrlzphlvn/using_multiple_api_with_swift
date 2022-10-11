//
//  PickerEnums.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 5.10.2022.
//

import Foundation


enum PickerTags : String, CaseIterable, Hashable, Identifiable {
    case creditBid = "Kredi oranları"
    case mevduat = "Mevduat"
    case ihtiyacKredisi = "İhtiyaç kredisi"
    case konutKredisi = "Konut kredisi"
    case tasitKredisi = "Taşıt kredisi"
    
    var id : Self { self }
}

extension PickerTags {
    var value : ServiceTags {
        switch self {
        case .creditBid:
            return ServiceTags.creditBid
        case .mevduat:
            return ServiceTags.mevduat
        case .ihtiyacKredisi:
            return ServiceTags.ihtiyacKredi
        case .konutKredisi:
            return ServiceTags.konutKredi
        case .tasitKredisi:
            return ServiceTags.tasitKredi
        }
    }
}

enum PickerDate : String, CaseIterable, Hashable, Identifiable {
    case month = "Ay"
    case year = "Yıl"
    
    var id : Self { self }
}

extension PickerDate {
    var value : MevduatDateParameters {
        switch self {
        case .month:
            return MevduatDateParameters.month
        case .year:
            return MevduatDateParameters.year
        }
    }
}

enum PickerQuery : String, CaseIterable, Hashable, Identifiable {
    case ihtiyac = "İhtiyaç"
    case konut = "Konut"
    case tasit = "Taşıt"
    
    var id : Self { self }
}

extension PickerQuery {
    var value : QueryParameters {
        switch self {
        case .ihtiyac:
            return QueryParameters.ihtiyac
        case .konut:
            return QueryParameters.konut
        case .tasit:
            return QueryParameters.tasit
        }
    }
}

enum PickerPaymentPeriod : String, CaseIterable ,Hashable, Identifiable {
    case three = "3"
    case six = "6"
    case ten = "10"
    case twelve = "12"
    case twentyFour = "24"
    case thirtySix = "36"
    
    var id : Self { self }
}

extension PickerPaymentPeriod {
    var value : MonthParameters {
        switch self {
        case .three:
            return MonthParameters.three
        case .six:
            return MonthParameters.six
        case .ten:
            return MonthParameters.ten
        case .twelve:
            return MonthParameters.twelve
        case .twentyFour:
            return MonthParameters.twentyFour
        case .thirtySix:
            return MonthParameters.thirtySix
        }
    }
}

enum PickerDetailNames : String, CaseIterable, Hashable, Identifiable {
    case ihtiyac = "İhtiyaç Kredisi"
    case konut = "Konut Kredisi"
    case tasit = "Taşıt Kredisi"
    
    var id : Self { self }
}

extension PickerDetailNames {
    var value : CreditBidDetailsNameParameters {
        switch self {
        case .ihtiyac:
            return CreditBidDetailsNameParameters.ihtiyac
        case .konut:
            return CreditBidDetailsNameParameters.konut
        case .tasit:
            return CreditBidDetailsNameParameters.tasit
        }
    }
}
