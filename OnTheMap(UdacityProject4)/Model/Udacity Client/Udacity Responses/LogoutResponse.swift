//
//  LogoutResponse.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-26.
//

import Foundation

struct LogoutResponse : Codable
{
    let session:Session
    
    enum CodingKeys : String, CodingKey
    {
        case session
    }
}
