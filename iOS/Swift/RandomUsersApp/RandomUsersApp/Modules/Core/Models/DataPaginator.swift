//
//  DataPaginator.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/6/24.
//

import Foundation

class DataPaginator<Model> {
    private(set) var isFetching: Bool = false
    private(set) var hasLoadedAll: Bool = false
    
    private(set) var models: [Model] = []
    private(set) var page: Page
    
    private var onDataUpdate: SingleResult<[Model]>?
    private var defaultPageSize: Int
    
    init(
        onDataUpdate: SingleResult<[Model]>? = nil,
        defaultPageSize: Int
    ) {
        self.onDataUpdate = onDataUpdate
        self.defaultPageSize = defaultPageSize
        self.page = Page(
            size: defaultPageSize,
            page: 0
        )
    }
}

// MARK: - Methods

extension DataPaginator {
    func reset() {
        isFetching = false
        hasLoadedAll = false
        page.page = 0
    }
    
    func recordFetchAndIncrementPage() {
        isFetching = true
        page.page += 1
    }
}

// MARK: - Handlers

extension DataPaginator {
    func handleNewData(
        thenExecute onCompletion: @escaping VoidResult
    ) -> SingleResult<[Model]> {
        { [weak self] newModels in
            guard let self else { return }
            
            if self.page.isFIrstPage {
                self.models = []
            }
            
            if newModels.count < self.defaultPageSize {
                hasLoadedAll = true
            }
            
            self.models.append(contentsOf: newModels)
            
            self.isFetching = false
            onCompletion()
        }
    }
    
    func handleError(
        thenExecute onError: @escaping ErrorResult
    ) -> ErrorResult {
        { [weak self] error in
            guard let self else { return }
            self.reset()
            
            onError(error)
        }
    }
}
