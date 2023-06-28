//
//  DateHelper.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import Foundation

protocol DateHelperProtocol {
    func getCurrentDate() -> String
}

final class DateHelper: DateHelperProtocol {

    static let shared = DateHelper()

    private let dateFormatter = DateFormatter()

    private init() {}

    func getCurrentDate() -> String {
        let date = Date()

        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd MMMM, yyyy"

        let text = dateFormatter.string(from: date)

        return text
    }
}
