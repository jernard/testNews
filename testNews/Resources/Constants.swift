//
//  Constants.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation

struct Constants {
    struct Request {
        
        #if PRODUCTION
        static let baseURL = "https://teste-dev-mobile-api.herokuapp.com/"
        #else
        static let baseURL = "https://teste-dev-mobile-api.herokuapp.com/"
        #endif
    }
    
    struct keychainKeys {
        static let token = "SessionToken"
    }
    
    struct Animations {
        static let splashAnimation = "splashAnimation"
    }
}
