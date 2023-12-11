//
//  TransactionData.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 26.11.2023.
//

import Foundation
import UIKit


struct TransactionData {
    var id: UUID
    var date: Date
    var receiverName: String
    var money: Float
    var avatar: UIImage?
    var message: String?

    init(id: UUID, date: Date, receiverName: String, money: Float, avatar: UIImage? = nil, message: String? = nil) {
        self.id = id
        self.date = date
        self.receiverName = receiverName
        self.money = money
        self.avatar = avatar
        self.message = message
    }
}
