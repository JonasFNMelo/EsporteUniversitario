//
//  ContentView.swift
//  EsporteUniversitario
//
//  Created by Aluno Mack on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    @State private var json = Json()
    @State var atArray: AtArray?
    
    
    @State private var tjson = Tjson()
    @State var tatArray: TAtArray?
    @State var isLoading: Bool = true
    
    var body: some View {
        
        VStack {
            if(isLoading){
                ProgressView()
            }
            else{
                TabView{
                    FavoritasView(atArray: atArray!)
                        .tabItem {
                            Image(systemName: "star")
                            Text("Favoritos")
                        }
                    
                    SearchAthletics(atArray: atArray!)
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Pesquisar")
                        }
                    
                    CampeonatoView(tatArray: tatArray!)
                        .tabItem {
                            Image(systemName: "trophy.fill")
                            Text("Campeonatos")
                        }
                    
                }
            }
            
            
        }
        .onAppear {
            Task {
                await getAtleticas()
                await getCampeonatos()
                isLoading = false
            }
        }
    }
    
    func getAtleticas() async {
        if atArray == nil {
            do {
                let result = try await json.fetchData()
                switch result {
                case .success(let data):
                    
                    atArray = data
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
    
    func getCampeonatos() async {
        if tatArray == nil {
            do {
                let result = try await
                tjson.TfetchData()
                switch result {
                case .success(let data):
                    print("sucesso")
                    tatArray = data
                    isLoading = false
                case .failure(let error):
                    print("failure")
                    
                    print(error.localizedDescription)
                    isLoading = false
                }
            } catch {
                print("catchhhhh")
                
                print(error.localizedDescription)
                isLoading = false
            }
        }
    }
}



#Preview {
    ContentView()
}
