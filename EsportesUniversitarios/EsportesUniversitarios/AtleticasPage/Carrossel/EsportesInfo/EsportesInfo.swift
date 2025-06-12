//
//  EsportesInfo.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//

import SwiftUI

struct EsportesInfo: View {
    let tamanhoTexto: CGFloat = 18
    let esporte: Esportes
    
    var body: some View {
        VStack(alignment: .leading) {
                if esporte.categoria != ""{
                    Text("Categoria")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text(esporte.categoria)
                        .font(.system(size: tamanhoTexto, weight: .regular))
                        .padding(.bottom, 10)
                }
            
            if esporte.local != ""{
                Text("Local dos treinos")
                //                .font(.system(size: 16, weight: .semibold))
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(esporte.local)
                    .font(.system(size: tamanhoTexto, weight: .regular))
                    .padding(.bottom, 10)
            }
            
            
            if esporte.horario[0] != "" {
                Text("Horário dos treinos")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                
                ForEach(esporte.horario, id: \.self) { horario in
                    Text(horario)
                        .font(.system(size: tamanhoTexto, weight: .regular))
                        .padding(.bottom, 10)
                    
                }
            }
            
            
            if esporte.dataProcessoSeletivo[0] != "" {
                Text("Local do Processo Seletivo")
                //                .font(.system(size: 16, weight: .semibold))
                    .font(.title3)
                    .fontWeight(.semibold)
                
                ForEach(esporte.localProcesso, id: \.self) { local in
                    
                    Text(local)
                        .font(.system(size: tamanhoTexto, weight: .regular))
                    
                }
                
                
                
                ForEach(esporte.dataProcessoSeletivo, id: \.self) { data in
                    Text(data)
                        .font(.system(size: tamanhoTexto, weight: .regular))
                        .padding(.bottom, 10)
                    
                }
            }
            
            
            
            if esporte.premiacoes[0] != "" {
                Text("Premiações")
                //                .font(.system(size: 16, weight: .semibold))
                    .font(.title3)
                    .fontWeight(.semibold)
                
                ForEach(esporte.premiacoes, id: \.self) { premiacoes in
                    
                    Text(premiacoes)
                        .font(.system(size: tamanhoTexto, weight: .regular))
                        .padding(.bottom, 10)
                    
                    //                ZStack{
                    //                    Circle()
                    //                        .frame(width: 67, height: 67)
                    //                        .foregroundColor(.lightGray)
                    //
                    //                }
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    let esporteT: Esportes = Esportes(esporte: "", local: "", categoria: "", localProcesso: [], horario: [], premiacoes: [], dataProcessoSeletivo: [], sfsymbol: "")
    
    EsportesInfo(esporte: esporteT)
}
