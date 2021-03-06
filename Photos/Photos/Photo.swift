//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    
    var date : String!
    
    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        url = data.valueForKey("images")!.valueForKey("low_resolution")!.valueForKey("url") as! String
        print("url:  \(url)")
        likes = data.valueForKey("likes")!.valueForKey("count") as! Int
        print("likes: \(likes)")
        username = data.valueForKey("user")!.valueForKey("username") as! String
        print("username: \(username)")
        date = data.valueForKey("created_time") as! String
        print("date: \(date)")
    }
    
}