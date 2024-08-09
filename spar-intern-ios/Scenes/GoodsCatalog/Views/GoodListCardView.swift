//
//  GoodListCardView.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

struct GoodListCardView: View {
	// MARK: - Init

	init(
		goodModel: GoodModel,
		goodListCartModel: GoodListCartModel,
		delegate: GoodsCartDelegate?,
		favouriteGoodsDelegate: FavouriteGoodsDelegate?,
		isOrdered: Binding<Bool>,
		isFavourite: Binding<Bool>
	) {
		self.goodModel = goodModel
		self.isInCart = goodListCartModel.isInCart
		self.measurementUnit = goodListCartModel.measurementUnit
		self.amount = goodListCartModel.amount
		self.cartDelegate = delegate
		self.favouriteGoodsDelegate = favouriteGoodsDelegate
		self._isOrdered = isOrdered
		self._isFavourite = isFavourite
	}

	// MARK: - Public

	let goodModel: GoodModel
	let cartDelegate: GoodsCartDelegate?
	let favouriteGoodsDelegate: FavouriteGoodsDelegate?
	@Binding var isOrdered: Bool
	@Binding var isFavourite: Bool

	// MARK: - Private

	@State private var isInCart: Bool
	@State private var measurementUnit: MeasurementUnitType
	@State private var amount: Double

	// MARK: - Body

    var body: some View {
		VStack(spacing: 0) {
			AppColors.surfaces0006
				.frame(height: 1)
			HStack(spacing: 8) {
				ZStack {
					goodModel.image
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 144, height: 144)
					VStack(spacing: 0) {
						HStack(spacing: 0) {
							if let badgeType = goodModel.badgeType {
								Text(badgeType.text)
									.foregroundStyle(AppColors.white)
									.font(AppFonts.System.regular10)
									.padding(.top, 2)
									.padding(.bottom, 4)
									.padding(.trailing, 6)
									.padding(.leading, 12)
									.background(
										badgeType.badgeBackgroundColor
											.clipShape(.rect(cornerRadii: .init(bottomTrailing: 6, topTrailing: 6)))
									)
							}
							Spacer()
						}
						Spacer()
						if let discountPercent = goodModel.discountPercent {
							HStack(spacing: 0) {
								Spacer()
								Text("\(discountPercent)%")
									.font(AppFonts.System.bold16)
									.foregroundStyle(AppColors.additional004)
									.padding(.horizontal, 5)
							}
						}
					}
				}
				.frame(width: 144, height: 144)
				.clipShape(.rect(cornerRadius: 8))
				ZStack(alignment: .topTrailing) {
					VStack(alignment: .leading, spacing: 0) {
						HStack(spacing: 4) {
							HStack(spacing: 2) {
								AppIcons.star
								Text(String(format: "%.1f", goodModel.rating))
									.foregroundStyle(AppColors.text002)
									.font(AppFonts.System.regular12)
							}
							AppColors.icons003
								.frame(width: 1, height: 16)
							Text(String(format: NSLocalizedString("reviews", comment: ""), goodModel.reviewsNumber))
								.foregroundStyle(AppColors.icons003)
								.font(AppFonts.System.regular12)
						}
						.padding(.vertical, 2)
						.padding(.leading, 4)
						VStack(alignment: .leading, spacing: 2) {
							Text(goodModel.name)
								.foregroundStyle(AppColors.icons002)
								.font(AppFonts.System.regular12)
								.padding(.horizontal, 8)
							if let country = goodModel.country {
								Text(country)
									.foregroundStyle(AppColors.icons003)
									.font(AppFonts.System.regular12)
									.padding(.vertical, 2)
									.padding(.horizontal, 8)
							}
						}
						.padding(.trailing, 32)
						.padding(.vertical, 4)
						Spacer()
						if isInCart, goodModel.quantityType.canBuySingleItem {
							Picker("", selection: $measurementUnit) {
								ForEach(MeasurementUnitType.allCases) { unit in
									Text(unit.appValue)
										.foregroundStyle(AppColors.icons003)
										.font(AppFonts.System.regular14)
										.tag(unit)
								}
							}
							.pickerStyle(.segmented)
							.padding(.horizontal, 5)
							.padding(.vertical, 4)
						}
						HStack(spacing: 0) {
							if !isInCart {
								VStack(alignment: .leading, spacing: 0) {
									HStack(spacing: 2) {
										Text("\(goodModel.priceInteger)")
											.foregroundStyle(AppColors.icons001)
											.font(AppFonts.System.bold20)
										Text("\(goodModel.priceCents)")
											.foregroundStyle(AppColors.icons001)
											.font(AppFonts.System.bold16)
											.offset(y: -1)
										goodModel.quantityType.priceIcon
											.foregroundStyle(AppColors.icons001)
									}
									Text(goodModel.oldPrice)
										.foregroundStyle(AppColors.icons003)
										.font(AppFonts.System.regular12)
										.strikethrough()
								}
								.padding(.leading, 4)
								Spacer()
							}
							CartButtonView(isPressed: $isInCart, goodId: goodModel.id, measurementUnit: $measurementUnit, amount: $amount, delegate: cartDelegate)
						}
						.padding(4)
					}
					GoodActionListView(goodId: goodModel.id, isOrdered: $isOrdered, isFavourite: $isFavourite, iconsUnselectedColor: AppColors.icons004, delegate: favouriteGoodsDelegate)
				}
			}
			.padding([.vertical, .leading], 16)
			.padding(.trailing, 8)
			.frame(height: 144 + 32)
			.background(AppColors.white)
		}
    }
}

// MARK: - Preview

#Preview {
    GoodListCardView(goodModel: GoodModel(
		id: UUID().uuidString,
		name: "сыр Ламбер 500/0 230г",
		country: "Франция 🇫🇷",
		priceInteger: 99,
		priceCents: 90,
		quantityType: .kgItem,
		oldPrice: "199,0",
		rating: 4.1,
		reviewsNumber: 20,
		image: AppImages.goodImage11,
		badgeType: .pricesHit,
		discountPercent: 25
	), goodListCartModel: .init(isInCart: false, measurementUnit: .item, amount: 0.1), delegate: nil, favouriteGoodsDelegate: nil, isOrdered: .constant(false), isFavourite: .constant(true))
}
