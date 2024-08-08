//
//  GoodBadgeType.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

enum GoodBadgeType {
	case pricesHit
	case new
	case cardPrice

	var text: String {
		switch self {
		case .pricesHit:
			"Удар по ценам"
		case .new:
			"Новинки"
		case .cardPrice:
			"Цена по карте"
		}
	}

	var badgeBackgroundColor: Color {
		switch self {
		case .pricesHit:
			AppColors.GoodBadge.priceHit
		case .new:
			AppColors.GoodBadge.new
		case .cardPrice:
			AppColors.GoodBadge.cardPrice
		}
	}
}
