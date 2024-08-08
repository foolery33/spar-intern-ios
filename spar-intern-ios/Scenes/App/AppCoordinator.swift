//
//  AppCoordinator.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
	// MARK: - Init

	init(navigationController: UINavigationController, appDependency: AppDependency = AppDependency()) {
		self.navigationController = navigationController
		self.appDependency = appDependency
	}

	// MARK: - Public

	var appDependency: AppDependency
	var childCoordinators: [Coordinator] = []
	var onDidFinish: (() -> Void)?

	let navigationController: UINavigationController

	func start(animated: Bool) {
		showGoodsCatalogScreen(animated: animated)
	}

	// MARK: - Private

	private func showGoodsCatalogScreen(animated: Bool) {
		show(GoodsCatalogCoordinator.self, animated: animated)
	}
}
