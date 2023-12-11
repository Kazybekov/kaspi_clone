//
//  LayoutTransferViewController.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 16.11.2023.
//

import Foundation
import UIKit

extension TransferViewController{
    
    func setupTransferButton(){
        transferButtonView.addSubview(transferButton)
        transferButton.addTarget(self, action: #selector(transferMoney), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            transferButton.centerYAnchor.constraint(equalTo: transferButtonView.centerYAnchor),
            transferButton.centerXAnchor.constraint(equalTo: transferButtonView.centerXAnchor),
            transferButton.heightAnchor.constraint(equalToConstant: 60),
            transferButton.leftAnchor.constraint(equalTo: transferButtonView.leftAnchor, constant: 16),
            transferButton.rightAnchor.constraint(equalTo: transferButtonView.rightAnchor, constant: -16)
        ])
    }
    
    func setupCashView(){
        cashView.addSubview(cashViewTitle)
        
        NSLayoutConstraint.activate([
            cashViewTitle.centerYAnchor.constraint(equalTo: cashView.centerYAnchor),
            cashViewTitle.centerXAnchor.constraint(equalTo: cashView.centerXAnchor)
        ])
    }
    
    func setupPopUpview(){
        
        popUpView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 20)
        ])
        
        popUpView.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            infoLabel.leftAnchor.constraint(equalTo: popUpView.leftAnchor, constant: 16),
            infoLabel.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 50)
        ])
        
    }
    
    func setupContactView(){
        contactButton.addTarget( self, action: #selector(searchContact), for: .touchUpInside)

        contactView.addSubview(contactButton)
            NSLayoutConstraint.activate([
            contactButton.centerYAnchor.constraint(equalTo: contactView.centerYAnchor),
            contactButton.centerXAnchor.constraint(equalTo: contactView.rightAnchor,constant: -36)
        ])
        
        contactView.addSubview(numberField)
        NSLayoutConstraint.activate([
            numberField.centerYAnchor.constraint(equalTo: contactView.centerYAnchor),
            numberField.leftAnchor.constraint(equalTo: contactView.leftAnchor, constant: 16),
            numberField.rightAnchor.constraint(equalTo: contactButton.leftAnchor, constant: 12)
        ])
    }
    
    func setupSegmentedControlView(){
        segmentedControl.backgroundColor = .white
        segmentedControl.selectedSegmentTintColor = .red
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = CGColor(red: 0.93, green: 0.29, blue: 0.24, alpha: 1)
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for:.normal)
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
        NSLayoutConstraint.activate([
            segmentedControl.heightAnchor.constraint(equalToConstant: 36),
        ])
        
    }
    
    func SetupStackView(){
        stackView.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor ),
        ])
    }
}
