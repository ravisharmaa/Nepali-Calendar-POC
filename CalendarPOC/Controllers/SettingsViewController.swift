//
//  SettingsViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/19/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK:- UI Elements
    
    fileprivate lazy var settingsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
    fileprivate lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "closeb"), for: .normal)
        button.imageView?.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeSettingsView), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var showMonthViewLabel: UILabel = {
       
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 15)
        label.text = "Show Month View"
        label.textColor = .label
        return label
    }()
    
    fileprivate lazy var showTodayViewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 15)
        label.text = "Show Today View"
        label.textColor = .systemGray3
        
        return label
    }()
    
    fileprivate lazy var dateConverterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 15)
        label.text = "Date Converter"
        label.textColor = .label
        
        return label
    }()
    
    fileprivate lazy var separatorView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "line")
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    fileprivate lazy var dualCalendarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 15)
        label.text = "Dual Calendar View"
        label.textColor = .label
        
        return label
        
    }()
    
    fileprivate lazy var dualCalendarSwitcher: UISwitch =  {
        let button = UISwitch()
        button.isOn = false
        //button.backgroundColor = .systemBlue
        
        return button
    }()
    
    fileprivate lazy var calendarOptionsDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavRegular.rawValue, size: 13)
        label.numberOfLines = 2
        label.text = "Show both, Bikram Sambat and Gregorian \r\nCalendar in the Calendar View."
        label.textColor = .systemGray
        
        return label
        
    }()
    
    fileprivate lazy var showHolidayOnlyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 15)
        label.text = "Show Holidays Only"
        label.textColor = .label
        
        return label
        
    }()
    
    fileprivate lazy var holidayOptionsDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavRegular.rawValue, size: 13)
        label.numberOfLines = 2
        label.text = "Turn this on to show only holidays in the list."
        label.textColor = .systemGray
        
        return label
        
    }()
    
    
    fileprivate lazy var holidaySwitcher: UISwitch =  {
        let button = UISwitch()
        button.isOn = false
        return button
    }()
    
    fileprivate lazy var feedbackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 15)
        label.text = "Send Feedback"
        label.textColor = .label
        
        return label
        
    }()
    
    
    fileprivate lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavRegular.rawValue, size: 13)
        label.text = "Version 2.0"
        label.textColor = .systemGray
        
        return label
        
    }()
    
    fileprivate lazy var blurredView: UIVisualEffectView = {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurView
    }()
    
    //MARK:- Reference For Future Works for Closure Based Implementations instead of Protocols
    
    // May be closure also could the same thing of removing blurred view from
    // super view. But I thought that blurring itself is the responsibility of
    // settings view not the view controller showing it, hence I removed the
    // idea of adding closure but kept the closure as a reference.
    
    //var didTapCloseButton: (()->())?
    
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(blurredView)
        
        view.addSubview(settingsView)
        
        settingsView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            settingsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            settingsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            settingsView.heightAnchor.constraint(equalToConstant: 450),
            settingsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            closeButton.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 15),
            closeButton.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -15),
            closeButton.heightAnchor.constraint(equalToConstant: 15),
            closeButton.widthAnchor.constraint(equalToConstant: 15)
            
        ])
        
        
        //MARK:- Calendar Labels, and Switch Stack
        let dualCalendarLabelAndSwitcherStack = UIStackView(arrangedSubviews: [dualCalendarLabel,  dualCalendarSwitcher])
        dualCalendarLabelAndSwitcherStack.axis = .horizontal
        dualCalendarLabelAndSwitcherStack.distribution = .fill
        dualCalendarLabelAndSwitcherStack.alignment = .center
        dualCalendarLabelAndSwitcherStack.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK:- Converter Labels, and Switch Stack
        
        let converterSwitcherAndOptionDetailStack = UIStackView(arrangedSubviews: [ dateConverterLabel, dualCalendarLabelAndSwitcherStack, calendarOptionsDetailLabel])
        converterSwitcherAndOptionDetailStack.axis = .vertical
        converterSwitcherAndOptionDetailStack.alignment = .leading
        converterSwitcherAndOptionDetailStack.distribution = .fillProportionally
        converterSwitcherAndOptionDetailStack.setCustomSpacing(6, after: dateConverterLabel)
        converterSwitcherAndOptionDetailStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        //MARK:- HolidayLabels and Switcher Stack
        
        let holidayLabelAndHolidaySwitcherStack = UIStackView(arrangedSubviews: [showHolidayOnlyLabel,  holidaySwitcher])
        holidayLabelAndHolidaySwitcherStack.axis = .horizontal
        holidayLabelAndHolidaySwitcherStack.distribution = .fill
        holidayLabelAndHolidaySwitcherStack.alignment = .center
        
        
        let holidayAndHolidayDetailStack = UIStackView(arrangedSubviews: [holidayLabelAndHolidaySwitcherStack, holidayOptionsDetailLabel])
        holidayAndHolidayDetailStack.axis = .vertical
        holidayAndHolidayDetailStack.distribution = .fillProportionally
        holidayAndHolidayDetailStack.alignment = .leading
        
        
        let feedBackAndVersionStack = UIStackView(arrangedSubviews: [UIView(), feedbackLabel, versionLabel, UIView()])
        feedBackAndVersionStack.axis = .vertical
        feedBackAndVersionStack.distribution = .fill
        feedBackAndVersionStack.alignment = .leading
        
        feedBackAndVersionStack.translatesAutoresizingMaskIntoConstraints = false
        
        feedBackAndVersionStack.setCustomSpacing(6, after: feedBackAndVersionStack.subviews[0])
        feedBackAndVersionStack.setCustomSpacing(4, after: feedbackLabel)
        
        
        let stackView = UIStackView(arrangedSubviews: [
            converterSwitcherAndOptionDetailStack,
            holidayAndHolidayDetailStack,
            feedBackAndVersionStack
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        stackView.distribution = .equalSpacing
        //stackView.distribution = .equalSpacing
        
        
        settingsView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //stackView.setCustomSpacing(10, after: holidayAndHolidayDetailStack)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: settingsView.bottomAnchor),
            

            converterSwitcherAndOptionDetailStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            converterSwitcherAndOptionDetailStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            dualCalendarLabelAndSwitcherStack.leadingAnchor.constraint(equalTo: converterSwitcherAndOptionDetailStack.leadingAnchor),
            dualCalendarLabelAndSwitcherStack.trailingAnchor.constraint(equalTo: converterSwitcherAndOptionDetailStack.trailingAnchor),
            
            holidayAndHolidayDetailStack.topAnchor.constraint(equalTo: converterSwitcherAndOptionDetailStack.bottomAnchor, constant: 8),
            holidayAndHolidayDetailStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            holidayAndHolidayDetailStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            holidayLabelAndHolidaySwitcherStack.leadingAnchor.constraint(equalTo: holidayAndHolidayDetailStack.leadingAnchor),
            holidayLabelAndHolidaySwitcherStack.trailingAnchor.constraint(equalTo: holidayAndHolidayDetailStack.trailingAnchor),
            
            feedBackAndVersionStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            feedBackAndVersionStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        
        ])
    }
    
    @objc func closeSettingsView() {
        //didTapCloseButton?()
        dismiss(animated: true, completion: nil)
    }
}
