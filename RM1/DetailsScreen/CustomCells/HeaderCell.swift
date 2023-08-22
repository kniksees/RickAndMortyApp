import UIKit
import SnapKit

class HeaderCell: UITableViewCell {


    let avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 16
        
        return avatar
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(cgColor: CGColor(red: 71/255, green: 198/255, blue: 11/255, alpha: 1))
        label.textAlignment = .center
        return label
    }()



    func setupImageView () {
        avatar.snp.makeConstraints { make in
            make.height.width.equalTo(148)
        }
    }
    



    func setupCell() {
        setupImageView()
        let stackView = UIStackView(arrangedSubviews: [avatar, nameLabel, statusLabel])
        stackView.axis = .vertical
        stackView.setCustomSpacing(17, after: avatar)
        stackView.setCustomSpacing(8, after: nameLabel)
        self.contentView.addSubview(stackView)
        self.backgroundColor = UIColor(cgColor: CGColor(red: 4/255, green: 12/255, blue: 30/255, alpha: 1))
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }

    func configure(image: UIImage, nameLabel: String, statusLabel: String) {
        self.avatar.image = image
        self.nameLabel.text = nameLabel
        self.statusLabel.text = statusLabel

    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
