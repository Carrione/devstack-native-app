//
//  Created by Petr Chmelar on 01.03.2022
//  Copyright © 2022 Matee. All rights reserved.
//

import SwiftUI

struct PrimaryTextField: View {
    
    private let titleKey: String
    private let text: Binding<String>
    private let secure: Bool
    
    init(
        _ titleKey: String,
        text: Binding<String>,
        secure: Bool = false
    ) {
        self.titleKey = titleKey
        self.text = text
        self.secure = secure
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(titleKey)
                .font(Font(AppTheme.Fonts.textFieldTitle as CTFont))
                .foregroundColor(Color(AppTheme.Colors.textFieldTitle))
            if secure {
                SecureField(titleKey, text: text)
                    .textFieldStyle(PrimaryTextFieldStyle())
            } else {
                TextField(titleKey, text: text)
                    .textFieldStyle(PrimaryTextFieldStyle())
            }
        }
    }
}

#if DEBUG
struct PrimaryTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryTextField("Lorem Ipsum", text: .constant("Lorem Ipsum"))
            PrimaryTextField("Lorem Ipsum", text: .constant("Lorem Ipsum"), secure: true)
        }
    }
}
#endif
