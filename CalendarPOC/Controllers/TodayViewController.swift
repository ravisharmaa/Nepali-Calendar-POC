import UIKit

class TodayViewController: UIViewController {
    
    //MARK:- UI Properties
    
    
    fileprivate lazy var containterView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        //containerView.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
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
    
    fileprivate lazy var calendarEventsCollectionView: CalendarEventsCollectionViewController = {
        let collection = CalendarEventsCollectionViewController()
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    lazy var settingsView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "menuw"), for: .normal)
        return button
    }()
    
    var containerHeightConstraint: NSLayoutConstraint!
    
    var maxHeightConstraint: CGFloat = 320
    
    var stackViewBottomConstraint: NSLayoutConstraint!
    
    var tapOnce: Bool = true
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        super.viewDidLoad()
        
        layoutConstraintsForContainerView()
        
        layoutConstraintsForCollectionView()
    }
    
    //MARK:- UI Layouts
    
    func layoutConstraintsForContainerView() {
        
        view.addSubview(containterView)
        
        containerHeightConstraint = containterView.heightAnchor.constraint(equalToConstant: maxHeightConstraint)
        containerHeightConstraint?.isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews:[
            devNagariDateLabel,
            devNagariDayLabel,
            devNagariMonthAndYearLabel,
            devNagariPanchangaLabel,
            monthDayYearLabel]
        )
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        
        containterView.addSubview(stackView)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackViewBottomConstraint = stackView.bottomAnchor.constraint(equalTo: containterView.bottomAnchor)
        stackViewBottomConstraint.constant = -32
        stackViewBottomConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: containterView.topAnchor, constant: 78),
            stackView.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: containterView.trailingAnchor),
            
            
            containterView.topAnchor.constraint(equalTo: view.topAnchor),
            containterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        
        
    }
    
    func layoutConstraintsForCollectionView () {
        
        view.addSubview(calendarEventsCollectionView.view)
        
        addChild(calendarEventsCollectionView)
        
        calendarEventsCollectionView.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            calendarEventsCollectionView.view.topAnchor.constraint(equalTo: containterView.bottomAnchor),
            calendarEventsCollectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarEventsCollectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarEventsCollectionView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        calendarEventsCollectionView.collectionViewDidScroll = { [weak self] (scrollView) in
            self?.animate(scrollView: scrollView)
        }
    }
}

extension TodayViewController {
    
    func animate(scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0  {
            if tapOnce {
                containerHeightConstraint.isActive = false
                stackViewBottomConstraint.isActive = false
                self.containerHeightConstraint.constant -= scrollView.contentOffset.y
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
                tapOnce = false
            }
        } else {
            stackViewBottomConstraint.isActive = true
            containerHeightConstraint.constant = maxHeightConstraint
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
            containerHeightConstraint.isActive = true
            tapOnce = true
        }
    }
}
