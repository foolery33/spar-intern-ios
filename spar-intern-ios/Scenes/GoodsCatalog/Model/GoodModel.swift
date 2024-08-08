//
//  GoodModel.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

struct GoodModel {
	let id: String
	let name: String
	let country: String?
	let	priceInteger: Int
	let priceCents: Int
	let quantityType: GoodQuantityType
	let oldPrice: String
	let rating: Double
	let reviewsNumber: Int
	let image: Image
	let badgeType: GoodBadgeType
	let discountPercent: Int?
	let isFavourite: Bool
	let isOrdered: Bool
}
