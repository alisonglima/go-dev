//
//  PeopleTableViewCell.swift
//  CocoapodsApp
//
//  Created by FL00022 on 21/03/22.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var company: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "PeopleTableViewCell"
    
    func updateCellView(_ person: Person) {
        name.text = person.name
        photo.downloaded(from: person.photo)
        company.text = person.company.name
    }
    
}
