//
//  GoodCardView.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 09.08.2024.
//

import SwiftUI

struct GoodCardView: View {
	// MARK: - Public

	let mode: GoodsCatalogMode
	let goodModel: GoodModel
	let goodListCartModel: GoodListCartModel
	let cartDelegate: GoodsCartDelegate?
	let favouriteGoodsDelegate: FavouriteGoodsDelegate?
	@State var isFavourite: Bool

	// MARK: - Private

	@State private var isOrdered = false

	// MARK: - Body

    var body: some View {
		switch mode {
		case .grid:
			GoodGridCardView(
				goodModel: goodModel,
				goodListCartModel: goodListCartModel,
				cartDelegate: cartDelegate,
				favouriteGoodsDelegate: favouriteGoodsDelegate,
				isOrdered: $isOrdered,
				isFavourite: $isFavourite
			)
		case .list:
			GoodListCardView(
				goodModel: goodModel,
				goodListCartModel: goodListCartModel,
				delegate: cartDelegate, 
				favouriteGoodsDelegate: favouriteGoodsDelegate,
				isOrdered: $isOrdered,
				isFavourite: $isFavourite
			)
		}
    }
}

#Preview {
	GoodCardView(
		mode: .grid,
		goodModel: GoodModel(
			id: UUID().uuidString,
		 name: "сыр Ламбер 500/0 230г",
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
	 ),
		goodListCartModel: .init(isInCart: false, measurementUnit: .item, amount: 0),
		cartDelegate: nil, favouriteGoodsDelegate: nil, isFavourite: false
	)
}
