import SwiftUI

struct WeeklyView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Calendar.current.currentWeekDays(as: Date()), id:\.self) { date in
                    Text(date.weekDay)
                        .padding(10)
                        .frame(width: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        )
                }
            }
            .padding()
        }
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView(viewModel: .sample())
            .previewLayout(.sizeThatFits)
    }
}
