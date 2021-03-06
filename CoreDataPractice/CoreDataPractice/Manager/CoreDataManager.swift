//
//  CoreDataManager.swift
//  CoreDataPractice
//
//  Created by 이태현 on 2022/03/15.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer //initialize coredata
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
            
        }
    }
    
    func updateMovie(movie: Movie) {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
    
    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
    }
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveMovie(title: String) {
        
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
    }
}
