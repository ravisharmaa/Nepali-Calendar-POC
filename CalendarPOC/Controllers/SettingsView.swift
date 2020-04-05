//
//  SettingsView.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/26/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import SwiftUI



struct SettingsView: UIViewControllerRepresentable {
    
    
     typealias UIViewControllerType = ExperimentalTableViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SettingsView>) -> ExperimentalTableViewController {
        return ExperimentalTableViewController()
    }
    func updateUIViewController(_ uiViewController: ExperimentalTableViewController, context: UIViewControllerRepresentableContext<SettingsView>) {
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().edgesIgnoringSafeArea(.all)
    }
}
