//
//  CartStoreServiceProtocol.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

protocol CartStoreServiceProtocol {
	func addToCart(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) throws
	func fetchCartItems() throws -> [CartItem]
	func updateCartItem(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) throws
	func deleteCartItem(goodId: String) throws
}
