//
//  FavoritasView.swift
//  EsporteUniversitario
//
//  Created by Camila Toniato on 04/06/25.
//

import SwiftUI


struct FavoritasView: View {
    var atleticaModel = ContentViewModel()
    var atArray: AtArray
    @State var favoritalAtuais: [Atleticas] = []
    
    var body: some View {
        NavigationStack{
            VStack (alignment: .leading) {
                
                List {
                    ForEach(favoritalAtuais, id: \.nome) { favorita in
                        NavigationLink(destination: AtleticasPage(atletica: favorita)) {
                            FavoritasRectangleView(atletica: favorita)
                            
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteFavoritas(nome: favorita.nome)
                            } label : {
                                Label("", systemImage: "trash.fill")
                            }
                        }
                    }
                }
                
            }
            .padding(.bottom, 10)
            .scrollIndicators(.hidden)
            .onAppear {
                atleticaModel.getFavoritas()
                
                verifyAtletica(atleticas: atArray.atleticas, atleticasM: atleticaModel.atleticasModel)
            }
            .onDisappear{
                favoritalAtuais = []
            }
            .navigationTitle(Text("Seus Favoritos"))
            
        }
    }
    
    func verifyAtletica(atleticas: [Atleticas], atleticasM:  [FavoritasList]) {
        
        for atleticaM in atleticasM {
            for atletica in atleticas{
                if atleticaM.nome == atletica.nome{
                    favoritalAtuais.append(atletica)
                }
            }
        }
    }
    
    func deleteFavoritas(nome: String) {
        for atleticaM in atleticaModel.atleticasModel {
            if atleticaM.nome == nome {
                atleticaModel.deleteFavoritas(fList: atleticaM)
                print("0")
                
            }
            print("1")
        }
    }
}


#Preview {
    var atArrayTest = AtArray(atleticas: [])
    FavoritasView(atArray: atArrayTest)
}
