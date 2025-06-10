//
//  CampeonatoView.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//

import SwiftUI

struct CampeonatoView: View {
    
    var campeonatoModel = ContentViewModel()
    var tatArray: TAtArray
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack{
            VStack (alignment: .leading) {
                List {
                    ForEach(tatArray.campeonatos, id: \.nome) { campeonato in
                        Button {
                            openURL(URL(string: campeonato.link)!)
                        } label: {
                            CampeonatoRectangleView(campeonato: campeonato)
                        }
                    }
                }
                
            }
            .padding(.bottom, 10)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    var campeonatoInit: TAtArray = TAtArray(campeonatos: [])
    CampeonatoView(tatArray: campeonatoInit)
}
