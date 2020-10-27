//
//  LoginRequest.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-20.
//

import Foundation

struct LoginRequest : Codable
{
    let udacity:[String:String]
    
    enum CodingKeys : String, CodingKey
    {
        case udacity
    }
}
