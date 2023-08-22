//
//  OriginCaedCell.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 22.08.2023.
//

import Foundation
import UIKit

class OriginCardCell: UICollectionViewCell {
    
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
    
    let planetBackGroundView: UIView = {
        let backGroundView = UIView()
        backGroundView.layer.cornerRadius = 10
        backGroundView.backgroundColor = UIColor(cgColor: CGColor(red: 25/255, green: 28/255, blue: 42/255, alpha: 1))
        return backGroundView
    }()
    
    let nameOriginLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "unknown"
        label.textAlignment = .left
        return label
    }()
    
    let typeOriginLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 71/255, green: 198/255, blue: 11/255, alpha: 1))
        label.text = "unknown"
        label.font = label.font.withSize(12)
        label.textAlignment = .left
        return label
    }()
    
    func setup() {
        
        addSubview(backGroundView)
        backGroundView.addSubview(planetBackGroundView)
        let image = UIImageView(image: UIImage(named: "planet"))
        planetBackGroundView.addSubview(image)
        backGroundView.addSubview(nameOriginLabel)
        backGroundView.addSubview(typeOriginLabel)
        
        planetBackGroundView.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        nameOriginLabel.translatesAutoresizingMaskIntoConstraints = false
        typeOriginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameOriginLabel.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 16),
            nameOriginLabel.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 88),
            nameOriginLabel.widthAnchor.constraint(equalToConstant: 230),
            
            typeOriginLabel.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -16),
            typeOriginLabel.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 88),
            
            planetBackGroundView.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor, constant: 0),
            planetBackGroundView.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 8),
            planetBackGroundView.heightAnchor.constraint(equalToConstant: 64),
            planetBackGroundView.widthAnchor.constraint(equalToConstant: 64),

            image.centerYAnchor.constraint(equalTo: planetBackGroundView.centerYAnchor, constant: 0),
            image.centerXAnchor.constraint(equalTo: planetBackGroundView.centerXAnchor, constant: 0),
            image.heightAnchor.constraint(equalToConstant: 24),
            image.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}
