//
//  VideoPlayerHelper.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import Foundation
import AVKit
var videoPlayer : AVPlayer?

func playVideo(videoName:String,videoType:String)->AVPlayer{
    if  Bundle.main.url(forResource: videoName, withExtension: videoType) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: videoType)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
