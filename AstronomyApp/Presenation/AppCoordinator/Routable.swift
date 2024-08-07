//
//  Routable.swift
//  AstronomyApp
//
//  Created by Muneer K K on 07/08/2024.
//
import Foundation

protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}
