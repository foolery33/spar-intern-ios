//
//  CartStoreServiceError.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

import Foundation

enum CartStoreServiceError: LocalizedError {
	case persistentStoresLoadFail
	case operationFail
	case cartItemNotFound
	case contextSaveFail

	var errorDescription: String? {
		switch self {
		case .persistentStoresLoadFail:
			""
		case .operationFail:
			""
		case .cartItemNotFound:
			""
		case .contextSaveFail:
			""
		}
	}
}
