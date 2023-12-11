//
//  Chips.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 16.11.2023.
//

import Foundation
import UIKit

class Chips:UIView{
    
    init(_ text:String) {
        super.init(frame: .zero)
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.565, green: 0.565, blue: 0.565, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 13
        self.layer.borderColor = UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
        
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 26),
            self.widthAnchor.constraint(equalTo: label.widthAnchor, multiplier: 1.3),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
