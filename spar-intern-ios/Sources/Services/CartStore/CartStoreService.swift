//
//  CartStoreService.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

import CoreData

final class CartStoreService {
	// MARK: - Init

	init() {
		persistentContainer = NSPersistentContainer(name: "spar_intern_ios") // Убедитесь, что имя совпадает с вашим файлом xcdatamodeld
		persistentContainer.loadPersistentStores { _, error in
			if let error = error {
				print(error.localizedDescription)
			}
		}
	}

	// MARK: - Private

	private let persistentContainer: NSPersistentContainer

	private func saveContext() throws {
		let context = persistentContainer.viewContext
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				throw CartStoreServiceError.contextSaveFail
			}
		}
	}
}

// MARK: - CartStoreServiceProtocol

extension CartStoreService: CartStoreServiceProtocol {
	func addToCart(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) throws {
		let context = persistentContainer.viewContext
		let cartItem = CartItem(context: context)
		cartItem.goodId = goodId
		cartItem.unit = measurementUnit
		cartItem.amount = amount

		try saveContext()
	}

	func fetchCartItems() throws -> [CartItem] {
		let context = persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<CartItem> = CartItem.fetchRequest()

		do {
			return try context.fetch(fetchRequest)
		} catch {
			throw CartStoreServiceError.operationFail
		}
	}

	func updateCartItem(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) throws {
		let context = persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<CartItem> = CartItem.fetchRequest()
		fetchRequest.predicate = NSPredicate(format: "goodId == %@", goodId)

		do {
			let items = try context.fetch(fetchRequest)
			if let item = items.first {
				item.amount = amount
				item.measurementUnit = measurementUnit.rawValue
				try saveContext()
			} else {
				throw CartStoreServiceError.cartItemNotFound
			}
		} catch {
			print("Error updating cart item: \(error)")
		}
	}

	func deleteCartItem(goodId: String) throws {
		let context = persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<CartItem> = CartItem.fetchRequest()
		fetchRequest.predicate = NSPredicate(format: "goodId == %@", goodId)

		do {
			let items = try context.fetch(fetchRequest)
			if let item = items.first {
				context.delete(item)
				try saveContext()
			}
		} catch {
			throw CartStoreServiceError.operationFail
		}
	}
}
