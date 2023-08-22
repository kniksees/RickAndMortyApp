//
//  ViewController.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 17.08.2023.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    var collectionView: UICollectionView!
    let label = UILabel()
    
    let indicator = UIActivityIndicatorView(style: .large)
    
    
    override func viewDidLoad() {
     
        setUpCollectionView()
        setupLabel()
        setupIndicator()
        setupNavigationBar()
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))

        Task {
            InfoAndData.countOfPersons = await NetworkManager.getCountOfCharecters()
            let countOfPages = await NetworkManager.getCountOfPages()
            for i in 1...countOfPages {
                let personsArr = await NetworkManager.makeResponse(num: i)
                InfoAndData.heroes += personsArr
                for hero in personsArr {
                    await InfoAndData.imagesData.append(NetworkManager.getDataByURL(apiURL: hero.image))
                }
                self.collectionView.reloadData()
                self.indicator.stopAnimating()
            }
        }
    }
    
    func setupNavigationBar() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    func setupIndicator() {
        view.addSubview(indicator)
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setupLabel() {
        view.addSubview(label)
        label.text = "Characters"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
        label.font = UIFont.boldSystemFont(ofSize: 30)
    }

    
    func setUpCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))
        

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 134)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "\(CardCell.self)")
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 156, height: 202)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = .init(top: 0, left: (view.frame.width - 328) / 2, bottom: 0, right: (view.frame.width - 328) / 2)
        return layout
    }
    
    
}

extension MainScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        InfoAndData.heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CardCell.self)", for: indexPath) as? CardCell else {
            return UICollectionViewCell()
        }

        cell.label.text = InfoAndData.heroes[indexPath.item].name
        cell.imageView.image = UIImage(data: InfoAndData.imagesData[indexPath.item])
        return cell
    }
}


extension MainScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        true
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailsScreenViewController()
        InfoAndData.url = InfoAndData.heroes[indexPath.item].url
        InfoAndData.image = UIImage(data: InfoAndData.imagesData[indexPath.item])!
        navigationController?.pushViewController(controller, animated: true)
    }
}
