//
//  RoundedView.swift
//  Werdd
//
//  Created by Yuanjian Liao on 4/10/22.
//

import UIKit

class RoundedView: UIView {
    
    let body: String
    let sectionName: String
    let bodyLabelFontSize: CGFloat
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rubik-Bold", size: 12)
        label.textColor = UIColor(named: "GrayishWhite")
        return label
    }()
    
    let vertStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()

    init(body: String, sectionName: String, bodyLabelFontSize: CGFloat) {
        self.body = body
        self.sectionName = sectionName
        self.bodyLabelFontSize = bodyLabelFontSize
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 24
        
        bodyLabel.font = UIFont(name: "Rubik-light", size: bodyLabelFontSize)
        bodyLabel.text = body
        sectionLabel.text = sectionName
        
        vertStackView.addArrangedSubview(bodyLabel)
        vertStackView.addArrangedSubview(sectionLabel)
        
        addSubview(vertStackView)
        
        NSLayoutConstraint.activate([
            vertStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            vertStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            vertStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            vertStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
        ])
    }

}
