import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                MonthlyView(viewModel: viewModel)
                List {
                    ForEach(viewModel.monthlyEntries(for: viewModel.currentMonth)) {
                        AccountEntryCell(entry: $0)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(Localized.string(Constants.LocalizedKeys.mainNavigationTitle))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: .sample())
.previewInterfaceOrientation(.portrait)
    }
}
