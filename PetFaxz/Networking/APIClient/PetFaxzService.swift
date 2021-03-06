//
//  PetFaxzService.swift
//  PetFaxz
//
//  Created by fnord on 5/14/17.
//  Copyright © 2017 twof. All rights reserved.
//

import Alamofire
import SwiftyJSON

let apiKey = "56beeef0c5e34b939e93ac369ff28438"

private protocol APIRequest {
    var endpoint: PetFaxz {get}
    var baseURL: NSURL {get}
    var headers: [HTTPHeader] {get}
    var query: [String: Any] {get}
}

private protocol Endpoint {
    var path : String {get}
    var method: HTTPMethod {get}
}

public enum PetFaxz {
    case GetMessage(breed: String, age: Int, name: String, pronoun: String)
}

extension PetFaxz: Endpoint {
    fileprivate var path: String {
        switch self {
        case .GetMessage:
            return "generatemsg"
        }
    }
    
    fileprivate var method: HTTPMethod {
        switch self {
        case .GetMessage:
            return .get
        }
    }
}

public struct PetFaxzService: APIRequest, Gettable {
    
    fileprivate let endpoint: PetFaxz
    
    fileprivate var baseURL: NSURL {
        return NSURL(string: "https://f78b7b45.ngrok.io/")!
    }
    
    fileprivate var headers: [HTTPHeader] {
        switch endpoint {
        case .GetMessage:
            return []
        default:
            return []
        }
    }
    
    fileprivate var query: [String : Any] {
        switch endpoint {
        case .GetMessage(let breed, let age, let name, let pronoun):
            return ["breed": breed, "age": age, "name": name, "pronoun": pronoun]
        default:
            return [:]
        }
    }
    
    private var url: URL {
        let fullPath = self.baseURL.appendingPathComponent(self.endpoint.path)!
        return fullPath
    }
    
    public init(endpoint: PetFaxz) {
        self.endpoint = endpoint
    }
    
    public func get(completionHandler: @escaping (Result<String>) -> Void) {
        Alamofire.request(self.url, method: self.endpoint.method, parameters: self.query, encoding: URLEncoding.default, headers: [:]).validate().responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completionHandler(Result.Failure(error))
            case .success(let json):
                guard let respJSON = JSON(json)["message"].string else {
                    return
                }
                
                completionHandler(Result.Success(respJSON))
            }
        }
    }
}
