//
//  ViewController.swift
//  TopTenPicks
//
//  Created by marvin evins on 11/24/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var videos:[Video] = [Video]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.videos = VideoModel().getVideos()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        let videoTitle = videos[indexPath.row].videoTitle
        
        //customize the cell to display the video title
        //cell.textLabel?.text = videoTitle
        
        //construct the video thumbnail url
        let videoThumbnailUrlString =  "https://i.ytimg.com/vi/" + videos[indexPath.row].videoId + "/hqdefault.jpg"
        
        //create an NSURL object
        let videoThumbnailUrl = NSURL(string: videoThumbnailUrlString)
        
        
        if videoThumbnailUrl != nil {
            //create an NSURLRequest object
            let request = URLRequest(url: videoThumbnailUrl as! URL)
            
            //create an NSURLSession
            let session = URLSession.shared
            
            //create a datatask and pass in the request
            
            let dataTask = session.dataTask (with: request, completionHandler: { (data: Data?, response:URLResponse?, error:Error?) in
                
                DispatchQueue.main.async {
                    // get a reference to the imageview element of the cell
                    let imageView = cell.viewWithTag(1) as! UIImageView
                    
                    // create an image object from the data and assign it into the imageview
                    imageView.image = UIImage(data: data!)
                }
                
                
            })
            dataTask.resume()
            
        }
        
        
        
        
        return cell
        
    }
    
    
    

}

