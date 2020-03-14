import UIKit

class TodayViewController: UIViewController {
    
    //MARK:- UI Properties
    
    
    fileprivate lazy var containterView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 14/255, green: 14/255, blue: 14/255, alpha: 1.0)
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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = MonthsCollectionViewController()
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        collectionView.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.view.backgroundColor = #colorLiteral(red: 0.09018407017, green: 0.0902037397, blue: 0.09017974883, alpha: 1)
        return collectionView
    }()
    
    fileprivate lazy var devNagariEventDetailsCollectionView: UICollectionView = {
        let layout = EventLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = #colorLiteral(red: 0.09018407017, green: 0.0902037397, blue: 0.09017974883, alpha: 1)
        
        return collectionView
    }()
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        
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
        view.addSubview(devNagariEventDetailsCollectionView)
        devNagariEventDetailsCollectionView.register(EventsCell.self, forCellWithReuseIdentifier: "eventsCell")
        
        NSLayoutConstraint.activate([
            devNagariEventDetailsCollectionView.topAnchor.constraint(equalTo: devNagariDaysCollectionView.view.bottomAnchor),
            devNagariEventDetailsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            devNagariEventDetailsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            devNagariEventDetailsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
}

extension TodayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! EventsCell
        return cell
        
        
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let availableWidth: CGFloat = devNagariEventDetailsCollectionView.frame.width
        
        let sectionInsetsLeftAndRight: CGFloat = 30 + 10
        
        let width = (availableWidth - sectionInsetsLeftAndRight)
        
        return .init(width: width, height: 70)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 10, left: 30, bottom: 0, right: 10)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
}
