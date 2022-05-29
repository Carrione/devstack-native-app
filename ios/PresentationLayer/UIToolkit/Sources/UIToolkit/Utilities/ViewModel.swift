//
//  Created by Petr Chmelar on 21.02.2022
//  Copyright © 2022 Matee. All rights reserved.
//

@MainActor
public protocol ViewModel {
    // Lifecycle
    func onAppear()
    func onDisappear()
    
    // State
    associatedtype State
    var state: State { get }
    
    // Intent
    associatedtype Intent
    @discardableResult func onIntent(_ intent: Intent) -> Task<Void, Never>
}
