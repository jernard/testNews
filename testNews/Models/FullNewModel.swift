//
//  fullNewModel.swift
//  testNews
//
//  Created by Jernard Ducon on 3/02/21.
//

import Foundation

struct FullNewModel: Codable {
    let documento: NewDocumentModel
}

struct NewDocumentModel: Codable {
    let url: String
    let source: String
    let produto: String
    let editoria: String
    let subeditoria: String
    let titulo: String
    let credito: String
    let datapub: String
    let horapub: String
    let linhafina: String
    let imagem: String
    let thumbnail: String
    let creditoImagem: String
    let legendaImagem: String
    let origem: String
    let id: String
    let corpoformatado: String
}
