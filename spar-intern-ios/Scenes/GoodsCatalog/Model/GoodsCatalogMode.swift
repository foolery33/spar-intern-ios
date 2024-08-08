//
//  GoodsCatalogMode.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

enum GoodsCatalogMode {
	case grid, list

	var image: Image {
		switch self {
		case .grid:
			AppIcons.gridGoods
		case .list:
			AppIcons.listGoods
		}
	}

	var verticalSpacing: CGFloat {
		switch self {
		case .grid:
			8
		case .list:
			0
		}
	}

	var horizontalSpacing: CGFloat {
		switch self {
		case .grid:
			16
		case .list:
			0
		}
	}
}
