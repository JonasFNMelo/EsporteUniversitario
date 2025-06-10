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
    var contato: [String]
    
}


enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct Json{
    func fetchData() async throws -> Result<AtArray, RequestError> {
        
        guard let url = URL(string: "https://gist.githubusercontent.com/JonasFNMelo/84a8a27beff8117241751811ee25db4e/raw/1fcc1f6586eabc3f1a241c9a191d5a650d9d62bc/atleticas.json") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let dados = try JSONDecoder().decode(AtArray.self, from: data)
        print("ta tudo bem")
        
        return .success(dados)
        
    }
    
}









