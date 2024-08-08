//
//  ScreenSize.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

private struct ScreenSizeKey: EnvironmentKey {
	static var defaultValue: CGSize {
		((UIApplication.shared.connectedScenes.first { $0 is UIWindowScene } as? UIWindowScene)?
			.windows.first { $0.isKeyWindow && $0.isUserInteractionEnabled }?.bounds.size ?? UIScreen.main.bounds.size)
	}
}

extension EnvironmentValues {
	var screenSize: CGSize {
		self[ScreenSizeKey.self]
	}
}
