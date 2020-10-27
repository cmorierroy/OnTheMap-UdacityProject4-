//
//  UserInformationResponse.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-27.
//

import Foundation

struct UserInformationResponse : Codable
{
    let user: User
    
    enum CodingKeys :String, CodingKey
    {
        case user
    }
}
