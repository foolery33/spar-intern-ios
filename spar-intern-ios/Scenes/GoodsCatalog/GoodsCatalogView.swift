//
//  GoodsCatalogView.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

struct GoodsCatalogView: View {
	// MARK: - Public

	@ObservedObject var viewModel: GoodsCatalogViewModel

	// MARK: - Private

	@State private var catalogMode: GoodsCatalogMode = .grid

	// MARK: - Body

    var body: some View {
		ZStack {
			AppColors.surfaces001.ignoresSafeArea(.all)
			ScrollView {
				VStack(spacing: catalogMode.verticalSpacing) {
					BaseNavigationBar(leftView: {
						Button(action: {
							withAnimation {
								catalogMode = catalogMode == .grid ? .list : .grid
							}
						}, label: {
							RoundedRectangle(cornerRadius: 12)
								.fill(AppColors.surfaces002)
								.frame(width: 40, height: 40)
								.overlay(catalogMode.image.tint(AppColors.primary001))
						})
					}, rightView: {}, text: "")
					if catalogMode == .grid {
						LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 8, content: {
							ForEach(0..<viewModel.goods.count, id: \.self) { index in
								GoodGridCardView(
									goodModel: viewModel.goods[index],
									goodListCartModel: viewModel.getGoodListCartModel(from: viewModel.goods[index]),
									delegate: self
								)
							}
						})
						.padding(.horizontal, 16)
					} else {
						LazyVStack {
							ForEach(0..<viewModel.goods.count, id: \.self) { index in
								GoodListCardView(
									goodModel: viewModel.goods[index],
									goodListCartModel: viewModel.getGoodListCartModel(from: viewModel.goods[index]),
									delegate: self
								)
							}
						}
					}
				}
			}
			.scrollIndicators(.hidden)
		}
		.onViewDidLoad {
			viewModel.viewDidLoad()
		}
    }
}

extension GoodsCatalogView: GoodsCartDelegate {
	func addToCart(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) {
		viewModel.addToCart(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
	}
	
	func updateCartItem(goodId: String, measurementUnit: MeasurementUnitType, amount: Double) {
		viewModel.updateCartItem(goodId: goodId, measurementUnit: measurementUnit, amount: amount)
	}
	
	func deleteCartItem(goodId: String) {
		viewModel.deleteCartItem(goodId: goodId)
	}
}

protocol GoodsCartDelegate {
	func addToCart(goodId: String, measurementUnit: MeasurementUnitType, amount: Double)
	func updateCartItem(goodId: String, measurementUnit: MeasurementUnitType, amount: Double)
	func deleteCartItem(goodId: String)
}

// MARK: - Preview

#Preview {
    GoodsCatalogView(viewModel: GoodsCatalogViewModel(dependencies: AppDependency()))
}
