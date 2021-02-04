//
//  Requests.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation

struct EmptyModel: Encodable {
}

struct LoginBody: Encodable {
    let user: String
    let pass: String
}
