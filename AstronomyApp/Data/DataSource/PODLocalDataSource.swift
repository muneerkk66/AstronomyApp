//
//  PODLocalDataSource.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import CoreData
import Foundation

protocol PODLocalDataSource {
    func fetchHistory() async throws -> PODHistory?
    func saveHistory(_ object: PODResponse) async
}

final class PODLocalDataSourceLive: PODLocalDataSource {
	
    @BackgroundActor
    func fetchHistory() async throws -> PODHistory? {
        let context = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<PODHistory> = PODHistory.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \PODHistory.updatedAt, ascending: false)]
        fetchRequest.fetchLimit = 1
        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch {
            throw error
        }
    }

    @BackgroundActor
    func saveHistory(_ object: PODResponse) async {
        let history = PODHistory(context: PersistenceController.shared.container.viewContext)
        history.explanation = object.explanation
        history.title = object.title
        history.url = object.url
        history.mediaType = object.mediaType
        history.updatedAt = Date()
        await PersistenceController.shared.save()
    }
}
