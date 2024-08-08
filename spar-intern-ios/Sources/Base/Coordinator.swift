//
//  Coordinator.swift
//  spar-intern-ios
//
//  Created by Nikita Usov on 08.08.2024.
//

import UIKit

protocol Coordinator: AnyObject {
	init(navigationController: UINavigationController, appDependency: AppDependency)

	var navigationController: UINavigationController { get }
	var appDependency: AppDependency { get }
	var childCoordinators: [Coordinator] { get set }
	var onDidFinish: (() -> Void)? { get set }

	func start(animated: Bool)
	func show<T: Coordinator>(_ type: T.Type, animated: Bool) -> T
}

// MARK: - Base realisation

extension Coordinator {
	func add(_ coordinator: Coordinator) {
		childCoordinators.append(coordinator)
	}

	func remove(_ coordinator: Coordinator) {
		childCoordinators.removeAll { $0 === coordinator }
	}

	@discardableResult
	func show<T: Coordinator>(_ type: T.Type, animated: Bool) -> T {
		let coordinator = T(navigationController: navigationController, appDependency: appDependency)
		startCoordinator(coordinator, animated: animated)
		return coordinator
	}

	func startCoordinator(_ coordinator: Coordinator, animated: Bool) {
		add(coordinator)
		coordinator.onDidFinish = { [weak self, weak coordinator] in
			guard let coordinator = coordinator else { return }
			self?.remove(coordinator)
		}
		coordinator.start(animated: animated)
	}
}
