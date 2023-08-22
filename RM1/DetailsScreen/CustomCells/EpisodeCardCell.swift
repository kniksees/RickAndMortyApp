//
//  EpisodeCardCell.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 22.08.2023.
//

import UIKit

class EpisodeCardCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backGroundView: UIView = {
        let backGroundView = UIView(frame: CGRect(x: 0, y: 0, width: 327, height: 80))
        backGroundView.layer.cornerRadius = 16
        backGroundView.backgroundColor = UIColor(cgColor: CGColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1))
        return backGroundView
    }()
    
    let episodeName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let episodeNumber: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 71/255, green: 198/255, blue: 11/255, alpha: 1))
        label.font = label.font.withSize(12)
        label.textAlignment = .left
        return label
    }()
    
    let episodeDate: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 147/255, green: 152/255, blue: 156/255, alpha: 1))
        label.font = label.font.withSize(12)
        label.textAlignment = .right
        return label
    }()
    
    func setup() {
        addSubview(backGroundView)
        backGroundView.addSubview(episodeName)
        backGroundView.addSubview(episodeNumber)
        backGroundView.addSubview(episodeDate)

        episodeName.translatesAutoresizingMaskIntoConstraints = false
        episodeNumber.translatesAutoresizingMaskIntoConstraints = false
        episodeDate.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            episodeName.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 14),
            episodeName.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 15),
            episodeName.widthAnchor.constraint(equalToConstant: 300),
            
            episodeNumber.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -12),
            episodeNumber.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 15),
            
            episodeDate.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -12),
            episodeDate.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -15)
        ])
    }
}
