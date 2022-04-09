//
//  WordTableViewCell.swift
//  Werdd
//
//  Created by Yuanjian Liao on 4/3/22.
//

import UIKit

class WordTableViewCell: UITableViewCell {
    
    static let identifier = "WordTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        //adjust font siz based on system setting
        label.adjustsFontForContentSizeCategory = true
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    let partOfSpeechLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        //adjust font siz based on system setting
        label.adjustsFontForContentSizeCategory = true
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()


    let definitionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        //adjust font siz based on system setting
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .lastBaseline
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()


    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "WordTableViewCellBackgroundColor")
        view.layer.cornerRadius = 20
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        
        horizontalStackView.addArrangedSubview(titleLabel)
        horizontalStackView.addArrangedSubview(partOfSpeechLabel)
        
        mainStackView.addArrangedSubview(horizontalStackView)
        mainStackView.addArrangedSubview(definitionLabel)
        mainView.addSubview(mainStackView)
        mainStackView.activate(constraints: [
            mainStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 9),
            mainStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 21),
            mainStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -21),
            mainStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -9)
        ])
        
        contentView.addSubview(mainView)
        mainView.activate(constraints: [
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    func update(with word: Word) {
        titleLabel.text = word.title
        partOfSpeechLabel.text = word.partOfSpeech
        definitionLabel.text = word.definition
    }

}
