//
//  CardView.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 17.08.2023.
//

import Foundation
import UIKit

class CardView: UIView {
    
    func configure(with info: CardViewInfo) {
        
    }
    
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let labelView: UILabel = {
        let label = UILabel()
        return label
    }()

    
    
}

private extension CardView {
    func initialize() {
        backgroundColor = UIColor(cgColor: CGColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1))
        
    }
}
