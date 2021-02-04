//
//  HomeDetailTest.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import XCTest
import Foundation
@testable import testNews

class HomeDetailTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func test_parseJsonResponse() {
        // Given
        let decoder = JSONDecoder()
        let jsonString = MockConstants.detailNew
        let jsonData = Data(jsonString.utf8)
        // When
        do {
            let detail = try decoder.decode([FullNewModel].self, from: jsonData)
            XCTAssertEqual(detail.first?.documento.id, "1")
        } catch {
            XCTFail()
        }
    }
}
