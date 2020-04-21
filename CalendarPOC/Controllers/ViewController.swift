import UIKit

class ViewController: UIViewController  {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        return scrollView
    }()
    
    lazy var todayViewController: TodayViewController = {
        let vc = TodayViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        return vc
    }()
    
    lazy var monthViewController: MonthViewController = {
        let vc = MonthViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        return vc
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    
        view.addSubview(scrollView)
        
        [todayViewController, monthViewController].forEach { (controller) in
            controller.view.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
            controller.view.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
            addChild(controller)
            controller.didMove(toParent: self)
            
            stackView.addArrangedSubview(controller.view)
        }
        
        scrollView.addSubview(stackView)
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        
        //removes bounces from scroll view
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Reader.singleton.read(from: "Sample", fileExtension: .json, responsible: Response.self) {[weak self] (result) in
            switch result {
            case .success(let response):
                self?.todayViewController.calendarEventsCollectionView.events = response.events
                self?.monthViewController.calendarEventsCollectionView.events = response.events
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        DispatchQueue.main.async { [weak self] in
            self?.todayViewController.calendarEventsCollectionView.collectionView.reloadData()
        }
    }
    
}
