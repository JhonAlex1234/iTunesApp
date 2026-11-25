//
//  SongsView.swift
//  ITunesApp
//
//  Created by user306392 on 25/11/26.
//

import SwiftUI

struct SongsView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title)
    }
}

#Preview {
    SongsView(title: "Songs")
}
