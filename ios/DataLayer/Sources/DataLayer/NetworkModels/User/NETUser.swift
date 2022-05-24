//
//  Created by Petr Chmelar on 17.02.2021.
//  Copyright © 2021 Matee. All rights reserved.
//

import DomainLayer

struct NETUser: Codable {
    let id: String
    let email: String
    let firstName: String
    let lastName: String
    let phone: String?
    let bio: String?
    let pictureUrl: String?
}

// Conversion from NetworkModel to DomainModel
extension NETUser {
    var domainModel: User {
        User(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            phone: phone ?? "",
            bio: bio ?? "",
            pictureUrl: pictureUrl ?? "",
            counter: 0
        )
    }
}

// Conversion from DomainModel to NetworkModel
extension User {
    var networkModel: NETUser {
        NETUser(
            id: id,
            email: email,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            bio: bio,
            pictureUrl: pictureUrl
        )
    }
}
