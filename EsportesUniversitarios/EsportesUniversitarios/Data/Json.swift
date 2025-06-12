////
////  Gist.swift
////  EsportesUniversitarios
////
////  Created by Jessica Pioltini on 02/06/25.
////
//
//



import Foundation

struct AtArray: Codable{
    var atleticas: [Atleticas]
}

struct Atleticas: Codable {
    var nome: String
    var imagem: String
    var contato: String
    var universidade: String
    var cursos: [String]
    var descricao: String
    var eventos: [String]
    var esportes: [Esportes]
}

struct Esportes: Codable, Hashable {
    var esporte: String
    var local: String
    var categoria: String
    var localProcesso: [String]
    var horario: [String]
    var premiacoes: [String]
    var dataProcessoSeletivo: [String]
    var sfsymbol: String
    
}


enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct Json{
    func fetchData() async throws -> Result<AtArray, RequestError> {
        
        guard let url = URL(string: "https://gist.githubusercontent.com/JonasFNMelo/5a17ddf2552288c7a0600447d3a96516/raw/671e891bf1614886d16061f59b7813ca983d4208/test2.json") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let dados = try JSONDecoder().decode(AtArray.self, from: data)
        
        return .success(dados)
        
    }
    
}









