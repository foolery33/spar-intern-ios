//
//  GoodsCartDelegate.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

protocol GoodsCartDelegate {
	func addToCart(goodId: String, measurementUnit: MeasurementUnitType, amount: Double)
	func updateCartItem(goodId: String, measurementUnit: MeasurementUnitType, amount: Double)
	func deleteCartItem(goodId: String)
}
