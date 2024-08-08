//
//  PODHistory+CoreDataProperties.swift
//  AstronomyApp
//
//  Created by Muneer K K on 08/08/2024.
//
//

import Foundation
import CoreData


extension PODHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PODHistory> {
        return NSFetchRequest<PODHistory>(entityName: "PODHistory")
    }

    @NSManaged public var date: String?
    @NSManaged public var explanation: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var mediaType: String?
    @NSManaged public var updatedAt: Date?

}

extension PODHistory : Identifiable {

}
