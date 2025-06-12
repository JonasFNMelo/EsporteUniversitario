//
//  Carrossel.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//

import SwiftUI

struct Carrossel: View {
    let rows = [GridItem(.fixed(170))]
    var esportes: [Esportes]
    @State var nomeEsporte: Esportes? = nil
    @State private var selectedEsporte: Esportes? = nil
    @State var arrayRand: [Int] = []
    @State var i: Int = 0
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Esportes")
                .padding(20)
                .font(.system(size: 25, weight: .semibold))
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows){
                    ForEach(Array(esportes.enumerated()), id: \.offset) { index, esporte in
                        Button {
                            nomeEsporte = esporte
                            
                        } label: {
                            VStack{
                                ZStack{
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 135, height: 135)
                                    
                                    if nomeEsporte == esporte {
                                        Circle()
                                            .fill(Color.accentColor)
                                            .frame(width: 135, height: 135)

                                        Circle()
                                            .fill(.white)
                                            .frame(width: 127, height: 127)
                                    }
                                    
                                    
                                    Image("graf_\(index%4)")
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                    
                                    Image(systemName: esporte.sfsymbol)
                                        .font(.system(size: 60, weight: .regular))
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom, 15)
                                Text(esporte.esporte)
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundStyle(.black)
                                    .padding(.bottom,15)
                                
                            }
                            
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
