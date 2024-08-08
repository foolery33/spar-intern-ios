//
//  GoodsCatalogViewModel.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import Foundation

final class GoodsCatalogViewModel: ObservableObject {
	typealias Dependencies = HasCartStoreService

	// MARK: - Init

	init(dependencies: Dependencies) {
		self.dependencies = dependencies
	}

	// MARK: - Public

	@Published private(set) var goods: [GoodModel] = []
	@Published private(set) var message: String = ""
	@Published private(set) var isAlertShowing: Bool = false
	@Published private(set) var cartItems: [CartItem] = []

	func viewDidLoad() {
		populateGoods()
		fetchCartItems()
	}

	func addToCart(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) {
		do {
			try dependencies.cartStoreService.addToCart(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
		} catch {
			handleError(error)
		}
	}

	func fetchCartItems() {
		do {
			cartItems = try dependencies.cartStoreService.fetchCartItems()
		} catch {
			handleError(error)
		}
	}

	func updateCartItem(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) {
		do {
			try dependencies.cartStoreService.updateCartItem(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
		} catch {
			handleError(error)
		}
	}

	func deleteCartItem(goodId: String) {
		do {
			try dependencies.cartStoreService.deleteCartItem(goodId: goodId)
		} catch {
			handleError(error)
		}
	}

	func getGoodListCartModel(from goodModel: GoodModel) -> GoodListCartModel {
		if let cartItem = cartItems.first(where: { $0.goodId == goodModel.id }) {
			return GoodListCartModel(
				isInCart: true,
				measurementUnit: cartItem.unit,
				amount: cartItem.amount
			)
		} else {
			return GoodListCartModel(
				isInCart: false,
				measurementUnit: MeasurementUnitType.kg,
				amount: MeasurementUnitType.kg.defaultValue
			)
		}
	}

	// MARK: - Private

	private let dependencies: Dependencies

	private func handleError(_ error: Error) {
		isAlertShowing = true
		message = error.localizedDescription
	}

	private func populateGoods() {
		goods.append(GoodModel(
			id: "1",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: "Франция 🇫🇷",
			priceInteger: 99,
			priceCents: 90,
			quantityType: .kgItem,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage1,
			badgeType: .pricesHit,
			discountPercent: 25
		))
		goods.append(GoodModel(
			id: "2",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: nil,
			priceInteger: 99,
			priceCents: 90,
			quantityType: .kg,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage2,
			badgeType: .new,
			discountPercent: nil
		))
		goods.append(GoodModel(
			id: "3",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: nil,
			priceInteger: 99,
			priceCents: 90,
			quantityType: .item,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage3,
			badgeType: nil,
			discountPercent: nil
		))
		goods.append(GoodModel(
			id: "4",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: nil,
			priceInteger: 99,
			priceCents: 90,
			quantityType: .item,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage4,
			badgeType: nil,
			discountPercent: 25
		))
		goods.append(GoodModel(
			id: "5",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: "Франция 🇫🇷",
			priceInteger: 99,
			priceCents: 90,
			quantityType: .kgItem,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage5,
			badgeType: nil,
			discountPercent: nil
		))
		goods.append(GoodModel(
			id: "6",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: nil,
			priceInteger: 99,
			priceCents: 90,
			quantityType: .kgItem,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage6,
			badgeType: .cardPrice,
			discountPercent: nil
		))
		goods.append(GoodModel(
			id: "7",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: nil,
			priceInteger: 99,
			priceCents: 90,
			quantityType: .kg,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage7,
			badgeType: nil,
			discountPercent: nil
		))
		goods.append(GoodModel(
			id: "8",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: nil,
			priceInteger: 99,
			priceCents: 90,
			quantityType: .kg,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage8,
			badgeType: .new,
			discountPercent: 25
		))
		goods.append(GoodModel(
			id: "9",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: "Франция 🇫🇷",
			priceInteger: 99,
			priceCents: 90,
			quantityType: .kgItem,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage9,
			badgeType: nil,
			discountPercent: 25
		))
		goods.append(GoodModel(
			id: "10",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: "Франция 🇫🇷",
			priceInteger: 99,
			priceCents: 90,
			quantityType: .item,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage10,
			badgeType: .cardPrice,
			discountPercent: nil
		))
		goods.append(GoodModel(
			id: "11",
			name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
			country: nil,
			priceInteger: 99,
			priceCents: 90,
			quantityType: .item,
			oldPrice: "199,0",
			rating: 4.1,
			reviewsNumber: 20,
			image: AppImages.goodImage11,
			badgeType: .new,
			discountPercent: 25
		))
	}
}
