import Foundation
import SwiftUI

struct AccountEntryCell: View {
    let entry: AccountEntry
    
    var body: some View {
        VStack {
            Text(entry.category.name)
                .font(.headline)
            Divider()
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(entry.description)
                    Text("\(entry.subject.type.name): **\(entry.subject.name)**")
                }
                Spacer()
                Text(entry.amountToShow)
                    .foregroundColor(entry.computeAmount.isNegative ? .red : .black)
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .shadow(radius: 5)
        )
        .listRowSeparator(.hidden)
    }
}

struct AccountEntryCell_Previews: PreviewProvider {
    static var previews: some View {
        AccountEntryCell(entry: .mock())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
