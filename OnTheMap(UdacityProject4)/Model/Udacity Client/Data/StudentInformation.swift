//
//  StudentInformation.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-21.
//

import Foundation

struct StudentInformation : Codable
{
    let createdAt : String
    let firstName : String
    let lastName : String
    let latitude : Double
    let longitude : Double
    let mapString : String
    let mediaURL : String
    let objectId : String
    let uniqueKey : String
    let updatedAt : String

    enum CodingKeys : String, CodingKey
    {
        case createdAt
        case firstName
        case lastName
        case latitude
        case longitude
        case mapString
        case mediaURL
        case objectId
        case uniqueKey
        case updatedAt
    }
}
