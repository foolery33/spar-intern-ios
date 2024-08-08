//
//  CartItem.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

import Foundation
import CoreData

extension CartItem {
	var unit: MeasurementUnitType {
		get {
			MeasurementUnitType(rawValue: measurementUnit ?? "") ?? .item
		}
		set {
			measurementUnit = newValue.rawValue
		}
	}
}
