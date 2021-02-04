//
//  BaseAPI.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Moya

var authPlugin = AccessTokenPlugin {_ in
    let token = try? StorageData.loadToken().token
    return token ?? ""
}

let baseAPIProvider = MoyaProvider<BaseAPI>(plugins: [authPlugin])

enum BaseAPI {
    case login(Encodable)
    case news
    case newById(String)
}

extension BaseAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        default:
            guard let url = URL(string: Constants.Request.baseURL) else { fatalError() }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .news:
            return "news"
        case .newById(let id):
            return "news/\(id)"
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .post
        case .news, .newById:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let obj):
            return .requestJSONEncodable(obj)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}

extension BaseAPI: AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        switch self {
        case .newById, .news:
            return .bearer
        case .login:
            return .none
        }
    }
}
