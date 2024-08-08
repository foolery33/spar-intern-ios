//
//  GoodQuantityType.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

enum GoodQuantityType {
	case item, kg, kgItem

	var priceIcon: Image {
		switch self {
		case .item:
			AppIcons.rubPerKg
		case .kg:
			AppIcons.rubPerKg
		case .kgItem:
			AppIcons.rubPerKg
		}
	}

	var canBuySingleItem: Bool {
		switch self {
		case .item:
			false
		case .kg, .kgItem:
			true
		}
	}
}
