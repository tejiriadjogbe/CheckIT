//
//  Coordinator.swift
//
//
//  Created by Adjogbe  Tejiri on 31/12/2023.
//

import Foundation
import UIKit

open class Coordinator: NSObject {
    public var completion: () -> Void = {}

    public var subCoordinator: Coordinator?
    public weak var parentCoordinator: Coordinator?
    public var navigationController: UINavigationController?

    public init(navigationController: UINavigationController?, completion: (() -> Void)?) {
        self.navigationController = navigationController

        if let completion = completion {
            self.completion = completion
        }
    }

    public convenience init(viewController: UIViewController, completion: (() -> Void)?) {
        self.init(navigationController: viewController.navigationController, completion: completion)
    }

    public init(parentCoordinator: Coordinator) {
        self.completion = parentCoordinator.completion
        self.navigationController = parentCoordinator.navigationController

        super.init()

        parentCoordinator.subCoordinator = self
        self.parentCoordinator = parentCoordinator
    }

    open func start() {}

    public func start(subCoordinator: Coordinator) {
        self.subCoordinator = subCoordinator
        self.subCoordinator?.start()
    }
    
    public func completeSubWorkflow() {
        self.subCoordinator = nil
    }

    public func present(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.present(viewController, animated: animated, completion: completion)
    }

    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }

    public func push(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    public func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }

    public func finishWorkflow() {
        if let parentWorkflow = parentCoordinator {
            parentWorkflow.completeSubWorkflow()
        } else {
            completeSubWorkflow()
            completion()
        }
    }

    public func topViewController() -> UIViewController? {
        var topController: UIViewController? = navigationController
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }

        return topController
    }

    public func popBack<T: UIViewController>(toControllerType: T.Type) -> UIViewController? {
        navigationController?.viewControllers.first(where: { $0.isKind(of: toControllerType) })
    }

    deinit {
        print("--- \(self) deinit")
    }
}

