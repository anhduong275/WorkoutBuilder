//
//  TrailingIconLabelStyle.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/18/23.
//  This code was copied from Scrumdinger
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
