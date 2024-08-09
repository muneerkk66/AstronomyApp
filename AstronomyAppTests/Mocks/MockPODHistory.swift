//
//  MockPODHistory.swift
//  AstronomyAppTests
//
//  Created by Muneer K K on 09/08/2024.
//

@testable import AstronomyApp
import CoreData
import Foundation

class MockPODHistory: PODHistory {
    init(date: String? = nil,
         explanation: String? = nil,
         title: String? = nil,
         url: String? = nil,
         mediaType: String? = nil,
         updatedAt: Date? = nil) {
        super.init(entity: NSEntityDescription.entity(forEntityName: "PODHistory", in: NSManagedObjectContext.mock())!,
                   insertInto: nil)

        self.date = date
        self.explanation = explanation
        self.title = title
        self.url = url
        self.mediaType = mediaType
        self.updatedAt = updatedAt
    }
}

// Extension to provide a mock NSManagedObjectContext
extension NSManagedObjectContext {
    static func mock() -> NSManagedObjectContext {
        let container = NSPersistentCloudKitContainer(name: "AstronomyDB")
        return container.viewContext
    }
}
