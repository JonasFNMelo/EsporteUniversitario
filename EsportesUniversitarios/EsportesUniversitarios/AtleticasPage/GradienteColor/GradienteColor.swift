//
//  GradienteColor.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//

import SwiftUI

struct GradienteColor: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .white]),
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .frame(width: 420, height: 360)
    }
}

#Preview {
    GradienteColor()
}
