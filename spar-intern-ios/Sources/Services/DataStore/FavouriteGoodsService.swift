//
//  FavouriteGoodsService.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

import Foundation

final class FavouriteGoodsService: FavouriteGoodsServiceProtocol {
	// MARK: - Public

	var favouriteGoods: [String] {
		get {
			(userDefaults.array(forKey: UserDefaultsKeys.favouriteGoods) as? [String]).orEmptyArray()
		}
		set {
			userDefaults.setValue(newValue, forKey: UserDefaultsKeys.favouriteGoods)
		}
	}

	func addToFavourites(goodId: String) {
		var goods = favouriteGoods
		goods.append(goodId)
		favouriteGoods = goods
	}

	func deleteFromFavourites(goodId: String) {
		var goods = favouriteGoods
		if let index = favouriteGoods.firstIndex(of: goodId) {
			goods.remove(at: index)
			favouriteGoods = goods
		}
	}

	// MARK: - Private

	private enum UserDefaultsKeys {
		static let favouriteGoods = "favouriteGoods"
	}

	private let userDefaults = UserDefaults.standard
}
