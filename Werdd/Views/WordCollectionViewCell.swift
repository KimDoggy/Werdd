//
//  WordCollectionViewCell.swift
//  Werdd
//
//  Created by Yuanjian Liao on 4/9/22.
//

import UIKit

class WordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WordCollectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        //adjust font siz based on system setting
        label.adjustsFontForContentSizeCategory = true
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    let partOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        //adjust font siz based on system setting
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()


    let definitionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        //adjust font siz based on system setting
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
//        label.backgroundColor = .red
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 1
        return label
    }()

    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .lastBaseline
        stackView.spacing = 8
        return stackView
    }()


    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor(named: "WordTableViewCellBackgroundColor")
        
        horizontalStackView.addArrangedSubview(titleLabel)
        horizontalStackView.addArrangedSubview(partOfSpeechLabel)
        
        mainStackView.addArrangedSubview(horizontalStackView)
        mainStackView.addArrangedSubview(definitionLabel)
        contentView.addSubview(mainStackView)
        mainStackView.activate(constraints: [
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -11)
        ])
        
    }
    
//    func configure(with word: Word) {
//        titleLabel.text = word.title
//        partOfSpeechLabel.text = word.partOfSpeech
//        definitionLabel.text = word.definition
//    }
    
}

