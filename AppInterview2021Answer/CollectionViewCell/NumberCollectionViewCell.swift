//
//  NumberCollectionViewCell.swift
//  AppInterview2021Answer
//
//  Created by 李泰儀 on 2021/5/14.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.layer.cornerRadius = titleLabel.frame.height / 2
    }
    
    public func configure(number: Number) {
        titleLabel.text = String(number.value)
        toggleCell(number: number)
    }
    
    public func toggleCell(number: Number) {
        let color = number.color
        titleLabel.backgroundColor = number.isSelected ? number.color : color.withAlphaComponent(0.4)
        titleLabel.textColor = number.isSelected ? .white : number.color
    }
}
