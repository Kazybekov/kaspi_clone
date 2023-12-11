//
//  DepositView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 16.11.2023.
//

import Foundation
import UIKit

class DepositView:UIView{
    
    init(){
        super.init(frame: .zero)
        setupDepositView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let DepositViewTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Regular", size: 16)
        view.text = "Kaspi Gold"
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()

    let CardImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cardIcon.png")
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()

    let DepositViewNumber: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "SFProText-Regular", size: 16)
        view.text = "123 456,78 ₸"
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    let MoreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "moreButton.png"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setupDepositView(){
        self.addSubview(CardImageView)
        
        NSLayoutConstraint.activate([
            CardImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            CardImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
        ])
                
        self.addSubview(DepositViewTitle)
        
        NSLayoutConstraint.activate([
            DepositViewTitle.heightAnchor.constraint(equalToConstant: 20),
            DepositViewTitle.widthAnchor.constraint(equalToConstant: 180),
            DepositViewTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            DepositViewTitle.leftAnchor.constraint(equalTo: CardImageView.rightAnchor, constant: 12)
        ])
        
        self.addSubview(DepositViewNumber)
        NSLayoutConstraint.activate([
            DepositViewNumber.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            DepositViewNumber.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12)
        ])
        
        self.addSubview(MoreButton)
        NSLayoutConstraint.activate([
            MoreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            MoreButton.centerYAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    
}
