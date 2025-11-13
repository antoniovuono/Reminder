//
//  String+Ext.swift
//  Reminder
//
//  Created by Antonio Vuono on 13/11/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
