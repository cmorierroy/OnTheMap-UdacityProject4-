//
//  ViewController.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //task no1: connect to Udacity API
        
    }
    
    class func taskForGETRequest<ResponseType:Decodable>(url: URL, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionTask
    {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else
            {
                DispatchQueue.main.async
                {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async
                {
                    completion(responseObject, nil)
                }
            } catch {
                do
                {
                    let errorResponse = try decoder.decode(TMDBResponse.self, from: data)
                    DispatchQueue.main.async {
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
        
        return task
    }
    
    class func taskForPOSTRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void)
    {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
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
            
            let decoder = JSONDecoder()
            do
            {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                
                DispatchQueue.main.async
                {
                    completion(responseObject,nil)
                }
            }
            catch
            {
                do
                {
                    let errorResponse = try decoder.decode(TMDBResponse.self, from: data) as Error
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


}

