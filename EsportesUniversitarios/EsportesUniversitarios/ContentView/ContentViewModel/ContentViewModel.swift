//
//  ContentViewModel.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//
import Foundation
import CoreData

class ContentViewModel: ObservableObject {
    var atleticasModel: [FavoritasList] = []
    var campeonatoModel: [CampeonatosList] = []
    
    func getFavoritas() {
        atleticasModel = CoreDataController.shared.fetchAllFavoritas()
    }
    
    func createFavoritas(nome: String, universidade: String, imagem: String) {
        for atletica in atleticasModel {
            if atletica.nome == nome {
                return
            }
        }
        let result = CoreDataController.shared.favoritarAtletica(nome: nome, universidade: universidade, imagem: imagem)
        self.atleticasModel.append(result)
    }
    
    func deleteFavoritas(fList: FavoritasList) {
        CoreDataController.shared.deleteFavoritas(fList)
    }
    
    //campeonatos
    
    func getCampeonatos(){
        campeonatoModel = CoreDataController.shared.fetchCampeonatos()
    }
    
    func createCampeonatos(nome: String, imagem: String, abreviacao: String, link: String){
        let result = CoreDataController.shared.salvarCampeonato(nome: nome, imagem: imagem, abreviacao: abreviacao, link: link)
        self.campeonatoModel.append(result)
    }
}
