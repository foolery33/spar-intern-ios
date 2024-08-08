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
							catalogMode = catalogMode == .grid ? .list : .grid
						}, label: {
							RoundedRectangle(cornerRadius: 12)
								.fill(AppColors.surfaces002)
								.frame(width: 40, height: 40)
								.overlay(catalogMode.image.tint(AppColors.primary001))
						})
					}, rightView: {}, text: "")
					LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 8, content: {
						ForEach(0..<16) { _ in
							GoodGridCardView(goodModel: GoodModel(
								id: UUID().uuidString,
								name: "сыр Ламбер 500/0 230asdfasdfadsfasdf asdfas dfa asdf asdfas df asdf asf asdfasdfasdsг",
								country: "Франция 🇫🇷",
								priceInteger: 99,
								priceCents: 90,
								quantityType: .kgItem,
								oldPrice: "199,0",
								rating: 4.1,
								reviewsNumber: 20,
								image: AppImages.goodImage1,
								badgeType: .pricesHit,
								discountPercent: 25,
								isFavourite: false,
								isOrdered: false
							))
						}
					})
					.padding(.horizontal, 16)
				}
			}
			.scrollIndicators(.hidden)
		}
    }
}

// MARK: - Preview

#Preview {
    GoodsCatalogView(viewModel: GoodsCatalogViewModel())
}
