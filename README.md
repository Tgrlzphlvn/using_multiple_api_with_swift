# Birden fazla parametreli API yönetmek.

Bu projede bir UI tasarlamaktan öte birden fazla parametreli birkaç API ile servise çıkmayı nasıl yapabiliriz sorusuna kendimce cevap bulmaya çalıştım. API sağlayacım pek iyi olmasada amaç Enum'lar sayesinde hem UI hemde URL parametrelerini iç içe kullanarak API'dan veri çekebilmekti.

```
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
```
Picker'da, yani UI'da gösterilecek text için ayrı, istekte bulunacağımız URL parametereleri için ayrı birer Enum kullanarak bunları Picker'a yazdığım Enum'a extension yazarak switch yardımı ile seçilen Picker Enum'ının URL parametresi karşılığını verecek şekilde yazdım. Bu sayede UI'da düzgün bir text göstererek kullanıcıya seçmek istediği parameterleri seçerken URL'in istediği parametreyi de view model'daki fonksiyonuma vererek servise istek atılmasını sağladım.

Switch yardımıyla UI tarafında da seçilen PickerTag'lere göre özgü basitçe hazırladığım seçim ekranı göstererek tek bir ekranda sadece ihtiyaç duyulan widget'ın göstermini sağladım. Bu sayade tek bir ekranda işimi halletmiş oldum.
```
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
```
Servise istek atarken çok fazla parametre istenen durumları nasıl yönetebilirim sorusuna aradığım cevap sonucu ortaya çıkan bir proje oldu. Umarım bu soruyla karşılaşmış olanlara faydalı olur. 
