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
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
