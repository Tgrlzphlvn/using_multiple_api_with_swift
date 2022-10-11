//
//  CreditRatesChart.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 11.10.2022.
//

import SwiftUI


struct CreditRatesChart: View {
    
    var viewModel : InterestViewModel
    var selectedTag : PickerTags
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).padding(20).foregroundColor(.white).frame(height: 140).shadow(radius: CGFloat(10))
                VStack {
                    Text("Seçilen kredi verilerini getirmek için tıklayın.").foregroundColor(.blue).padding(10)
                    Button("Getir") {
                        Task.init {
                            viewModel.getSelectedCredit(tag: selectedTag.value)
                        }
                    }.padding(10)
                }
            }
            List(viewModel.selectedCreditList, id: \.id) { item in
                VStack {
                    Text(item.bank ?? "nil")
                    Text(item.name ?? "nil")
                    Text(item.kredi ?? "nil")
                    Text(item.min?.rawValue ?? "nil")
                    Text(item.max?.rawValue ?? "nil")
                    Text(item.faiz ?? "nil")
                }
            }
        }
    }
}
