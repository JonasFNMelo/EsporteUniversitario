//
//  AthleticsComponentSearch.swift
//  EsportesUniversitarios
//
//  Created by João Oliveira on 03/06/25.
//

import SwiftUI

struct AthleticsComponentSearch: View {
    @ObservedObject var atleticasModel: ContentViewModel
    var atletica: Atleticas
    
    @State var isFavorita: Bool = false
    
    var body: some View {
        
        NavigationLink(destination: AtleticasPage(atletica: atletica)){
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 165, height: 183)
                .foregroundStyle(.lightGray)
                .overlay{
                    VStack{
                        Image(atletica.imagem)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                        
                        Text(atletica.nome)
                            .fontWeight(.medium)
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                        
                        Text(atletica.universidade)
                            .fontWeight(.light)
                            .font(.system(size: 11))
                            .foregroundStyle(.mediumGray)

                        
                        Button {
                            if !isFavorita{
                                atleticasModel.createFavoritas(nome: atletica.nome, universidade: atletica.universidade, imagem: atletica.imagem)
                                
                                isFavorita = verifyAtletica()
                            }else if isFavorita{
                                deleteFound()
                                isFavorita = verifyAtletica()
                            }
                            
                        } label: {
                            if isFavorita{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 97, height: 21)
                                        .foregroundStyle(.white)
                                    Text("Favoritado")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.accent)
                                        .font(.system(size: 13))
                                }
                            }else{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 97, height: 21)
                                        .foregroundStyle(.accent)
                                    Text("Favoritar")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .font(.system(size: 13))
                                }
                            }
                        }
                    }
                    
                }
                .padding(.bottom, 5)
                .onAppear{
                    isFavorita = verifyAtletica()
                }
                .onChange(of: isFavorita){
                    atleticasModel.getFavoritas()
                }
        }
    }
    
    func verifyAtletica() -> Bool {
        atleticasModel.getFavoritas()

        for atleticaM in atleticasModel.atleticasModel {
            if atleticaM.nome == atletica.nome{
               return true
            }
        }
        return false
    }
    
    func deleteFound() {
        for atleticaM in atleticasModel.atleticasModel {
            if atleticaM.nome == atletica.nome{
                atleticasModel.deleteFavoritas(fList: atleticaM)
            }
        }
    }
}



#Preview {
    let testAtletica: Atleticas = Atleticas(
        nome: "TeckMack", imagem: "tecmack",contato: "", universidade: "Mackenzie", cursos: [], descricao: "fregjerjf", eventos: [], esportes: []
    )
    let atleticaM = ContentViewModel()
    AthleticsComponentSearch(atleticasModel: atleticaM, atletica:testAtletica )
}
