//
//  VideoPlayerView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected : String
    var videoTitle : String
    var body: some View {
        VStack {
            VideoPlayer(player:playVideo(videoName: videoSelected, videoType: "mp4")){
//                Text(videoTitle)
                    
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top,6)
                    .padding(.horizontal,8)
                ,alignment: .topLeading
            )
        }
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
            
    }
}

//struct VideoPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoPlayerView()
//    }
//}
