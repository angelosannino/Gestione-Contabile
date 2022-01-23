import SwiftUI

struct MonthlyView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .bottom) {
                ForEach(Calendar.current.currentYearMonths(as: Date()), id:\.self) {
                    MonthlyViewCell(date: $0, viewModel: viewModel)
                }
            }
            .padding()
        }
    }
}

struct MonthlyViewCell: View {
    let date: Date
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                incomeBar
                expenseBar
            }
            Button {
                viewModel.currentMonth = Calendar.current.currentMonth(for: date)
            } label: {
                Text(date.month)
                    .padding(10)
                    .frame(width: 150)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    )
            }
            montlyResumen
        }
        .tint(.black)
    }

    var montlyResumen: some View {
        VStack {
            expectedBalance
            actualBalance
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .shadow(radius: 5)
        )
    }

    var expectedBalance: some View {
        VStack(spacing: 0) {
            Text("Expected Balance:")
                .fontWeight(.bold)
            HStack {
                HStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 20, height: 6)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 20, height: 6)
                }
                Spacer()
                HStack(spacing: 2) {
                    Text(summary.expectedBalance.isNegative ? "-" : "+")
                    Text(summary.expectedBalance.currencyString)
                }
                .foregroundColor(summary.expectedBalance.isNegative ? .red : .green)
            }
        }
        .font(.system(size: 14))
    }
    
    var actualBalance: some View {
        VStack(spacing: 0) {
            Text("Actual Balance:")
                .fontWeight(.bold)
            HStack {
                HStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 20, height: 6)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 20, height: 6)
                }
                Spacer()
                HStack(spacing: 2) {
                    Text(summary.paidBalance.isNegative ? "-" : "+")
                    Text(summary.paidBalance.currencyString)
                }
                .foregroundColor(summary.paidBalance.isNegative ? .red : .green)
            }
        }
        .font(.system(size: 14))
    }

    var incomeBar: some View {
        VStack {
            VStack {
                Text("\(summary.formattedIncome) /")
                Text("**\(summary.paidIncome.currencyString)**")
            }
            .font(.system(size: 12))
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.green)
                    .opacity(0.5)
                    .frame(width: 25, height: summary.expectedIncome / 10)
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 25, height: summary.paidIncome / 10)
            }
        }
    }

    var expenseBar: some View {
        VStack {
            VStack {
                Text("\(summary.formattedExpense) /")
                Text("**\(summary.paidExpense.currencyString)**")
            }
            .font(.system(size: 12))
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(.red)
                    .opacity(0.5)
                    .frame(width: 25, height: summary.expectedExpense / 10)
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 25, height: summary.paidExpense / 10)
            }
        }
    }
}

struct MonthlySummary {
    let expectedIncome: Double
    let paidIncome: Double
    let expectedExpense: Double
    let paidExpense: Double

    var expectedBalance: Double {
        expectedIncome - expectedExpense
    }

    var paidBalance: Double {
        paidIncome - paidExpense
    }

    var formattedIncome: String {
        if expectedIncome != 0 {
            return expectedIncome.currencyString
        }
        return ""
    }

    var formattedExpense: String {
        if expectedExpense != 0 {
            return expectedExpense.currencyString
        }
        return ""
    }
}

extension MonthlyViewCell {
    var summary: MonthlySummary {
        let entries = viewModel.monthlyEntries(for: Calendar.current.currentMonth(for: date))
        let expectedIncome = entries.reduce(into: 0.0) { result, entry in
            if entry.computeAmount > 0 {
                result += entry.totalAmount
            }
        }
        let paidIncome = entries.reduce(into: 0.0) { result, entry in
            if entry.computeAmount > 0 {
                result += entry.paidAmount
            }
        }
        let expectedExpense = entries.reduce(into: 0.0) { result, entry in
            if entry.computeAmount < 0 {
                result += entry.totalAmount
            }
        }
        let paidExpense = entries.reduce(into: 0.0) { result, entry in
            if entry.computeAmount < 0 {
                result += entry.paidAmount
            }
        }
        return MonthlySummary(expectedIncome: expectedIncome,
                              paidIncome: paidIncome,
                              expectedExpense: expectedExpense,
                              paidExpense: paidExpense)
    }
}

struct MonthlyView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyView(viewModel: .sample())
            .previewLayout(.sizeThatFits)
    }
}
