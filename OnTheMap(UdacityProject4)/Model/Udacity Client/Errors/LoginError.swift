//
//  ResponseErrors.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-20.
//

import Foundation

struct LoginError : Error, Codable
{
    let status:Int
    let error:String
    
    enum CodingKeys:String,CodingKey
    {
        case status
        case error
    }
}

extension LoginError : LocalizedError
{
    var errorDescription: String?
    {
        return error
    }
}
