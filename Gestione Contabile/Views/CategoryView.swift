import SwiftUI

struct CategoryView: View {

    @StateObject var model = CategoryModel()

    @FetchRequest(sortDescriptors: [],
                  animation: .default) private var categories: FetchedResults<EntryCategory>

    var body: some View {
        List {
            Button {
                model.new(name: "Prova",
                          entryType: .expense,
                          categoryType: .expected)
            } label: {
                Text("Add new")
            }

            ForEach(categories) { category in
                Button {
                    model.delete(category)
                } label: {
                    VStack(alignment: .leading) {
                        Text(category.name ?? "").font(.headline)
                        Text(category.entryType.localized)
                        Text(category.categoryType.localized)
                    }
                }
                .tint(.black)

            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
