//
//  CampeonatoRectangleView.swift
//  EsportesUniversitarios
//
//  Created by João Oliveira on 09/06/25.
//

import SwiftUI

struct CampeonatoRectangleView: View {
    var atleticaModel = ContentViewModel()
    var campeonato: Campeonatos
    
    var body: some View {
        
        
        HStack{
            Image(campeonato.imagem)
                .resizable()
                .clipShape(Circle())
                .frame(width: 80, height: 80)
                .padding(.leading, 16)
            
            VStack(alignment: .leading){
                Text(campeonato.abreviacao)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                Text(campeonato.nome)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle(Text("Campeonatos"))

    }
}

#Preview {
    var campeonatoTest = Campeonatos(nome: "Novo Desporto Universitario", abreviacao: "NDU", imagem: "ndu", link: "djkgdknsf")
    CampeonatoRectangleView(campeonato: campeonatoTest)
}
