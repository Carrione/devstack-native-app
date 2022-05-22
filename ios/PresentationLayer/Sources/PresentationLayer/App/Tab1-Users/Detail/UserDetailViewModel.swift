//
//  Created by Petr Chmelar on 21.05.2022
//  Copyright © 2022 Matee. All rights reserved.
//

import DomainLayer
import Resolver
import SwiftUI

final class UserDetailViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    // MARK: Dependencies
    private var userId: String
    private weak var flowController: FlowController?
    
    @Injected private(set) var getUserUseCase: GetUserUseCase
    @Injected private(set) var trackAnalyticsEventUseCase: TrackAnalyticsEventUseCase

    init(userId: String, flowController: FlowController?) {
        self.userId = userId
        self.flowController = flowController
        super.init()
    }
    
    // MARK: Lifecycle
    
    override func onAppear() {
        super.onAppear()
        executeTask(Task { await loadUser() })
        trackAnalyticsEventUseCase.execute(UserEvent.userDetail(id: userId).analyticsEvent)
    }
    
    // MARK: State
    
    @Published private(set) var state: State = State()

    struct State {
        var user: User?
    }
    
    // MARK: Intent
    enum Intent {
    }

    @discardableResult
    func onIntent(_ intent: Intent) -> Task<Void, Never> {}
    
    // MARK: Private
    
    private func loadUser() async {
        do {
            state.user = try await getUserUseCase.execute(.local, id: userId)
            state.user = try await getUserUseCase.execute(.remote, id: userId)
        } catch {}
    }
}
