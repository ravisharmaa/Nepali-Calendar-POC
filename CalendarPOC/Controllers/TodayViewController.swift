import UIKit

class TodayViewController: UIViewController {
    
    //MARK:- UI Properties
    
    
    fileprivate lazy var containterView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = #colorLiteral(red: 0.2325224876, green: 0.2325679958, blue: 0.2325165272, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    fileprivate lazy var devNagariDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DevanagariSangamMN", size: 75)
        label.text = "७"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DevanagariSangamMN", size: 30)
        label.text = "आइतबार"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariMonthAndYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DevanagariSangamMN", size: 30)
        label.text = "फागुन २०७६"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariPanchangaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DevanagariSangamMN", size: 20)
        label.text = "तृतिया पञ्चाङ्ग: ध्रुव भाद्र चित्रा"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    
    
    fileprivate lazy var monthDayYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        label.text = dateFormatter.string(from:Date())
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariDaysCollectionView: UICollectionViewController = {
        let collectionView = CalendarCollectionViewController()
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        collectionView.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()
    
    fileprivate lazy var devNagariEventDetailsCollectionView: UICollectionViewController = {
        let collectionView = EventsCollectionViewController()
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        super.viewDidLoad()
        
        layoutConstraintsForContainerView()
        
        layoutConstraintsForCollectionView()
        
        layoutConstraintsForEventsCollectionView()
        
    }
    
    //MARK:- UI Layouts
    
    func layoutConstraintsForContainerView() {
        
        view.addSubview(containterView)
        
        
        NSLayoutConstraint.activate([
            containterView.topAnchor.constraint(equalTo: view.topAnchor),
            containterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
        
        [devNagariDateLabel,
         devNagariDayLabel,
         devNagariMonthAndYearLabel,
         devNagariPanchangaLabel,
         monthDayYearLabel].forEach {
            containterView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: 40).isActive = true
        }
        
        NSLayoutConstraint.activate([
            devNagariDateLabel.topAnchor.constraint(equalTo: containterView.topAnchor, constant: 40),
            devNagariDayLabel.topAnchor.constraint(equalTo: devNagariDateLabel.bottomAnchor),
            devNagariMonthAndYearLabel.topAnchor.constraint(equalTo: devNagariDayLabel.bottomAnchor),
            devNagariPanchangaLabel.topAnchor.constraint(equalTo: devNagariMonthAndYearLabel.bottomAnchor, constant: 30),
            monthDayYearLabel.topAnchor.constraint(equalTo: devNagariPanchangaLabel.bottomAnchor, constant: 3),
        ])
        
    }
    
    func layoutConstraintsForCollectionView () {
        
        view.addSubview(devNagariDaysCollectionView.view)
        
        addChild(devNagariDaysCollectionView)
        
        devNagariDaysCollectionView.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            devNagariDaysCollectionView.view.topAnchor.constraint(equalTo: containterView.bottomAnchor),
            devNagariDaysCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            devNagariDaysCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            devNagariDaysCollectionView.view.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func layoutConstraintsForEventsCollectionView() {
        view.addSubview(devNagariEventDetailsCollectionView.view)
        addChild(devNagariEventDetailsCollectionView)
        
        devNagariEventDetailsCollectionView.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            devNagariEventDetailsCollectionView.view.topAnchor.constraint(equalTo: devNagariDaysCollectionView.view.bottomAnchor),
            devNagariEventDetailsCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            devNagariEventDetailsCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            devNagariEventDetailsCollectionView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}
