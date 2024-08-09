//
//  FavouriteGoodsDelegate.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

protocol FavouriteGoodsDelegate {
	func addToFavourites(goodId: String)
	func deleteFromFavourites(goodId: String)
}
