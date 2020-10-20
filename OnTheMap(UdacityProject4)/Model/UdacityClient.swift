//
//  UdacityClient.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-20.
//

import Foundation

class UdacityClient
{
    static let apiKey = "ba7a81c889cab6ce0645ae3460f7a1e4"
    
    struct Auth {
        static var accountId = 0
        static var requestToken = ""
        static var sessionId = ""
    }
    
    enum Endpoints
    {
        static let base = "https://api.themoviedb.org/3"
        static let apiKeyParam = "?api_key=\(UdacityClient.apiKey)"
        
        case getWatchlist
        case getFavorites
        case markWatchList
        case markFavorite
        case search(String)
        case getRequestToken
        case login
        case signUp
        case createSessionId
        case webAuth
        case logout
        case posterImageURL(String)
        
        var stringValue: String
        {
            switch self {
            case .signUp: return "https://auth.udacity.com/sign-up"
            case .getWatchlist: return Endpoints.base + "/account/\(Auth.accountId)/watchlist/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            case .getRequestToken: return Endpoints.base + "/authentication/token/new" + Endpoints.apiKeyParam
            case .login: return Endpoints.base + "/authentication/token/validate_with_login" + Endpoints.apiKeyParam
            case .createSessionId: return Endpoints.base + "/authentication/session/new" + Endpoints.apiKeyParam
            case .webAuth: return "https://www.themoviedb.org/authenticate/" + Auth.requestToken + "?redirect_to=themoviemanager:authenticate"
            case .logout: return Endpoints.base + "/authentication/session" + Endpoints.apiKeyParam
            case .getFavorites: return Endpoints.base + "/account/\(Auth.accountId)/favorite/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            case .search(let query): return Endpoints.base + "/search/movie" + Endpoints.apiKeyParam + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
            case .markWatchList: return Endpoints.base + "/account/\(Auth.accountId)/watchlist" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            case .markFavorite: return Endpoints.base + "/account/\(Auth.accountId)/favorite" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            case .posterImageURL(let posterPath): return "https://image.tmdb.org/t/p/w500" + posterPath
            }
        }
        
        var url: URL
        {
            return URL(string: stringValue)!
        }
    }
}
