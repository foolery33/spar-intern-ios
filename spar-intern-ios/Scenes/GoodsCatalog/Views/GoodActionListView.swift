//
//  GoodActionListView.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

struct GoodActionListView: View {
	// MARK: - Public

	@Binding var isOrdered: Bool
	@Binding var isFavourite: Bool

	// MARK: - Body

    var body: some View {
		VStack(spacing: 0) {
			Button(action: {
				isOrdered.toggle()
			}, label: {
				Group {
					if isOrdered {
						AppIcons.orderedUnfilled
							.foregroundStyle(AppColors.text004)
					} else {
						AppIcons.orderedUnfilled
							.foregroundStyle(AppColors.text004)
					}
				}
				.padding(8)
			})
			Button(action: {
				isFavourite.toggle()
			}, label: {
				Group {
					if isFavourite {
						AppIcons.favouriteFilled
							.foregroundStyle(AppColors.primary001)
					} else {
						AppIcons.favouriteUnfilled
							.foregroundStyle(AppColors.text004)
					}
				}
				.padding(8)
			})
		}
		.background(AppColors.white.opacity(0.8))
		.clipShape(.rect(cornerRadii: .init(topLeading: 16, bottomLeading: 16, bottomTrailing: 16, topTrailing: 16)))
    }
}

// MARK: - Preview

#Preview {
	GoodActionListView(isOrdered: .constant(false), isFavourite: .constant(true))
}
