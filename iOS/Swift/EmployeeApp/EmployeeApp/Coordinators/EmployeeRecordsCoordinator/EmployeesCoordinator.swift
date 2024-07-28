//
//  EmployeesCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

final class EmployeesCoordinator: NavCoordinator {
    var onLogoutSuccess: VoidResult?
    
    private var cachedPost: PostModel?
    
    private let service: EmployeesServiceProtocol
    
    init(
        service: EmployeesServiceProtocol = App.shared.employee,
        navRouter: any NavRouterProtocol
    ) {
        self.service = service
        
        super.init(navRouter: navRouter)
    }
    
    override func start() {
        setRootToEmployeesScene()
    }
}

// MARK: - Employees Scene

extension EmployeesCoordinator {
    func setRootToEmployeesScene() {
        let vm = RecordsViewModel()
        vm.onCacheSelectedPost = handleCachePost()
        
        let vc = R.storyboard.records.recordsController()!
        vc.viewModel = vm
        vc.onLogoutSuccess = trigger(\.onLogoutSuccess)
        vc.onNavigateToDetails = trigger(type(of: self).navigateToEmployeeDetailsScene)
        vc.onNavigateToAddPost = trigger(type(of: self).presentAddPost)
        vc.onEditPost = trigger(type(of: self).presentEditPost)
        
        navRouter.setRoot(vc, animated: true)
    }
    
    func handleCachePost() -> SingleResult<PostModel> {
        { [weak self] post in
            guard let self else { return }
            self.cachedPost = post
        }
    }
}

// MARK: - AddPost Scene

extension EmployeesCoordinator {
    func presentAddPost() {
        let vc = R.storyboard.addOrEditPost.addOrEditPostController()!
        
        vc.viewModel = AddOrEditPostViewModel()
        vc.onSaveSuccess = triggerDismiss()
        
        let nc = NavigationController(rootViewController: vc)
        
        navRouter.present(nc, animated: true)
    }
    
    func presentEditPost() {
        guard let cachedPost else { return }
        let vc = R.storyboard.addOrEditPost.addOrEditPostController()!
        
        vc.viewModel = AddOrEditPostViewModel(post: cachedPost)
        vc.onSaveSuccess = triggerDismiss()
        
        let nc = NavigationController(rootViewController: vc)
        
        navRouter.present(nc, animated: true)
    }
}

// MARK: - EmployeeDetails Scene

extension EmployeesCoordinator {
    func navigateToEmployeeDetailsScene() {
        guard let cachedPost else { return }
        
        let vc = R.storyboard.postDetails.postDetailsController()!
        vc.viewModel = PostDetailsViewModel(post: cachedPost)
        navRouter.push(vc, animated: true)
    }
}
