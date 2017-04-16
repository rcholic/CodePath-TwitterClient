//
//  Tweet.swift
//  TwitterClient
//
//  Created by Guoliang Wang on 4/12/17.
//  Copyright © 2017 com.rcholic. All rights reserved.
//

//
//  Tweet.swift
//  TwitterClient
//
//  Created by Guoliang Wang on 4/11/17.
//  Copyright © 2017 com.rcholic. All rights reserved.
//
import ObjectMapper

// https://dev.twitter.com/rest/reference/get/statuses/home_timeline
class Tweet: BaseJsonModel, CustomStringConvertible {
    
    var id: String?
    var text: String?
    var createdAt: Date?
    var retweetCount: Int = 0
    var isRetweeted: Bool = false
    var author: TwitterUser? = nil
    var favoritesCount: Int = 0
    var isFavorited: Bool = false
    
    override func mapping(map: Map) {
        
        id <- map["id_str"]
        text <- map["text"]
        createdAt <- (map["created_at"], CustomDateFormatTransform(formatString: "EEE MMM d HH:mm:ss Z y")) // DateTransform()
        retweetCount <- map["retweet_count"]
        isRetweeted <- map["retweeted"]
        author <- map["user"]
        favoritesCount <- map["favorite_count"]
        isFavorited <- map["favorited"]
    }
    
    public var description: String {
        return "isRetweeted: \(self.isRetweeted); author: \(author)"
    }
}
