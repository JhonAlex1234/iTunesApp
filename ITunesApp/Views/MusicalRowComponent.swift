//
//  MusicalRowComponent.swift
//  ITunesApp
//
//  Created by user306392 on 26/11/26.
//

import SwiftUI

struct MusicalRowComponent: View {
    private let imageName = "MusicalIconGrey"
    let title: String
    let artist: String
    let subtitle: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .accessibilityHidden(true)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(artist)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(subtitle)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    List {
        MusicalRowComponent(title: "Title", artist: "Artist", subtitle: "Subtitle")
    }
}
