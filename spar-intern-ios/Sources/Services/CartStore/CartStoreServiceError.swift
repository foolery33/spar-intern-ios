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
			NSLocalizedString("persistentStoresLoadFail", comment: "")
		case .operationFail:
			NSLocalizedString("operationFail", comment: "")
		case .cartItemNotFound:
			NSLocalizedString("cartItemNotFound", comment: "")
		case .contextSaveFail:
			NSLocalizedString("contextSaveFail", comment: "")
		}
	}
}
