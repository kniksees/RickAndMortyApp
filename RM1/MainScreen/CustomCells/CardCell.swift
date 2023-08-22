//
//  CardCell.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 17.08.2023.
//

import UIKit

class CardCell: UICollectionViewCell {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let backGroundView: UIView = {
        let backGroundView = UIView(frame: CGRect(x: 0, y: 0, width: 156, height: 202))
        backGroundView.backgroundColor = UIColor(cgColor: CGColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1))
        backGroundView.layer.cornerRadius = 16
        return backGroundView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    

    
    func setup() {
        
        addSubview(backGroundView)
        backGroundView.addSubview(imageView)
        backGroundView.addSubview(label)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            
            label.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 164),
            label.widthAnchor.constraint(equalToConstant: 156)
        ])
    }
}
