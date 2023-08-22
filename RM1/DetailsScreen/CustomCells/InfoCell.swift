//
//  InfoCell.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 20.08.2023.
//

import UIKit

class InfoCell: UITableViewCell {
    
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "Species"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let speciesLabelText: UILabel = {
        let label = UILabel()
        //label.text = "11234"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let typeLabelText: UILabel = {
        let label = UILabel()
        //label.text = "11234"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let genderLabelText: UILabel = {
        let label = UILabel()
        //label.text = "11234"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()

    func setupCell() {
        speciesLabel.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        speciesLabelText.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        typeLabel.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        typeLabelText.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        genderLabel.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        genderLabelText.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
        let horisontalStack1 = UIStackView(arrangedSubviews: [speciesLabel, speciesLabelText])
        horisontalStack1.axis = .horizontal
        let horisontalStack2 = UIStackView(arrangedSubviews: [typeLabel, typeLabelText])
        horisontalStack2.axis = .horizontal
        let horisontalStack3 = UIStackView(arrangedSubviews: [genderLabel, genderLabelText])
        horisontalStack3.axis = .horizontal
        
        let verticalStack = UIStackView(arrangedSubviews: [horisontalStack1, horisontalStack2, horisontalStack3])
        verticalStack.axis = .vertical
        verticalStack.spacing = 15

        
        self.contentView.addSubview(verticalStack)
        self.backgroundColor = UIColor(cgColor: CGColor(red: 38/255, green: 42/255, blue: 56/255, alpha: 1))
        verticalStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func configure(speciesLabelText: String, typeLabelText: String, genderLabelText: String) {
        self.speciesLabelText.text = speciesLabelText
        if typeLabelText.count == 0 {
            self.typeLabelText.text = "None"
        } else {
            self.typeLabelText.text = typeLabelText
        }
        
        self.genderLabelText.text = genderLabelText
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
