//
//  Exercise.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/18/23.
//

import Foundation

class Exercise: Identifiable, Hashable, ObservableObject, NSCopying {
    let id: UUID
    @Published var name: String
    @Published var durationInSeconds: Int
    @Published var description: String
    
    init(id: UUID = UUID(), name: String, durationInSeconds: Int, description: String) {
        self.id = id
        self.name = name
        self.durationInSeconds = durationInSeconds
        self.description = description
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.durationInSeconds == rhs.durationInSeconds && lhs.description == rhs.description
    }
    // Referenced here: https://stackoverflow.com/questions/34705786/swift-how-to-implement-hashable-protocol-based-on-object-reference#:~:text=In%20Swift%2C%20the%20type%20must,class%20to%20do%20this%20automatically.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Exercise(name: name, durationInSeconds: durationInSeconds, description: description)
        return copy
    }
}
