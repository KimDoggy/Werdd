//
//  WordDetailedView.swift
//  Werdd
//
//  Created by Yuanjian Liao on 3/26/22.
//

import UIKit

class WordDetailedView: UIView {
    
    let word: Word
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var definitionRoundedView: RoundedView = {
        let roundedView = RoundedView(body: "\(word.partOfSpeech)\n\(word.definition)", sectionName: "Definition", bodyLabelFontSize: 20)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.backgroundColor = UIColor(named: "LightBlue")
        return roundedView
    }()
    
    let synonymsRoundedView: RoundedView = {
        let roundedView = RoundedView(body: "Whatever", sectionName: "Synonyms", bodyLabelFontSize: 14)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.backgroundColor = UIColor(named: "LightGreen")
        return roundedView
    }()
    
    let antonymsRoundedView: RoundedView = {
        let roundedView = RoundedView(body: "Whatever", sectionName: "Antonyms", bodyLabelFontSize: 14)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.backgroundColor = UIColor(named: "LightRed")
        return roundedView
    }()
    
    let exampleUsageRoundedView: RoundedView = {
        let roundedView = RoundedView(body: "Whatever", sectionName: "Example Usage", bodyLabelFontSize: 12)
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.backgroundColor = UIColor(named: "LightSkin")
        return roundedView
    }()
    
    let vertStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 24
        return stackView
    }()
    
    
    init(with word: Word) {
        self.word = word
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        backgroundColor = UIColor(named: "MainBackgroundColor")
        
        vertStackView.addArrangedSubview(definitionRoundedView)
        vertStackView.addArrangedSubview(synonymsRoundedView)
        vertStackView.addArrangedSubview(antonymsRoundedView)
        vertStackView.addArrangedSubview(exampleUsageRoundedView)
        
        contentView.addSubview(definitionRoundedView)
        contentView.addSubview(synonymsRoundedView)
        contentView.addSubview(antonymsRoundedView)
        contentView.addSubview(exampleUsageRoundedView)
        
        scrollView.addSubview(contentView)
        addSubview(scrollView)
        
        let scrollViewFrameLayoutGuide = scrollView.frameLayoutGuide
        let scrollViewContentLayoutGuide = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
            scrollViewFrameLayoutGuide.topAnchor.constraint(equalTo: self.topAnchor),
            scrollViewFrameLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollViewFrameLayoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollViewFrameLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollViewContentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollViewContentLayoutGuide.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollViewContentLayoutGuide.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollViewContentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollViewFrameLayoutGuide.widthAnchor),
            
//            vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
//            vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
//            vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -81),
//            vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 28)
            
            definitionRoundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 36),
            definitionRoundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            definitionRoundedView.bottomAnchor.constraint(equalTo: synonymsRoundedView.topAnchor, constant: -24),
            definitionRoundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),

            synonymsRoundedView.leadingAnchor.constraint(equalTo: definitionRoundedView.leadingAnchor),
            synonymsRoundedView.bottomAnchor.constraint(equalTo: antonymsRoundedView.topAnchor, constant: -24),
            synonymsRoundedView.trailingAnchor.constraint(equalTo: definitionRoundedView.trailingAnchor),

            antonymsRoundedView.leadingAnchor.constraint(equalTo: definitionRoundedView.leadingAnchor),
            antonymsRoundedView.bottomAnchor.constraint(equalTo: exampleUsageRoundedView.topAnchor, constant: -24),
            antonymsRoundedView.trailingAnchor.constraint(equalTo: definitionRoundedView.trailingAnchor),

            exampleUsageRoundedView.leadingAnchor.constraint(equalTo: definitionRoundedView.leadingAnchor),
            exampleUsageRoundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -81),
            exampleUsageRoundedView.trailingAnchor.constraint(equalTo: definitionRoundedView.trailingAnchor),
            
        
        ])
    }
    
}
