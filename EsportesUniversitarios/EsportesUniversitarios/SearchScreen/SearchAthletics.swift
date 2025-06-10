//
//  SearchAthletics.swift
//  EsportesUniversitarios
//
//  Created by João Oliveira on 03/06/25.
//

import SwiftUI

struct SearchAthletics: View {
    
    @ObservedObject var atleticasModel = ContentViewModel()
    @State var atArray: AtArray?
    @State private var searchText = ""
    
    var searchResults: [Atleticas] {
        if let atleticas = atArray?.atleticas {
            if searchText.isEmpty {
                return atleticas
            } else {
                return atleticas.filter {
                    $0.nome.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
        else{
            return []
        }
    }
    
    let columns = [
        GridItem(.fixed(50), spacing: 130),
        GridItem(.fixed(50), spacing: 130)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    //if let atleticas = viewModel.atArray?.atleticas {
                        ForEach(searchResults, id: \.nome) {
                            atletica in
                            AthleticsComponentSearch(atleticasModel: atleticasModel, atletica: atletica)
                        }
                    //}
                }
            }
            .scrollIndicators(.hidden)
            .searchable(text: $searchText, prompt: "Pesquise")
            .navigationTitle("Procure Atleticas")
        }
        .searchable(text: $searchText)
        .onAppear{
            atleticasModel.getFavoritas()
        }
        
    }
}
    


#Preview {
    SearchAthletics()
}
