//
//  HeaderReusableView.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 22.08.2023.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backGroundView: UIView = {
        let backGroundView = UIView(frame: CGRect(x: 0, y: 0, width: 327, height: 50))
        backGroundView.layer.cornerRadius = 16
        backGroundView.backgroundColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))
        return backGroundView
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    func setup() {
        addSubview(backGroundView)
        backGroundView.addSubview(headerLabel)

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: backGroundView.leadingAnchor, constant: 40),
            headerLabel.centerYAnchor.constraint(equalTo: backGroundView.centerYAnchor, constant: 4)
        ])
    }
}
