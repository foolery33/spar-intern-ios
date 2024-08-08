//
//  SafeAreaInsets.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import SwiftUI

private struct SafeAreaInsetsKey: EnvironmentKey {
	static var defaultValue: EdgeInsets {
		((UIApplication.shared.connectedScenes.first { $0 is UIWindowScene } as? UIWindowScene)?
			.windows.first { $0.isKeyWindow && $0.isUserInteractionEnabled }?.safeAreaInsets ?? .zero).insets
	}
}

extension EnvironmentValues {
	var safeAreaInsets: EdgeInsets {
		self[SafeAreaInsetsKey.self]
	}
}

private extension UIEdgeInsets {
	var insets: EdgeInsets {
		EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
	}
}
