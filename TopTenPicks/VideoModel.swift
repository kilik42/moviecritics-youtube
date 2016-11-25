//
//  VideoModel.swift
//  TopTenPicks
//
//  Created by marvin evins on 11/24/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    
    func getVideos() -> [Video] {
        
        var videos = [Video]()
        
        //create a video object
        let video1 = Video()
        
        //assign properties 
        video1.videoId = " "
        
        video1.videoTitle = " "
        
        video1.videoDescription = " "
        
        
        
        // append it into the videos array
        
        videos.append(video1)
        
        return videos
        
        
        
        
    }

}
