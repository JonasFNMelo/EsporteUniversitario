//
//  CoreDataController.swift
//  EsportesUniversitarios
//
//  Created by Jonas Fernando Nascimento Melo on 05/06/25.
//

import CoreData
import Foundation

class CoreDataController {
    static let shared = CoreDataController()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "AtleticasModel")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Could not load CoreData stack: \(error.localizedDescription)")
            }
            
        }
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error saving context: \(error.localizedDescription)")
            }
        }
    }
    
    func favoritarAtletica(nome: String, universidade: String, imagem: String) -> FavoritasList {
        let fList = FavoritasList(context: viewContext)
        
        fList.nome = nome
        fList.universidade = universidade
        fList.imagem = imagem
        
        
        saveContext()
        return fList
    }
    
    func fetchAllFavoritas() -> [FavoritasList] {
        let fetchRequest: NSFetchRequest<FavoritasList> = FavoritasList.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("Error fetching ToDos: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteFavoritas(_ fList: FavoritasList) {
        viewContext.delete(fList)
        saveContext()
    }
    
    //campeonatos
    
    func fetchCampeonatos() -> [CampeonatosList]{
        let fetchRequest: NSFetchRequest<CampeonatosList> =
        CampeonatosList.fetchRequest()
        
        do{
            let result = try viewContext.fetch(fetchRequest)
            return result
        }
        catch{
            print("Error fetching ToDos: \(error.localizedDescription)")
            return []
        }
    }
    
    func salvarCampeonato(nome: String, imagem: String, abreviacao: String, link: String) -> CampeonatosList{
        let cList = CampeonatosList(context: viewContext)
        
        cList.nome = nome
        cList.abreviacao = abreviacao
        cList.imagem = imagem
        cList.link = link
        
        
        saveContext()
        return cList
    }
}

