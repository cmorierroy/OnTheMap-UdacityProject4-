//
//  UserData.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-27.
//

import Foundation

class UserData
{
    static var user: User? = nil
    static var currentLocationId: String = ""
    
    class func reset()
    {
        UserData.user?.firstName = ""
        UserData.user?.lastName = ""
        UserData.user?.userID = ""
        currentLocationId = ""
    }
}

struct User : Codable
{
    var lastName:String
    var firstName:String
    var userID:String
    
    enum CodingKeys : String, CodingKey
    {
        case lastName = "last_name"
        case firstName = "first_name"
        case userID = "key"
        
    }
}
