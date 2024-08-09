//
//  FavouriteGoodsServiceProtocol.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

protocol FavouriteGoodsServiceProtocol: AnyObject {
	var favouriteGoods: [String] { get set }

	func addToFavourites(goodId: String)
	func deleteFromFavourites(goodId: String)
}
