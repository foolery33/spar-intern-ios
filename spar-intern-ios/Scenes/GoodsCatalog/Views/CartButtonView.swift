//
//  CartButtonView.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

struct CartButtonView: View {
	// MARK: - Public

	@Binding var isPressed: Bool
	var goodId: String
	@Binding var measurementUnit: MeasurementUnitType
	@Binding var amount: Double

	var delegate: GoodsCartDelegate?

	// MARK: - Body

    var body: some View {
		HStack(spacing: 0) {
			if !isPressed {
				Spacer().frame(width: 6)
				Button(action: {
					withAnimation(.easeInOut(duration: 0.5)) {
						isPressed = true
						amount = measurementUnit.defaultValue
						delegate?.addToCart(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
					}
				}) {
					AppIcons.cart
						.foregroundStyle(AppColors.white)
						.padding(10)
				}
				Spacer().frame(width: 6)
			} else {
				Button(action: {
					amount = max(0, amount - measurementUnit.defaultValue)
					delegate?.updateCartItem(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
					if -0.01 < abs(amount), abs(amount) < 0.01 {
						withAnimation(.easeInOut(duration: 0.5)) {
							isPressed = false
						}
						delegate?.deleteCartItem(goodId: goodId)
					}
				}) {
					AppIcons.minus
						.foregroundStyle(AppColors.white)
						.padding(10)
				}
				Spacer()
				VStack(spacing: 2) {
					Text(measurementUnit.formatAmountString(amount: amount))
						.foregroundStyle(AppColors.white)
						.font(AppFonts.System.bold16)
					Text("~5,92 ₽")
						.foregroundStyle(AppColors.white.opacity(0.8))
						.font(AppFonts.System.regular12)
				}
				.padding(.vertical, 2)
				Spacer()
				Button(action: {
					amount += measurementUnit.defaultValue
					delegate?.updateCartItem(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
				}) {
					AppIcons.plus
						.foregroundStyle(AppColors.white)
						.padding(10)
				}
			}
		}
		.background(RoundedRectangle(cornerRadius: 40).fill(AppColors.primary001))
		.onChange(of: measurementUnit) { _, newValue in
			withAnimation {
				amount = newValue.defaultValue
				delegate?.updateCartItem(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
			}
		}
    }
}

// MARK: - Preview

#Preview {
	@State var isPressed = true
	@State var measurementUnit: MeasurementUnitType = .item
	@State var amount: Double = 1
	return CartButtonView(isPressed: $isPressed, goodId: "", measurementUnit: $measurementUnit, amount: $amount)
}
