import UIKit

class ViewController: UIViewController  {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var todayViewController: UIViewController = {
        let vc = TodayViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    var pages: [UIViewController] = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let greenViewController = UIViewController()
        greenViewController.view.backgroundColor = .systemGreen
        
        
        pages = [todayViewController, greenViewController]
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        pages.forEach { (controller) in
            controller.view.translatesAutoresizingMaskIntoConstraints = false
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
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        
    }
    
    
}
