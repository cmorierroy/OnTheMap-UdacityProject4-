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
        static var userId = ""
        static var sessionId = ""
    }
    
    enum Endpoints
    {
        static let base = "https://onthemap-api.udacity.com/v1"
        static let apiKeyParam = "?api_key=\(UdacityClient.apiKey)"
        
//        case getWatchlist
//        case getFavorites
//        case markWatchList
//        case markFavorite
//        case search(String)
//        case getRequestToken
        case login
        case signUp
//        case createSessionId
//        case webAuth
//        case logout
//        case posterImageURL(String)
        
        var stringValue: String
        {
            switch self {
            case .signUp: return "https://auth.udacity.com/sign-up"
            //case .getWatchlist: return Endpoints.base + "/account/\(Auth.accountId)/watchlist/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            //case .getRequestToken: return Endpoints.base + "/authentication/token/new" + Endpoints.apiKeyParam
            case .login: return Endpoints.base + "/session"
            //case .createSessionId: return Endpoints.base + "/authentication/session/new" + Endpoints.apiKeyParam
            //case .webAuth: return "https://www.themoviedb.org/authenticate/" + Auth.requestToken + "?redirect_to=themoviemanager:authenticate"
            //case .logout: return Endpoints.base + "/authentication/session" + Endpoints.apiKeyParam
            //case .getFavorites: return Endpoints.base + "/account/\(Auth.accountId)/favorite/movies" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            //case .search(let query): return Endpoints.base + "/search/movie" + Endpoints.apiKeyParam + "&query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
            //case .markWatchList: return Endpoints.base + "/account/\(Auth.accountId)/watchlist" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            //case .markFavorite: return Endpoints.base + "/account/\(Auth.accountId)/favorite" + Endpoints.apiKeyParam + "&session_id=\(Auth.sessionId)"
            //case .posterImageURL(let posterPath): return "https://image.tmdb.org/t/p/w500" + posterPath
            }
        }
        
        var url: URL
        {
            return URL(string: stringValue)!
        }
    }
    
    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void)
    {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(body)

        let task = URLSession.shared.dataTask(with: request)
        { (data, response, error) in
            guard let data = data else
            {
                DispatchQueue.main.async
                {
                    completion(nil, error)
                }
                return
            }
            
            //get rid of first 5 characters in data
            let range = 5..<data.count
            let newData = data.subdata(in: range) /* subset response data! */
            
            let decoder = JSONDecoder()
            do
            {
                let responseObject = try decoder.decode(ResponseType.self, from: newData)

                DispatchQueue.main.async
                {
                    completion(responseObject,nil)
                }
            }
            catch
            {
                do
                {
                    let errorResponse = try decoder.decode(LoginError.self, from: newData)
                    DispatchQueue.main.async
                    {
                        completion(nil, errorResponse)
                    }
                }
                catch
                {
                    DispatchQueue.main.async
                    {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
    }
    
    class func login(username: String, password: String, completion: @escaping (Bool, Error?) -> Void)
    {
        let udacity = ["username":username,"password":password]
        let body = LoginRequest(udacity: udacity)
        
        taskForPOSTRequest(url: Endpoints.login.url, responseType: LoginResponse.self, body: body) { (response, error) in
            if let response = response
            {
                //save session id and user id
                Auth.sessionId = response.session.id
                Auth.userId = response.account.key
                
                completion(true, nil)
            }
            else
            {
                completion(false, error)
            }
        }
    }
}
