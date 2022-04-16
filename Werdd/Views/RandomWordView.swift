//
//  RandomWordView.swift
//  Werdd
//
//  Created by Yuanjian Liao on 3/19/22.
//

import UIKit

protocol RandomWordViewDelegate: AnyObject {
    func refreshButtonTapped()
}

class RandomWordView: UIView {
    
    weak var delegate: RandomWordViewDelegate?
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
        
    //word label
    let wordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "reconnoiter"
        label.textColor = .black
        label.font = UIFont(name: "Rubik-Bold", size: 24)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    //part of speech label
    let partOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.text = "verb"
        label.textColor = .black
        label.font = UIFont(name: "Rubik-Regular", size: 11)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    //horizontal stack view
    lazy var horizStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .lastBaseline
        stackView.distribution = .fill
        stackView.addArrangedSubview(wordTitleLabel)
        stackView.addArrangedSubview(partOfSpeechLabel)
        stackView.spacing = 7
        return stackView
    }()
    
    //definition label
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.text = "to inspect, observe, or survey (the enemy, the enemy's strength or position, a region, etc.) in order to gain information for military purposes."
        label.textColor = .black
        label.font = UIFont(name: "Rubik-Light", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    //vertical stack view
    lazy var vertStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 7
        stackView.addArrangedSubview(horizStackView)
        stackView.addArrangedSubview(definitionLabel)
        return stackView
    }()
    
    var refreshButton: UIButton?
    
    let needRefreshButton: Bool
    
    init(needRefreshButton: Bool = true) {
        self.needRefreshButton = needRefreshButton
        super.init(frame: .zero)
        setupUI()
    }
    
    //cuz I am not using storyboard
    required init?(coder: NSCoder) {
        //decode view objects from storyboard
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        backgroundColor = UIColor(named: "randomWordViewBackgroundColor")
        layer.cornerRadius = 30
        addSubview(spinner)
        addSubview(vertStackView)
        vertStackView.activate(constraints: [
            vertStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            vertStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            vertStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
        
        spinner.activate(constraints: [
            spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        if needRefreshButton {
            refreshButton = UIButton()
            refreshButton!.setBackgroundImage(UIImage(named: "refreshButtonIcon"), for: .normal)
            refreshButton!.addTarget(self, action: #selector(refreshButtonTapped(_:)), for: .touchUpInside)
            addSubview(refreshButton!)
            refreshButton!.activate(constraints: [
                refreshButton!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
                refreshButton!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
                refreshButton!.heightAnchor.constraint(equalToConstant: 36),
                refreshButton!.widthAnchor.constraint(equalToConstant: 36)
            ])
        }
        
    }
    
    func startLoading() {
        spinner.startAnimating()
    }
    
    func stopLoading() {
        spinner.stopAnimating()
    }
    
    func updateLabels(with word: RandomWordResponse) {
        wordTitleLabel.text = word.word
        partOfSpeechLabel.text = word.results?[0].partOfSpeech
        definitionLabel.text = word.results?[0].definition
    }
    
    @objc func refreshButtonTapped(_ sender: UIButton) {
        delegate?.refreshButtonTapped()
    }

}
