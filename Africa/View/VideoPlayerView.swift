//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Muhammad Usman on 14/09/2021.
//

import SwiftUI
import AVKit

var avPlayer: AVPlayer?

func playVideo(_ fileName: String, format: String) -> AVPlayer {
    if let url = Bundle.main.url(forResource: fileName, withExtension: format){
        avPlayer = AVPlayer(url: url)
        avPlayer?.play()
    }
    return avPlayer!
}

struct VideoPlayerView: View {
    
    let video: Video
    
    var body: some View {
        VStack{
            VideoPlayer(player: playVideo(video.id, format: "mp4")){
                
            }.overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(video.name, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static let videos : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoPlayerView(video: videos[0])
    }
}
