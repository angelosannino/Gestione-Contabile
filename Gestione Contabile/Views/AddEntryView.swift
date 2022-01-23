import SwiftUI

struct AddEntryView: View {

    @ObservedObject var viewModel: MainViewModel

    var body: some View {

        
        Text("Hello, World!")
        
        
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(viewModel: .sample())
    }
}
