//
//  Date.swift
//  RealThermometer
//
//  Created by miqo on 12.12.23.
//

import SwiftUI

extension Date {
    func formattedString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
