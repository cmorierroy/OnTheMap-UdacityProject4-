//
//  PostLocationResponse.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-27.
//

import Foundation

struct PostLocationResponse : Codable
{
    let objectId:String
    let createdAt:String
    
    enum CodingKeys : String, CodingKey
    {
        case objectId
        case createdAt
    }
}
