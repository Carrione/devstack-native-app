//
//  Created by Petr Chmelar on 20.05.2022
//  Copyright © 2022 Matee. All rights reserved.
//

import DomainLayer
import Foundation

extension ValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .email(let reason):
            switch reason {
            case .isEmpty: return L10n.invalid_email
            }
        case .password(let reason):
            switch reason {
            case .isEmpty: return L10n.invalid_password
            }
        }
    }
}
