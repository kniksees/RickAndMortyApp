//
//  PhotoCardCell.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 21.08.2023.
//

import UIKit

class PhotoCardCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backGroundView: UIView = {
        let backGroundView = UIView(frame: CGRect(x: 0, y: 0, width: 327, height: 250))
        backGroundView.backgroundColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))
        return backGroundView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let labelName: UILabel = {
        let labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.textColor = .white
        labelName.textAlignment = .center
        return labelName
    }()
    
    let labelStatus: UILabel = {
        let labelStatus = UILabel()
        labelStatus.textColor = .white
        labelStatus.textAlignment = .center
        labelStatus.textColor = UIColor(cgColor: CGColor(red: 71/255, green: 198/255, blue: 11/255, alpha: 1))
        return labelStatus
    }()
    
    func setup() {
        addSubview(backGroundView)
        backGroundView.addSubview(imageView)
        backGroundView.addSubview(labelName)
        backGroundView.addSubview(labelStatus)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 148),
            imageView.widthAnchor.constraint(equalToConstant: 148),
            
            labelName.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor, constant: 0),
            labelName.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 170),
            
            labelStatus.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor, constant: 0),
            labelStatus.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 200)
        ])
    }

}
