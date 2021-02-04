//
//  StoreData.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation


class StorageData {
    
    static func saveToken(for token: Token) throws {
        guard let data = token.token.data(using: .utf8) else { throw SaveDataErrors.dataError }
        let status = KeyChain.save(key: Constants.keychainKeys.token, data: data)
        
        if status != 0 {
            throw SaveDataErrors.savingError
        }
    }
    
    static func loadToken() throws -> Token {
        if let receivedData = KeyChain.load(key: Constants.keychainKeys.token) {
            if let result = String(data: receivedData, encoding: .utf8) {
                return Token(token: result)
            } else {
                throw SaveDataErrors.loadingError
            }
        } else {
            throw SaveDataErrors.loadingError
        }
    }
}
