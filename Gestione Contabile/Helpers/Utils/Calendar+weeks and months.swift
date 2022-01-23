import Foundation

extension Calendar {
    func startOfWeek(for date: Date) -> Date? {
        dateInterval(of: .weekOfYear, for: date)?.start
    }

    func currentWeek(for date: Date) -> DateInterval {
        dateInterval(of: .weekday, for: date) ?? DateInterval()
    }

    func currentWeekDays(as date: Date) -> [Date] {
        guard let startOfWeek = startOfWeek(for: date) else {
            return []
        }
        return (0...6).reduce(into: []) { result, daysToAdd in
            result.append(Calendar.current.date(byAdding: .day, value: daysToAdd, to: startOfWeek))
        }
        .compactMap { $0 }
    }

    func startOfMonth(for date: Date) -> Date? {
        dateInterval(of: .month, for: date)?.start
    }

    func currentMonth(for date: Date) -> DateInterval {
        dateInterval(of: .month, for: date) ?? DateInterval()
    }

    func currentYearMonths(as date: Date) -> [Date] {
        guard let startOfMonth = startOfMonth(for: date) else { return [] }

        return (0...11).reduce(into: []) { result, monthToAdd in
            result.append(Calendar.current.date(byAdding: .month, value: monthToAdd, to: startOfMonth))
        }
        .compactMap { $0 }
    }
}

extension Date {
    var weekDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: self)
    }
    var month: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: self)
    }
}
