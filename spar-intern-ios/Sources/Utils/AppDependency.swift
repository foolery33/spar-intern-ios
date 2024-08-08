//
//  AppDependency.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

protocol HasCartStoreService {
	var cartStoreService: CartStoreServiceProtocol { get }
}

final class AppDependency {
	// MARK: - Init

	init() {
		cartStoreService = CartStoreService()
	}

	// MARK: - Public

	var cartStoreService: CartStoreServiceProtocol
}

// MARK: - HasCartStoreService

extension AppDependency: HasCartStoreService {}
