
import SwiftUI

struct AtleticasPage: View {
    var atletica: Atleticas
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            VStack{

                AtleticaInfo(atletica: atletica)
                    .padding(.bottom, 20)
                
                Carrossel(esportes: atletica.esportes)
            }
            
        }
    }
}

#Preview {
    var atleticaTest: Atleticas = Atleticas(nome: "TecMack", imagem: "tecMack",contato:"", universidade: "Mackenzie", cursos: [], descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ", eventos: [], esportes: [])
    
    AtleticasPage(atletica: atleticaTest)
}
