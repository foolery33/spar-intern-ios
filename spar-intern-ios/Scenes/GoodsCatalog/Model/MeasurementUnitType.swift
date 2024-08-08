//
//  MeasurementUnitType.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

enum MeasurementUnitType: String, CaseIterable, Identifiable {
	case item = "Шт"
	case kg = "Кг"

	var id: String { self.rawValue }

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
			String(Int(amount)) + " \(rawValue.lowercased())"
		case .kg:
			String(format: "%.1f", amount) + " \(self.rawValue.lowercased())"
		}
	}
}
