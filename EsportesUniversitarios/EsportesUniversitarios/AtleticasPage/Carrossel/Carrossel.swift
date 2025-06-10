//
//  Carrossel.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//

import SwiftUI

struct Carrossel: View {
    let rows = [GridItem(.fixed(30))]
    var esportes: [Esportes]
    @State var nomeEsporte: Esportes? = nil
    @State private var selectedEsporte: Esportes? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows){
                    ForEach(esportes, id: \.esporte) { esporte in
                        Button {
                            nomeEsporte = esporte
                        } label: {
                            ZStack{
                                Circle()
                                    .frame(width: 130, height: 130)
                                    .foregroundColor(.greenBlue)
                                
                                Text(esporte.esporte)
                                    .font(.system(size: 18, weight: .regular))
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 15)
                        }
                    }
                }
            }
            
            if nomeEsporte != nil {
                EsportesInfo(esporte: nomeEsporte!)
            }
        }
    }
}



#Preview {
    var esportesT: [Esportes] = []
    Carrossel(esportes: esportesT)
}
