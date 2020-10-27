//
//  StudentLocationResponse.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-21.
//

import Foundation

struct StudentLocationResponse : Codable
{
    let results : [StudentInformation]
    
    enum CodingKeys : String, CodingKey
    {
        case results
    }
}
