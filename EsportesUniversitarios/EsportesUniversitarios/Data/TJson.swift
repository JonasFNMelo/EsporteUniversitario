
import Foundation

struct TAtArray: Codable{
    var campeonatos: [Campeonatos]
}

struct Campeonatos: Codable {
    var nome: String
    var abreviacao: String
    var imagem: String
    var link: String
}


enum TRequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct Tjson{
     func TfetchData() async throws -> Result<TAtArray, TRequestError> {
        guard let url = URL(string: "https://gist.githubusercontent.com/JoaoPioltini/e10468b949536411676c821baaa11fa5/raw/d7cf8264bc60a3f0194b0a8670f4d88fac4e991c/gistfile1.json") else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let dados = try JSONDecoder().decode(TAtArray.self, from: data)
        
        return .success(dados)
        
    }
}
