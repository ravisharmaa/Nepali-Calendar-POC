//
//  SettingsView.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/26/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import SwiftUI



struct SettingsView: UIViewControllerRepresentable {
    
    
    typealias UIViewControllerType = SettingsViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SettingsView>) -> SettingsViewController {
        return SettingsViewController()
    }
    func updateUIViewController(_ uiViewController: SettingsViewController, context: UIViewControllerRepresentableContext<SettingsView>) {
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().edgesIgnoringSafeArea(.all)
    }
}
