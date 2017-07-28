//
//  Backend.swift
//  SomaSole
//
//  Created by Matthew Rigdon on 7/24/17.
//  Copyright © 2017 SomaSole. All rights reserved.
//

import UIKit
import Alamofire

struct Featured {
    var articles = [Article]()
    var videos = [Video]()
    var workout: Workout!
}

class Backend: NSObject {
    
    // MARK: - Singleton
    
    static let shared = Backend()
    
    // MARK: - Private properties
    
    private let baseURL = "http://localhost:3000"
    
    // MARK: - Public methods
    
    func getFeatured(completion: (Featured?) -> Void) {
        Alamofire.request(.GET, url("/featured.json")).responseJSON { response in
            if let json = response.result.value {
                var featured = Featured()
                featured.articles = (json["articles"] as! [[String : String]]).map { Article(data: $0) }
                featured.workout = Workout(data: json["workout"] as! [String : AnyObject])
                featured.videos = (json["videos"] as! [[String : AnyObject]]).map { Video(data: $0) }
                
                completion(featured)
            } else {
                completion(nil)
            }
        }
    }
    
    func getWorkouts(completion: ([Workout]?) -> Void) {
        Alamofire.request(.GET, url("/workouts.json")).responseJSON { response in
            if let json = response.result.value {
                completion((json["workouts"] as! [[String : AnyObject]]).map { Workout(data: $0) })
            } else {
                completion(nil)
            }
        }
    }
    
    func getVideos(completion: ([Video]?) -> Void) {
        Alamofire.request(.GET, url("/videos.json")).responseJSON { response in
            if let json = response.result.value {
                completion((json["videos"] as! [[String : AnyObject]]).map { Video(data: $0) })
            } else {
                completion(nil)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func url(string: String) -> String {
        return "\(baseURL)\(string)"
    }

}
