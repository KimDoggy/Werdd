//
//  ViewController.swift
//  Werdd
//
//  Created by Yuanjian Liao on 3/11/22.
//

import UIKit

class ViewController: UIViewController {
    
//    let words = [
//        Word(title: "polychromatic", partOfSpeech: "adjective", definition: "having or exhibiting a variety of colors"),
//        Word(title: "felicitous", partOfSpeech: "adjective", definition: "well-suited for the occasion, as an action, manner, or expression; apt; appropriate"),
//        Word(title: "bucchero", partOfSpeech: "noun", definition: "an Etruscan black ceramic ware, often ornamented with incised geometrical patterns or figures carved in relief"),
//        Word(title: "quagmire", partOfSpeech: "noun", definition: "an area of miry or boggy ground whose surface yields under the tread"),
//        Word(title: "transcendental", partOfSpeech: "adjective", definition: "abstract or metaphysical"),
//        Word(title: "duniewassal", partOfSpeech: "noun", definition: "a gentleman, especially a cadet of a ranking family, among the Highlanders of Scotland"),
//        Word(title: "reconnoiter", partOfSpeech: "verb", definition: "to inspect, observe, or survey (the enemy, the enemy's strength or position, a region, etc.) in order to gain information for military purposes"),
//        Word(title: "ferrule", partOfSpeech: "noun", definition: "a ring or cap, usually of metal, put around the end of a post, cane, or the like, to prevent splitting"),
//        Word(title: "cenote", partOfSpeech: "noun", definition: "a deep natural well or sinkhole, especially in Central America, formed by the collapse of surface limestone that exposes groundwater underneath"),
//        Word(title: "démodé", partOfSpeech: "adjective", definition: "no longer in fashion; out of date; outmoded"),
//        Word(title: "tour de force", partOfSpeech: "noun", definition: "a feat requiring unusual strength, skill, or ingenuity"),
//        Word(title: "azimuth", partOfSpeech: "noun", definition: "the arc of the horizon measured clockwise from the south point, in astronomy, or from the north point, in navigation, to the point where a vertical circle through a given heavenly body intersects the horizon"),
//        Word(title: "sciamachy", partOfSpeech: "noun", definition: "an act or instance of fighting a shadow or an imaginary enemy"),
//        Word(title: "enumerate", partOfSpeech: "verb", definition: "to ascertain the number of; count"),
//        Word(title: "pindan", partOfSpeech: "noun", definition: "semiarid country; scrubland")
//    ]
    
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
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()
    
//    let compLayout = UICollectionViewCompositionalLayout { sectionIndex, env in
//        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(93)))
//        item.contentInsets.trailing = 8
//        item.contentInsets.bottom = 8
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1000)), subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24)
//        return section
//    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout
        )
        collectionView.register(WordCollectionViewCell.self, forCellWithReuseIdentifier: WordCollectionViewCell.identifier)
        collectionView.layer.cornerRadius = 30
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        blueView.startLoading()
        NetworkManager.shared.getRandomWord { [weak self] result in
            DispatchQueue.main.async {
                self?.blueView.stopLoading()
                guard let result = result else {
                    print("network call fails")
                    return
                }
                self?.blueView.updateLabels(with: result)
            }
        }
        
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
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.activate(constraints: [
            collectionView.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: RandomWordViewDelegate {
    
    func refreshButtonTapped() {
        
        blueView.startLoading()
        NetworkManager.shared.getRandomWord { [weak self] result in
            DispatchQueue.main.async {
                self?.blueView.stopLoading()
                guard let result = result else {
                    print("network call fails")
                    return
                }
                self?.blueView.updateLabels(with: result)
            }
        }
        
    }

}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return words.count
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordCollectionViewCell.identifier, for: indexPath) as? WordCollectionViewCell else {
            return UICollectionViewCell()
        }
//        let word = words[indexPath.row]
//        cell.configure(with: word)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return the size of the collection view cell
//        let numberOfItem: CGFloat = 2
//        let width = collectionView.bounds.size.width
//        let sectionSpacing: CGFloat = flowLayout.sectionInset.left
//        let itemSpacing: CGFloat = flowLayout.minimumInteritemSpacing
//        let availableSpacing = width - itemSpacing - sectionSpacing * 2
//
//        return CGSize(width: floor(availableSpacing/numberOfItem), height: 93)
//        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
//            return CGSize(width: 0, height: 0)
//        }
//
//        let width:CGFloat = collectionView.frame.size.width
//        let numberOfItems: CGFloat = 2
//        let sectionLeadingInsect = flowLayout.sectionInset.left
//        let interItemSpacing = flowLayout.minimumInteritemSpacing
//        let itemWidth = floor((width - sectionLeadingInsect * 2 - interItemSpacing) / numberOfItems)
        
//        let word = words[indexPath.item]
        
//        let estimatedSizeForWordTitleLabel = NSString(string: word.title).boundingRect(with: .init(width: itemWidth - 20, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)], context: nil)
//        let estimatedSizeForDefinitionLabel = NSString(string: word.definition).boundingRect(with: .init(width: itemWidth - 20, height: 1000), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .light)], context: nil)
//        print("\(indexPath.row) - \(14 + estimatedSizeForWordTitleLabel.height + 8 + estimatedSizeForDefinitionLabel.height)")
//        return CGSize(width: itemWidth, height: 14 + estimatedSizeForWordTitleLabel.height + 8 + estimatedSizeForDefinitionLabel.height + 14)
//    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let word = words[indexPath.row]
//        navigationController?.pushViewController(WordDetailViewController(with: word), animated: true)
    }
    
}

extension UIView {
    
    func activate(constraints: [NSLayoutConstraint]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }

}
