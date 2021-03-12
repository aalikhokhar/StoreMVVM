//
//  EmployeesViewModel.swift
//  AmazStore
//
//  Created by Aadil Ali on 3/11/21.
//  Copyright © 2021 Aadil Ali. All rights reserved.
//

import UIKit

class StoreViewModel: NSObject {

    private var apiService : APIService!
    
    private(set) var storeData : Store! {
        didSet {
            self.bindStoreViewModelToController()
        }
    }
    
    var bindStoreViewModelToController : (() -> ()) = {}
    
    
    override init() {
        super.init()
        
        self.apiService = APIService()
        
        callFuncToGetStoreData()
    }
    
    func callFuncToGetStoreData() -> Void {
        self.apiService.apiToGetStoreData { (storeData) in
            
                self.storeData = storeData
            
            
        }
    }
}
