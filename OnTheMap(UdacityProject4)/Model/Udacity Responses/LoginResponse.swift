//
//  LoginResponse.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-20.
//

import Foundation

struct LoginResponse : Codable
{
    let account : Account
    let session : Session
    
    enum CodingKeys : String, CodingKey
    {
        case account
        case session
    }
}

struct Account : Codable
{
    let registered:Bool
    let key:String
    
    enum CodingKeys : String, CodingKey
    {
        case registered
        case key
    }
}

struct Session : Codable
{
    let id:String
    let expiration:String
    
    enum CodingKeys : String, CodingKey
    {
        case id
        case expiration
    }
}
