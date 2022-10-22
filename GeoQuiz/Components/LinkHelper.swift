//
//  LinkHelper.swift
//  GeoQuiz
//
//  Created by Dennis Concepción Martín on 7/10/22.
//

import SwiftUI

struct LinkComponent: View {
    var color: Color
    var symbol: String
    var text: String
    var url: URL
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Link(destination: url) {
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: symbol)
                    .imageScale(.large)
                    .foregroundColor(color)
                
                Text(text)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct LinkComponent_Previews: PreviewProvider {
    static var previews: some View {
        LinkComponent(
            color: .mayaBlue,
            symbol: "info.circle.fill",
            text: "About",
            url: URL(string: "https://dennistech.io")!
        )
    }
}
