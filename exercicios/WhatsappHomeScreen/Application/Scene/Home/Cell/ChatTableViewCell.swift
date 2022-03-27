import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static let identifier = "ChatTableViewCell"
    
    lazy var friendImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy var friendNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lastMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .top
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(friendImageView)
        
        NSLayoutConstraint.activate([
            friendImageView.widthAnchor.constraint(equalToConstant: 60),
            friendImageView.heightAnchor.constraint(equalToConstant: 60),
            friendImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            friendImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            contentStack.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        contentStack.addArrangedSubview(friendNameLabel)
        contentStack.addArrangedSubview(lastMessageLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getCellData(with friend: Friend) {
        friendImageView.kf.setImage(with: URL(string: friend.picture))
        friendImageView.makeRounded()
        friendNameLabel.text = friend.name
        lastMessageLabel.text = friend.lastChat
        accessoryType = AccessoryType.disclosureIndicator
    }
    
}
