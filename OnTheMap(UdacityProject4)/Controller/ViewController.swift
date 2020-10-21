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
    
//    class func taskForGETRequest<ResponseType:Decodable>(url: URL, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionTask
//    {
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else
//            {
//                DispatchQueue.main.async
//                {
//                    completion(nil, error)
//                }
//                return
//            }
//            let decoder = JSONDecoder()
//            do {
//                let responseObject = try decoder.decode(ResponseType.self, from: data)
//                DispatchQueue.main.async
//                {
//                    completion(responseObject, nil)
//                }
//            } catch {
//                do
//                {
//                    let errorResponse = try decoder.decode(TMDBResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        completion(nil, errorResponse)
//                    }
//                }
//                catch
//                {
//                    DispatchQueue.main.async
//                    {
//                        completion(nil, error)
//                    }
//                }
//            }
//        }
//        task.resume()
//
//        return task
//    }
//


}

