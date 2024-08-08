//
//  GoodsCatalogCoordinator.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import UIKit
import SwiftUI

final class GoodsCatalogCoordinator: Coordinator {
	// MARK: - Init

	init(navigationController: UINavigationController, appDependency: AppDependency) {
		self.navigationController = navigationController
		self.appDependency = appDependency
	}

	// MARK: - Public

	let navigationController: UINavigationController

	var appDependency: AppDependency
	var childCoordinators: [Coordinator] = []
	var onDidFinish: (() -> Void)?

	// MARK: - Navigation

	func start(animated: Bool) {
		let viewModel = GoodsCatalogViewModel(dependencies: appDependency)
		let viewController = UIHostingController(rootView: GoodsCatalogView(viewModel: viewModel))

		navigationController.setNavigationBarHidden(true, animated: false)
		navigationController.pushViewController(viewController, animated: animated)
	}
}

