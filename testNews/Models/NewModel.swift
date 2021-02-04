//
//  NewModel.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation

struct NewModel: Codable {
    let id_documento: String
    let chapeu: String
    let titulo: String
    let linha_fina: String
    let data_hora_publicacao: String
    let url: String
    let imagem: String
    let source: String
}

extension NewModel: Equatable {
    
}
