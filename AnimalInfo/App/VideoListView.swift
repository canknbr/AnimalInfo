//
//  VideoListView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 2.06.2023.
//

import SwiftUI

struct VideoListView: View {
  @State  var videos: [Video] = Bundle.main.decode("videos.json")
    let feedback = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 6)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        feedback.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                            .tint(.accentColor)
                    }

                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
