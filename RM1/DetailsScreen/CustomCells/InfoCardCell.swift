//
//  InfoCardCell.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 21.08.2023.
//

import UIKit

class InfoCardCell : UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let backGroundView: UIView = {
        let backGroundView = UIView(frame: CGRect(x: 0, y: 0, width: 327, height: 124))
        backGroundView.layer.cornerRadius = 16
        backGroundView.backgroundColor = UIColor(cgColor: CGColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1))
        return backGroundView
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 196/255, green: 201/255, blue: 206/255, alpha: 1))
        label.text = "Species:"
        label.textAlignment = .left
        return label
    }()
    
    let speciesLabelText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 196/255, green: 201/255, blue: 206/255, alpha: 1))
        label.text = "Type:"
        label.textAlignment = .left
        return label
    }()
    
    let typeLabelText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 196/255, green: 201/255, blue: 206/255, alpha: 1))
        label.text = "Gender:"
        label.textAlignment = .left
        return label
    }()
    
    let genderLabelText: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    func setup() {
        
        addSubview(backGroundView)
        backGroundView.addSubview(speciesLabel)
        backGroundView.addSubview(speciesLabelText)
        backGroundView.addSubview(typeLabel)
        backGroundView.addSubview(typeLabelText)
        backGroundView.addSubview(genderLabel)
        backGroundView.addSubview(genderLabelText)
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabelText.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabelText.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabelText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 20),
            speciesLabel.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 15),
            
            speciesLabelText.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 20),
            speciesLabelText.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -15),
            
            typeLabel.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor, constant: 0),
            typeLabel.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 15),
            
            typeLabelText.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor, constant: 0),
            typeLabelText.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -15),
            typeLabelText.widthAnchor.constraint(equalToConstant: 200),
            
            genderLabel.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -20),
            genderLabel.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 15),
            
            genderLabelText.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -20),
            genderLabelText.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -15),
        ])
    }
}
