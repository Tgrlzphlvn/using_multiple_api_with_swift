//
//  MevduatChart.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 11.10.2022.
//

import SwiftUI


struct MevduatChart: View {
    
    var viewModel : InterestViewModel
    var selectedTag : PickerTags
    
    @State var selectedMonth : PickerDate = PickerDate.allCases.first!
    @State var monthTextController = ""
    @State var priceTextController = ""
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).padding(20).foregroundColor(.white).frame(height: 200).shadow(radius: CGFloat(10))
                VStack {
                    HStack {
                        Text("Taksit birimi : ").foregroundColor(.blue)
                        Picker(selection: $selectedMonth, label: Text("Aylar")) {
                            ForEach(PickerDate.allCases) { item in
                                Text(item.rawValue).tag(item)
                            }
                        }
                        Spacer()
                    }.padding(.leading, 40)
                    HStack {
                        Text("Ay : ").foregroundColor(.blue)
                        TextField("Ay", text: $monthTextController)
                    }.padding(.leading, 40)
                    HStack {
                        Text("Miktar : ").foregroundColor(.blue)
                        TextField("Miktar", text: $priceTextController)
                    }.padding(.leading, 40)
                    
                    Button("Getir") {
                        Task.init {
                            viewModel.getMevduat(tag: selectedTag.value, monthParameter: selectedMonth.value, monthCount: monthTextController, price: priceTextController)
                        }
                    }
                }
            }
            List(viewModel.mevduatList, id: \.id) { item in
                VStack {
                    Text(item.tl ?? "nil")
                    Text(item.oran ?? "nil")
                    Text(item.ay ?? "nil")
                }
            }
        }
    }
}
