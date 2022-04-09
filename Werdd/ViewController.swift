//
//  ViewController.swift
//  Werdd
//
//  Created by Yuanjian Liao on 3/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    let words = [
        Word(title: "polychromatic", partOfSpeech: "adjective", definition: "having or exhibiting a variety of colors"),
        Word(title: "felicitous", partOfSpeech: "adjective", definition: "well-suited for the occasion, as an action, manner, or expression; apt; appropriate"),
        Word(title: "bucchero", partOfSpeech: "noun", definition: "an Etruscan black ceramic ware, often ornamented with incised geometrical patterns or figures carved in relief"),
        Word(title: "quagmire", partOfSpeech: "noun", definition: "an area of miry or boggy ground whose surface yields under the tread"),
        Word(title: "transcendental", partOfSpeech: "adjective", definition: "abstract or metaphysical"),
        Word(title: "duniewassal", partOfSpeech: "noun", definition: "a gentleman, especially a cadet of a ranking family, among the Highlanders of Scotland"),
        Word(title: "reconnoiter", partOfSpeech: "verb", definition: "to inspect, observe, or survey (the enemy, the enemy's strength or position, a region, etc.) in order to gain information for military purposes"),
        Word(title: "ferrule", partOfSpeech: "noun", definition: "a ring or cap, usually of metal, put around the end of a post, cane, or the like, to prevent splitting"),
        Word(title: "cenote", partOfSpeech: "noun", definition: "a deep natural well or sinkhole, especially in Central America, formed by the collapse of surface limestone that exposes groundwater underneath"),
        Word(title: "démodé", partOfSpeech: "adjective", definition: "no longer in fashion; out of date; outmoded"),
        Word(title: "tour de force", partOfSpeech: "noun", definition: "a feat requiring unusual strength, skill, or ingenuity"),
        Word(title: "azimuth", partOfSpeech: "noun", definition: "the arc of the horizon measured clockwise from the south point, in astronomy, or from the north point, in navigation, to the point where a vertical circle through a given heavenly body intersects the horizon"),
        Word(title: "sciamachy", partOfSpeech: "noun", definition: "an act or instance of fighting a shadow or an imaginary enemy"),
        Word(title: "enumerate", partOfSpeech: "verb", definition: "to ascertain the number of; count"),
        Word(title: "pindan", partOfSpeech: "noun", definition: "semiarid country; scrubland")
    ]
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Werdd."
        label.textColor = .black
        label.font = UIFont(name: "Rubik-SemiBold", size: 36)
        print("label is created")
        return label
    }()
    
    lazy var blueView: RandomWordView = {
        let blueView = RandomWordView()
        blueView.delegate = self
        return blueView
    }()
    

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 30
        tableView.register(WordTableViewCell.self, forCellReuseIdentifier: WordTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewWillLayoutSubviews() {
        //no need to call super as the default implementation does nothing
        print("view will layout subviews")
    }
    
    override func viewDidLayoutSubviews() {
        //no need to call super as the default implementation does nothing
        print("view did layout subviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "MainBackgroundColor")
        
        //app title label
        view.addSubview(appTitleLabel)
        appTitleLabel.activate(constraints: [
            appTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            appTitleLabel.widthAnchor.constraint(equalToConstant: 121),
            appTitleLabel.heightAnchor.constraint(equalToConstant: 43)
        ])
        
        //random word view aka blue view
        view.addSubview(blueView)
        blueView.activate(constraints: [
            blueView.topAnchor.constraint(equalTo: appTitleLabel.bottomAnchor, constant: 23),
            blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor, multiplier: 0.49)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
//        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        view.addSubview(tableView)
        tableView.activate(constraints: [
            tableView.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: RandomWordViewDelegate {
    
    func refreshButtonTapped() {
        let index = Int.random(in: 0..<words.count)
        let randomWord = words[index]
        blueView.updateLabels(with: randomWord)
    }

}

extension ViewController: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var sectionTitle: String
//        if section == 0 {
//            sectionTitle = "Words"
//        } else {
//            sectionTitle = "Whatever"
//        }
//        return sectionTitle
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordTableViewCell.identifier, for: indexPath) as? WordTableViewCell else {
            return UITableViewCell()
        }
        
        
        let word = words[indexPath.row]
        //use content config
//        var contentConfig = cell.defaultContentConfiguration()
//        contentConfig.text = word.title
//        contentConfig.secondaryText = word.definition
//        cell.contentConfiguration = contentConfig
        cell.update(with: word)
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let word = words[indexPath.row]
        let wordDetailedView = WordDetailedView(word: word)
        wordDetailedView.show(self.view)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension UIView {
    
    func activate(constraints: [NSLayoutConstraint]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }

}
