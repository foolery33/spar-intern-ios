//
//  MeasurementUnitType.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import Foundation

enum MeasurementUnitType: String, CaseIterable, Identifiable {
	case item = "item"
	case kg = "kg"

	var id: String { self.rawValue }

	var appValue: String {
		switch self {
		case .item:
			NSLocalizedString("item", comment: "")
		case .kg:
			NSLocalizedString("kg", comment: "")
		}
	}

	var defaultValue: Double {
		switch self {
		case .item:
			1
		case .kg:
			0.1
		}
	}

	func formatAmountString(amount: Double) -> String {
		switch self {
		case .item:
			String(format: NSLocalizedString("itemAmount", comment: ""), Int(amount))
		case .kg:
			String(format: NSLocalizedString("kgAmount", comment: ""), amount)
		}
	}
}
