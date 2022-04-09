//
//  WordDetailedView.swift
//  Werdd
//
//  Created by Yuanjian Liao on 3/26/22.
//

import UIKit

class WordDetailedView: UIView {
    
    let word: Word
    
    let randomWordView = RandomWordView(needRefreshButton: false)
    
    init(word: Word) {
        self.word = word
        super.init(frame: .zero)
        configure()
    }

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        backgroundColor = .black.withAlphaComponent(0.8)
   
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hide(_:))))
        
        randomWordView.updateLabels(with: word)
        addSubview(randomWordView)
        randomWordView.activate(constraints: [
            randomWordView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            randomWordView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            randomWordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            randomWordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            randomWordView.heightAnchor.constraint(equalTo: randomWordView.widthAnchor, multiplier: 0.49)
        ])
    }
    
    func show(_ superview: UIView) {
        superview.addSubview(self)
        self.activate(constraints: [
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    @objc func hide(_ sender: UITapGestureRecognizer) {
        self.removeFromSuperview()
    }
}
