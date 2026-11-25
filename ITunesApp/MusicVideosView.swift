//
//  MusicVideosView.swift
//  ITunesApp
//
//  Created by user306392 on 25/11/26.
//

import SwiftUI

struct MusicVideosView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title)
    }
}

#Preview {
    MusicVideosView(title: "Music Videos")
}
