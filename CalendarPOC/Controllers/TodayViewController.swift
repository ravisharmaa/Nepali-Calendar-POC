import UIKit

class TodayViewController: UIViewController {
    
    //MARK:- UI Properties
    
    
    fileprivate lazy var containterView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        //        containerView.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    fileprivate lazy var devNagariDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantraManavLight.rawValue, size: 66)
        label.text = "१७"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 35)
        label.text = "आइतबार"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariMonthAndYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 35)
        label.text = "फागुन २०७६"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariPanchangaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 16)
        label.text = "तृतिया पञ्चाङ्ग: ध्रुव भाद्र चित्रा"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    
    
    fileprivate lazy var monthDayYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 16)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        label.text = dateFormatter.string(from:Date())
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    lazy var calendarEventsCollectionView: CalendarEventsCollectionViewController = {
        let collection = CalendarEventsCollectionViewController()
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        collection.collectionView.isUserInteractionEnabled = false
        collection.collectionView.contentInsetAdjustmentBehavior = .never
        return collection
    }()
    
    
    fileprivate lazy var settingsView: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "menuw").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(showSettingsView), for: .touchUpInside)
        return button
    }()
    
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    fileprivate lazy var settingsController: UIViewController = {
        let controller = SettingsViewController()
        
        return controller
    }()
    
    //MARK:- Instance Properties
    
    fileprivate var collectionViewHeightConstraint: NSLayoutConstraint?
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        
        view.backgroundColor = .systemBackground
        
        super.viewDidLoad()
        
        layoutConstraintsForContainerView()
        
        layoutConstraintsForCollectionView()
    }
    
    //MARK:- UI Layouts
    
    func layoutConstraintsForContainerView() {
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(containterView)
        
        scrollView.addSubview(settingsView)
        
        let stackView = UIStackView(arrangedSubviews:[
            devNagariDateLabel,
            UIView(),
            devNagariDayLabel,
            devNagariMonthAndYearLabel,
            UIView(),
            devNagariPanchangaLabel,
            monthDayYearLabel]
        )
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        
        stackView.setCustomSpacing(14, after: devNagariDateLabel)
        stackView.setCustomSpacing(14, after: devNagariDayLabel)
        
        containterView.addSubview(stackView)
        
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackView.layoutMargins = .init(top: 56, left: 40, bottom: 40, right: 0)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: containterView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containterView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containterView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containterView.bottomAnchor),
            
            settingsView.heightAnchor.constraint(equalToConstant: 35),
            settingsView.widthAnchor.constraint(equalToConstant: 35),
            settingsView.topAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.topAnchor, constant: 8),
            settingsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            containterView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containterView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containterView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containterView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            containterView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func layoutConstraintsForCollectionView () {
        
        scrollView.addSubview(calendarEventsCollectionView.view)
        
        addChild(calendarEventsCollectionView)
        
        calendarEventsCollectionView.didMove(toParent: self)
        
        
        // headerHeight + Calendarheight + (cellCount * cellHeight)
        // 350 + (60 * 10)
        
        //let height = view.frame.height + (350 + )
        
        collectionViewHeightConstraint = calendarEventsCollectionView.view.heightAnchor.constraint(equalToConstant: 350 + (60 * 20) + 38)
        //        collectionViewHeightConstraint = calendarEventsCollectionView.view.heightAnchor.constraint(equalToConstant: height)
        collectionViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            calendarEventsCollectionView.view.topAnchor.constraint(equalTo: containterView.bottomAnchor),
            calendarEventsCollectionView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            calendarEventsCollectionView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            calendarEventsCollectionView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            calendarEventsCollectionView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    @objc func showSettingsView() {
        
        settingsController.modalTransitionStyle = .crossDissolve
        
        settingsController.modalPresentationStyle = .overCurrentContext
        present(settingsController, animated: true, completion: nil)
    }
}
