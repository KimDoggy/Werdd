//
//  WordDetailViewController.swift
//  Werdd
//
//  Created by Yuanjian Liao on 4/10/22.
//

import UIKit

class WordDetailViewController: UIViewController {
    
    let word: Word
    
    init(with word: Word) {
        self.word = word
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = WordDetailedView(with: word)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationItem.title = word.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}
