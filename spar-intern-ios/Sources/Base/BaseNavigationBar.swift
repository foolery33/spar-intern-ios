//
//  BaseNavigationBar.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

struct BaseNavigationBar<LeftView: View, RightView: View>: View {

	// MARK: - Public Properties

	@ViewBuilder public let leftView: LeftView?
	@ViewBuilder public let rightView: RightView?

	public let text: String

	var body: some View {
		VStack(spacing: 1.5) {
			ZStack(alignment: .leading) {
				HStack {
					if leftView != nil {
						leftView
					}
				}
				Text(text)
					.font(AppFonts.System.regular16)
					.foregroundColor(AppColors.primary001)
					.frame(maxWidth: .infinity, alignment: .center)
					.lineLimit(1)
					.padding([.horizontal], 40)
				HStack {
					Spacer()
					if rightView != nil {
						rightView
					}
				}
			}
			.padding(.horizontal, 8)

			Rectangle().fill(AppColors.softGray)
				.frame(height: 0.5)
		}
		.background(.white)
		.padding(.top, 2)
	}
}

#Preview {
	BaseNavigationBar(leftView: {

	}, rightView: {
		Text("s")
	}, text: "sd")
}

