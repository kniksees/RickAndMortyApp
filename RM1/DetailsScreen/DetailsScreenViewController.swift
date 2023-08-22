//
//  DetailsScreenViewController.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 21.08.2023.
//

import UIKit

class DetailsScreenViewController: UIViewController {

    var collectionView: UICollectionView!
    let indicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))
        setUpCollectionView()
        setupIndicator()
        
        Task {
            InfoAndData.personInfo = await [NetworkManager.getPersonInfo(strUrl: InfoAndData.url)]
            if InfoAndData.personInfo[0].origin.url != "" {
                InfoAndData.planetInfo = await [NetworkManager.getPlanet(strUrl:  InfoAndData.personInfo[0].origin.url)]
            }
            InfoAndData.episodes = await NetworkManager.getEpisodes(strUrl: InfoAndData.personInfo[0].episode)
            indicator.stopAnimating()
            collectionView.reloadData()
        }
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

    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = .init(width: 327, height: 50)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCardCell.self, forCellWithReuseIdentifier: "\(PhotoCardCell.self)")
        collectionView.register(InfoCardCell.self, forCellWithReuseIdentifier: "\(InfoCardCell.self)")
        collectionView.register(OriginCardCell.self, forCellWithReuseIdentifier: "\(OriginCardCell.self)")
        collectionView.register(EpisodeCardCell.self, forCellWithReuseIdentifier: "\(EpisodeCardCell.self)")
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HeaderReusableView.self)")
    }
}


extension DetailsScreenViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3:
            if InfoAndData.personInfo.count == 1 {
                return InfoAndData.personInfo[0].episode.count
            }
            return 0
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCardCell.self)", for: indexPath) as? PhotoCardCell else {
                return UICollectionViewCell()
            }
            if InfoAndData.personInfo.count == 1 {
                cell.labelName.text = InfoAndData.personInfo[0].name
                cell.labelStatus.text = InfoAndData.personInfo[0].status
            }
            cell.imageView.image = InfoAndData.image
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(InfoCardCell.self)", for: indexPath) as? InfoCardCell else {
                return UICollectionViewCell()
            }
            if InfoAndData.personInfo.count == 1 {
                cell.speciesLabelText.text = InfoAndData.personInfo[0].species
                if InfoAndData.personInfo[0].type.count == 0 {
                    cell.typeLabelText.text = "None"
                } else {
                    cell.typeLabelText.text = InfoAndData.personInfo[0].type
                }
                cell.genderLabelText.text = InfoAndData.personInfo[0].gender
            }
            InfoAndData.personInfo.removeAll()
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(OriginCardCell.self)", for: indexPath) as? OriginCardCell else {
                return UICollectionViewCell()
            }
            if InfoAndData.planetInfo.count == 1 {
                cell.nameOriginLabel.text = InfoAndData.planetInfo[0].name
                cell.typeOriginLabel.text = InfoAndData.planetInfo[0].type
            }
            InfoAndData.planetInfo.removeAll()
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(EpisodeCardCell.self)", for: indexPath) as? EpisodeCardCell else {
                return UICollectionViewCell()
            }
            if !InfoAndData.episodes.isEmpty {
                cell.episodeName.text = InfoAndData.episodes[indexPath.item].name
                cell.episodeDate.text = InfoAndData.episodes[indexPath.item].air_date
                cell.episodeNumber.text = InfoAndData.episodeNumberFormater(episode: InfoAndData.episodes[indexPath.item].episode) 
            }
            return cell
        default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(HeaderReusableView.self)", for: indexPath) as? HeaderReusableView
            else {
                return UICollectionReusableView()
            }
            header.headerLabel.text = InfoAndData.sections[indexPath.section]
            return header
        default: return UICollectionReusableView()
        }

    }
}

extension DetailsScreenViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section {
        case 0:  return CGSize(width: 327, height: 250)
        case 1:  return CGSize(width: 327, height: 124)
        case 2:  return CGSize(width: 327, height: 80)
        case 3:  return CGSize(width: 327, height: 80)
        default: return CGSize(width: 0, height: 0)
        }
       
    }
}
