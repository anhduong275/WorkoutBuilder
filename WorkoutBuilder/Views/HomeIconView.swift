//
//  HomeIconView.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 7/7/23.
//

import SwiftUI

struct HomeIconView: View {
    var label: String
    var isLeft: Bool
    var fillColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(fillColor)
            .aspectRatio(1.0, contentMode: .fit)
            .overlay(Text(label)
               .multilineTextAlignment(.center)
               .padding()
               .font(.title2)
               .foregroundColor(Color.black))
            .padding(isLeft ? .leading : .trailing)
    }
}

struct HomeIconView_Previews: PreviewProvider {
    static var previews: some View {
        HomeIconView(label: "Build a Workout", isLeft: true, fillColor: Color.blue)
    }
}
