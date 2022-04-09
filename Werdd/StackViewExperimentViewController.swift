//
//  StackViewExperimentViewController.swift
//  Werdd
//
//  Created by Yuanjian Liao on 3/12/22.
//

import UIKit

class StackViewExperimentViewController: UIViewController {
    
    
    var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 40),
            view.heightAnchor.constraint(equalToConstant: 40)
        ])
        print("property view here")
        return view
        
    }()
    
    var blueView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 80))
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 30),
            view.heightAnchor.constraint(equalToConstant: 80)
        ])
        return view
        
    }()
    
    var greenView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 50),
            view.heightAnchor.constraint(equalToConstant: 10)
        ])
        return view
        
    }()
    
    var invisibleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 50),
            view.heightAnchor.constraint(equalToConstant: 60)
        ])
        return view
        
    }()
    
    var label1: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.backgroundColor = .red
        return label
        
    }()
    
    var label2: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.backgroundColor = .green
        return label
        
    }()
    
    var label3: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.backgroundColor = .blue
        return label
        
    }()
    
    lazy var stackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [invisibleView, redView, greenView, blueView])
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.distribution = .fill
        
        stackview.layer.backgroundColor = UIColor.gray.cgColor
        return stackview
        
        
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        print("self is here")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        
        view.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        
        ])
    }
    

    

}
