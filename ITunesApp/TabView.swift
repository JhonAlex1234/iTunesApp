//
//  TabView.swift
//  ITunesApp
//
//  Created by user306392 on 25/11/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationStack {
                SongsView(title: "Songs")
            }.tabItem {
                Label("Songs", systemImage: "music.note")
            }
            
            NavigationStack {
                MusicVideosView(title: "Music Videos")
            }.tabItem {
                Label("Music Videos", systemImage: "play.rectangle")
            }
        }.tint(Color.accent)
    }
}
     

#Preview {
    MainView()
}
