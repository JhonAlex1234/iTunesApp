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
            SongsView(title: "Songs")
                .tabItem {
                    Label("Songs", systemImage: "music.note")
                }
            MusicVideosView(title: "Music Videos")
                .tabItem {
                    Label("Music Videos", systemImage: "play.rectangle")
                }
            
        }.tint(Color.accent)
    }
    
}
     

#Preview {
    MainView()
}
