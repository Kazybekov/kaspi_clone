//
//  LayoutViewController.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 06.11.2023.
//

import Foundation
import UIKit

extension ProfileViewController {
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            avatarBackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            avatarBackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            avatarBackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 165/812),
            avatarBackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            nameView.leftAnchor.constraint(equalTo: view.leftAnchor),
            nameView.rightAnchor.constraint(equalTo: view.rightAnchor),
            nameView.topAnchor.constraint(equalTo: avatarBackView.bottomAnchor, constant: 16),
            nameView.heightAnchor.constraint(equalToConstant: 57)
        ])
        NSLayoutConstraint.activate([
            surnameView.leftAnchor.constraint(equalTo: view.leftAnchor),
            surnameView.rightAnchor.constraint(equalTo: view.rightAnchor),
            surnameView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 16),
            surnameView.heightAnchor.constraint(equalToConstant: 57)
        ])
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 79),
            avatarImageView.heightAnchor.constraint(equalToConstant: 79),
            avatarImageView.centerYAnchor.constraint(equalTo: avatarBackView.centerYAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: avatarBackView.centerXAnchor)
        ])
        avatarImageView.clipsToBounds=true
        avatarImageView.layer.cornerRadius=79/2
        
        NSLayoutConstraint.activate([
            cameraButton.widthAnchor.constraint(equalToConstant: 27),
            cameraButton.heightAnchor.constraint(equalToConstant: 27),
            cameraButton.rightAnchor.constraint(equalTo:avatarImageView.rightAnchor),
            cameraButton.bottomAnchor.constraint(equalTo:avatarImageView.bottomAnchor)
        ])
        cameraButton.clipsToBounds=true
        cameraButton.layer.cornerRadius=27/2
        
        
        NSLayoutConstraint.activate([
            randomButton.rightAnchor.constraint(equalTo: avatarBackView.rightAnchor, constant: -10),
            randomButton.bottomAnchor.constraint(equalTo: avatarBackView.bottomAnchor, constant: -10),
            randomButton.widthAnchor.constraint(equalToConstant: 100),
            randomButton.heightAnchor.constraint(equalToConstant:25)
        ])
        
        randomButton.clipsToBounds=true
        randomButton.layer.cornerRadius=27/2
        
        }
}
