import SwiftUI

struct MainTabView: View {

    @StateObject var viewModel = MainViewModel.sample()

    var body: some View {
        TabView {
            MainView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "star")
                }
            Color.red
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
