//
//  NetworkManagerMock.swift
//  testNewsTests
//
//  Created by Jernard Ducon on 4/02/21.
//

import Foundation

@testable import testNews

class NetworkManagerMock: NetworkManagerProtocol {
    func requestLogin(with user: LoginBody, _ completion: @escaping loginHandler) {
        let token = Token(token: "jjJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.0IEYC9TrL0FfQLhfE8Sp8DnDcv2xrJLUADIM75xUSPw")
        
        completion(.success(token))
    }
    
    func fetchNews(_ completion: @escaping fetchNewsHandler) {
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
        
        completion(.success([new1, new2]))
    }
    
    func fetchNew(with id: String, _ completion: @escaping fetchNewHandler) {
        let documento = NewDocumentModel(url: "url",
                                         source: "source",
                                         produto: "produto",
                                         editoria: "editoria",
                                         subeditoria: "subeditoria",
                                         titulo: "titulo",
                                         credito: "credito",
                                         datapub: "datapub",
                                         horapub: "horapub",
                                         linhafina: "linhafina",
                                         imagem: "imagem",
                                         thumbnail: "thumbnail",
                                         creditoImagem: "creditoImagem",
                                         legendaImagem: "legendaImagem",
                                         origem: "origem",
                                         id: "id",
                                         corpoformatado: "corpoformatado")
        let new = FullNewModel(documento: documento)
        completion(.success([new]))
    }
}

enum MockErrors: Error {
    case networkError
}

class NetworkManagerMockError: NetworkManagerProtocol {
    func requestLogin(with user: LoginBody, _ completion: @escaping loginHandler) {
        completion(.failure(MockErrors.networkError))
    }
    
    func fetchNews(_ completion: @escaping fetchNewsHandler) {
        completion(.failure(MockErrors.networkError))
    }
    
    func fetchNew(with id: String, _ completion: @escaping fetchNewHandler) {
        completion(.failure(MockErrors.networkError))
    }
    
    
}
