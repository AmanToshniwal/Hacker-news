//
//  PostData.swift
//  HACKER News
//
//  Created by Aman Toshniwal on 07/01/22.
//

import Foundation

struct Results: Decodable{
    
    let hits: [Post]
    
}

struct Post: Decodable,Identifiable{
    
    var id: String{
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
    let objectID: String
}
