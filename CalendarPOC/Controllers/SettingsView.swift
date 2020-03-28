//
//  SettingsView.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/26/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import SwiftUI



struct SettingsView: UIViewControllerRepresentable {
    
    
     typealias UIViewControllerType = ExperimentalHeaderController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SettingsView>) -> ExperimentalHeaderController {
        return ExperimentalHeaderController()
    }
    func updateUIViewController(_ uiViewController: ExperimentalHeaderController, context: UIViewControllerRepresentableContext<SettingsView>) {
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().edgesIgnoringSafeArea(.all)
    }
}
