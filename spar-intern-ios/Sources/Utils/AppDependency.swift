//
//  AppDependency.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

protocol HasCartStoreService {
	var cartStoreService: CartStoreServiceProtocol { get }
}

protocol HasFavouriteGoodsService {
	var favouriteGoodsService: FavouriteGoodsServiceProtocol { get }
}

final class AppDependency {
	// MARK: - Init

	init() {
		cartStoreService = CartStoreService()
		favouriteGoodsService = FavouriteGoodsService()
	}

	// MARK: - Public

	var cartStoreService: CartStoreServiceProtocol
	var favouriteGoodsService: FavouriteGoodsServiceProtocol
}

// MARK: - HasCartStoreService

extension AppDependency: HasCartStoreService {}

// MARK: - HasFavouriteGoodsService

extension AppDependency: HasFavouriteGoodsService {}
