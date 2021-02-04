//
//  StateModelTest.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import XCTest
@testable import testNews

class StateModelTest: XCTestCase {
    
    var sut: State<NewModel, Error>!
    
    override func setUp() {
        super.setUp()
        sut = .loading
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fillNews() {
        // Given:
        let new1 = NewModel(id_documento: "id_documento1",
                            chapeu: "chapeu1",
                            titulo: "titulo1",
                            linha_fina: "linha_fina1",
                            data_hora_publicacao: "data_hora_publicacao1",
                            url: "url1",
                            imagem: "imagem1",
                            source: "source1")
        let new2 = NewModel(id_documento: "id_documento2",
                            chapeu: "chapeu2",
                            titulo: "titulo2",
                            linha_fina: "linha_fina2",
                            data_hora_publicacao: "data_hora_publicacao2",
                            url: "url2",
                            imagem: "imagem2",
                            source: "source2")
        // When:
        sut = .populated([new1,new2])
        // Then:
        XCTAssertEqual(sut.news(for: 0), new1)
        XCTAssertEqual(sut.numberOfRows(), 2)
    }
}
