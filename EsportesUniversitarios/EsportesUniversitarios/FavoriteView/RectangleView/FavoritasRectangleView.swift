//
//  FavoritasView.swift
//  EsporteUniversitario
//
//  Created by Camila Toniato on 03/06/25.
//

import SwiftUI


struct FavoritasRectangleView: View {
    @ObservedObject var atleticaModel = ContentViewModel()
    var atletica: Atleticas
    
    var body: some View {
//        ZStack(alignment: .leading){
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: 360, height: 120)
//                .foregroundColor(.lightGray)
            HStack {
                Image(atletica.imagem)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 88, height: 88)
                    .padding(.leading, 16)
                VStack(alignment: .leading){
                    Text(atletica.nome)
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Text(atletica.universidade)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    
                }
        }
        .onAppear {
            atleticaModel.getFavoritas()
        }

    }
    
    func deleteFavoritas() {
        for atleticaM in atleticaModel.atleticasModel {
            if atleticaM.nome == atletica.nome {
                atleticaModel.deleteFavoritas(fList: atleticaM)
                print("0")

            }
            print("1")
        }
    }
    
}


#Preview {
    
    
    var atleticaTest: Atleticas = Atleticas(nome: "TecMack", imagem: "tecMack",contato: "", universidade: "Mackenzie", cursos: [], descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", eventos: [], esportes: [])
   
    FavoritasRectangleView(atletica: atleticaTest)
}
