//
//  CreditBidChart.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 11.10.2022.
//

import SwiftUI


struct CreditBidChart: View {
    var viewModel : InterestViewModel
    var pickerTag : PickerTags
    
    @State var selectedMonth : PickerPaymentPeriod = PickerPaymentPeriod.allCases.first!
    @State var selectedCategory : PickerQuery = PickerQuery.allCases.first!
    @State var priceValue = ""
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).padding(20).foregroundColor(.white).frame(height: 300).shadow(radius: CGFloat(10))
                VStack {
                    HStack {
                        Spacer()
                    }.padding(.leading, 40)
                    HStack {
                        Text("Kredi Türü : ").foregroundColor(.blue)
                        Picker("Kredi Türü",selection: $selectedCategory) {
                            ForEach(PickerQuery.allCases) { item in
                                Text(item.rawValue).tag(item)
                            }
                        }
                        Spacer()
                    }.padding(.leading, 40)
                    HStack {
                        Text("Ay : ").foregroundColor(.blue)
                        Picker("Taksit", selection: $selectedMonth) {
                            ForEach(PickerPaymentPeriod.allCases) { item in
                                Text(item.rawValue).tag(item)
                            }
                        }
                        Spacer()
                    }.padding(.leading, 40)
                    HStack {
                        Text("Miktar : ").foregroundColor(.blue)
                        TextField("Miktar", text: $priceValue).frame(width: 160).foregroundColor(.blue)
                        Spacer()
                    }.padding(.leading, 40)
                    
                    Button("Getir") {
                        Task.init {
                            viewModel.getCreditBid(tag: pickerTag.value ,price: priceValue ,monthParameter: selectedMonth.value ,queryParameter: selectedCategory.value)
                        }
                    }.padding(30)
                }
            }
            List(viewModel.creditBidList, id: \.id) { item in
                VStack {
                    Text(item.bankCode ?? "nil")
                    Divider()
                    HStack {
                        Text(item.tl ?? "nil")
                        Spacer()
                        Text(item.ay ?? "nil")
                        Spacer()
                        Text(item.oran ?? "nil")
                    }
                    Text(String(item.tlInt ?? 0.0))
                    Text(item.name ?? "nil")
                }
            }
        }
    }
}
