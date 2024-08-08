//
//  CartButtonView.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

struct CartButtonView: View {
	// MARK: - Init

	init(isPressed: Binding<Bool>, measurementUnit: Binding<MeasurementUnitType>) {
		self._isPressed = isPressed
		self._measurementUnit = measurementUnit
		self.amount = measurementUnit.wrappedValue.defaultValue
	}

	// MARK: - Public

	@Binding var isPressed: Bool
	@Binding var measurementUnit: MeasurementUnitType

	// MARK: - Private

	@State private var amount: Double

	// MARK: - Body

    var body: some View {
		HStack(spacing: 0) {
			if !isPressed {
				Spacer().frame(width: 6)
				Button(action: {
					withAnimation(.easeInOut(duration: 0.5)) {
						isPressed.toggle()
						amount = measurementUnit.defaultValue
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
					if -0.01 < abs(amount), abs(amount) < 0.01 {
						withAnimation(.easeInOut(duration: 0.5)) {
							isPressed = false
						}
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
			}
		}
    }
}

// MARK: - Preview

#Preview {
	@State var isPressed = true
	@State var measurementUnit: MeasurementUnitType = .item
	return CartButtonView(isPressed: $isPressed, measurementUnit: $measurementUnit)
}
