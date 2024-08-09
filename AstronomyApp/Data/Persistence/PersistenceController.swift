//
//  PersistenceController.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//

import CoreData

//MARK: Define a global actor that will manage tasks in a background context. All operations performed under this actor will be serialised and run on a background thread.

@globalActor actor BackgroundActor: GlobalActor {
    static var shared = BackgroundActor()
}

actor PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentCloudKitContainer

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "AstronomyDB")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, error in
            if let _ = error as NSError? {
                LogFatal("Unresolved error (error), (error.userInfo)")
            }

        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }

    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                LogFatal("Unresolved error (error), (error.userInfo)")
            }
        }
    }
}
