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
    
    
    var body: some View {
        VStack{
            Image(atletica.imagem)
                .resizable()
                .clipShape(Circle())
                .frame(width: 138, height: 138)
                .padding(.leading, 16)
                .padding(.top, 100)
            
            Text(atletica.nome)
                .font(.system(size: 32, weight: .medium))
            Text(atletica.universidade)
                .font(.system(size: 15, weight: .light))
            
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
                                .frame(width: 169, height: 31)
                                .foregroundStyle(.accent)

                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 167, height: 29)
                                .foregroundStyle(.white)
                        }
                        
                            
                        Text("Favoritado")
                            .fontWeight(.semibold)
                            .foregroundColor(.accent)
                            .font(.system(size: 11))
                    }
                }else{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 167, height: 29)
                            .foregroundStyle(.accent)
                        
                        Text("Favoritar")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .font(.system(size: 11))
                        
                    }
                }
            }
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
    var atleticaTest: Atleticas = Atleticas(nome: "TecMack", imagem: "tecMack", universidade: "Mackenzie", cursos: [], descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", eventos: [], esportes: [])
    
    AtleticaInfo(atletica: atleticaTest)
}
