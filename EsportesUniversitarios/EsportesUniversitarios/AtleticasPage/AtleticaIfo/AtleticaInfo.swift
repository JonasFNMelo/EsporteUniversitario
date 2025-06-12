//
//  AtleticaInfo.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//

import SwiftUI

struct AtleticaInfo: View {
    
    var atletica: Atleticas
    @ObservedObject var atleticasModel = ContentViewModel()
    @State var isFavorita: Bool = false
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack{
            Image(atletica.imagem)
                .resizable()
                .clipShape(Circle())
                .frame(width: 160, height: 160)
                
            
            Text(atletica.nome)
                .font(.system(size: 32, weight: .medium))
            Text(atletica.universidade)
                .font(.system(size: 15, weight: .light))
            
            HStack{
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
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 169, height: 34)
                                    .foregroundStyle(.accent)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 167, height: 32)
                                    .foregroundStyle(.white)
                            }
                            
                            
                            Text("Favoritado")
                                .fontWeight(.semibold)
                                .foregroundColor(.accent)
                                .font(.system(size: 15))
                        }
                    }else{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 167, height: 34)
                                .foregroundStyle(.accent)
                            
                            Text("Favoritar")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                            
                        }
                    }
                }
                
                Button {
                    openURL(URL(string: atletica.contato)!)
                } label: {
                    ZStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 169, height: 34)
                                .foregroundStyle(.accent)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 167, height: 32)
                                .foregroundStyle(.white)
                        }
                        
                        
                        Text("Contato")
                            .fontWeight(.semibold)
                            .foregroundColor(.accent)
                            .font(.system(size: 15))
                    }
                }

            }
            .padding(.bottom, 15)
            Text(atletica.descricao)
                .font(.system(size: 15, weight: .light))
                .padding(.horizontal,10)
        }
        .onAppear{
            isFavorita = verifyAtletica()
        }
        .onChange(of: isFavorita){
            atleticasModel.getFavoritas()
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
    var atleticaTest: Atleticas = Atleticas(nome: "TecMack", imagem: "tecMack",contato: "", universidade: "Mackenzie", cursos: [], descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", eventos: [], esportes: [])
    
    AtleticaInfo(atletica: atleticaTest)
}
