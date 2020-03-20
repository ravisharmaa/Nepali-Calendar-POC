//
//  SettingsViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/19/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    fileprivate lazy var settingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        return view
    }()
    
    fileprivate lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("close", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeSettingsView), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var showMonthViewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 26)
        label.text = "Show Month View"
        label.textColor = .label
        
        return label
    }()
    
    fileprivate lazy var showTodayViewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 20)
        label.text = "Show Today View"
        label.textColor = .systemGray3
        
        return label
    }()
    
    fileprivate lazy var dateConverterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 18)
        label.text = "Date Converter"
        label.textColor = .label
        
        return label
    }()
    
    fileprivate lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    fileprivate lazy var dualCalendarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 18)
        label.text = "Date Converter"
        label.textColor = .label
        
        return label
        
    }()
    
    fileprivate lazy var radioButton: UISwitch =  {
        let button = UISwitch()
        button.isOn = false
        button.backgroundColor = .systemBlue
        
        return button
    }()
    // May be closure also could the same thing of removing blurred view from
    // super view. But I thought that blurring itself is the responsibility of
    // settings view not the view controller showing it, hence I removed the
    // idea of adding closure but kept the closure as a reference.
    
    //var didTapCloseButton: (()->())?
    
    fileprivate lazy var blurredView: UIVisualEffectView = {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .clear
        //
        //        view.isOpaque = false
        
        view.addSubview(blurredView)
        
        view.addSubview(settingsView)
        settingsView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            settingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            settingsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            settingsView.heightAnchor.constraint(equalToConstant: 350),
            settingsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            closeButton.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -20),
            
        ])
    }
    
    @objc func closeSettingsView() {
        //didTapCloseButton?()
        dismiss(animated: true, completion: nil)
    }
}
