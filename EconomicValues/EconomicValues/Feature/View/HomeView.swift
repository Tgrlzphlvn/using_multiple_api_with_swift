//
//  ContentView.swift
//  EconomicValues
//
//  Created by Tuğrul Özpehlivan on 4.10.2022.


import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = InterestViewModel()
    
    @State var selectedTag : PickerTags = PickerTags.allCases.first!
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).padding(20).foregroundColor(.white).frame(height: 80).shadow(radius: CGFloat(10))
                    HStack {
                        Text("Kategori : ").foregroundColor(.blue)
                        Picker(selection: $selectedTag, label: Text("Kategoriler")) {
                            ForEach(PickerTags.allCases) { item in
                                Text(item.rawValue).tag(item)
                            }
                        }
                    }
                }
                switch selectedTag {
                case PickerTags.creditBid:
                    CreditBidChart(viewModel: viewModel,pickerTag: selectedTag)
                case PickerTags.mevduat:
                    MevduatChart(viewModel: viewModel, selectedTag: selectedTag)
                case .ihtiyacKredisi:
                    CreditRatesChart(viewModel: viewModel, selectedTag: selectedTag)
                case .konutKredisi:
                    CreditRatesChart(viewModel: viewModel, selectedTag: selectedTag)
                case .tasitKredisi:
                    CreditRatesChart(viewModel: viewModel, selectedTag: selectedTag)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
