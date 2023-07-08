//
//  ViewWillAppearHandler.swift
//  WorkoutBuilder
//
//  Created by Ha Anh on 6/25/23.
//  Copied & modified from https://stackoverflow.com/questions/59745663/is-there-a-swiftui-equivalent-for-viewwilldisappear-or-detect-when-a-view-is/59746380#59746380
//

import Foundation
import SwiftUI

struct WillAppearHandler: UIViewControllerRepresentable {
    func makeCoordinator() -> WillAppearHandler.Coordinator {
        Coordinator(onWillAppear: onWillAppear)
    }

    let onWillAppear: () -> Void

    func makeUIViewController(context: UIViewControllerRepresentableContext<WillAppearHandler>) -> UIViewController {
        context.coordinator
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<WillAppearHandler>) {
    }

    typealias UIViewControllerType = UIViewController

    class Coordinator: UIViewController {
        let onWillAppear: () -> Void

        init(onWillAppear: @escaping () -> Void) {
            self.onWillAppear = onWillAppear
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            onWillAppear()
        }
    }
}

struct WillAppearModifier: ViewModifier {
    let callback: () -> Void

    func body(content: Content) -> some View {
        content
            .background(WillAppearHandler(onWillAppear: callback))
    }
}

extension View {
    func onWillAppear(_ perform: @escaping () -> Void) -> some View {
        self.modifier(WillAppearModifier(callback: perform))
    }
}
