//
//  TransferViewBottom.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 23.11.2023.
//

import Foundation
import UIKit

class TransferViewBottom:UIStackView {
    
    let defaults = UserDefaults()

    init(){
        super.init(frame: .zero)
        
        setupStack()
        
    }
    
    func setupStack(){
        
        
        
//        self.addArrangedSubview(cashView)
        self.addArrangedSubview(messageView)
        self.addArrangedSubview(chipsView)
        self.addArrangedSubview(comissionLabelView)
        //self.addArrangedSubview(transferButtonView)
        
        setupChipsView()
        setupLastViews()
        setupMessageView()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    func setupMessageView(){
        if let imageData = defaults.object(forKey: "avatarPhoto") as? Data,
                let image = UIImage(data: imageData) {
            userImage.image = image
        }
        messageTextField.layer.cornerRadius = 7
        messageTextField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        
        messageView.addSubview(messageTextField)
        NSLayoutConstraint.activate([
            messageTextField.topAnchor.constraint(equalTo: messageView.topAnchor),
            messageTextField.bottomAnchor.constraint(equalTo: messageView.bottomAnchor),
            messageTextField.leftAnchor.constraint(equalTo: messageView.leftAnchor, constant: 16),
            messageTextField.rightAnchor.constraint(equalTo:messageView.rightAnchor, constant: -70)
        ])
        
        messageView.addSubview(userImage)
        userImage.layer.cornerRadius = 20
        userImage.clipsToBounds = true
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: messageView.centerYAnchor),
            userImage.rightAnchor.constraint(equalTo:messageView.rightAnchor,constant: -16),
            userImage.heightAnchor.constraint(equalToConstant: 40),
            userImage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupLastViews(){
        comissionLabelView.addSubview(comissionLabel)
        
        NSLayoutConstraint.activate([
            comissionLabel.centerXAnchor.constraint(equalTo: comissionLabelView.centerXAnchor),
            comissionLabel.centerYAnchor.constraint(equalTo: comissionLabelView.bottomAnchor)
        ])
        
        
        
    }
    
    
    
    // MARK: MessageView
    let messageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.heightAnchor.constraint(equalToConstant: 72).isActive = true
        view.backgroundColor = .clear
        return view
    }()
    let messageTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Сообщение получателю"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .white
        return field
    }()
    var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Chips
    let chipsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let chipsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
//        view.alignment = .
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupChipsView(){
//        NSLayoutConstraint.activate([
//            chipsView.leftAnchor.constraint(equalTo: messageView.leftAnchor,constant: 16),
//            chipsView.rightAnchor.constraint(equalTo: messageView.rightAnchor,constant: -70)
//        ])
        let chip = Chips("thanks!")
        chipsStackView.insertArrangedSubview(chip, at: 0)
        let chip2 = Chips("for dinner!")
        chipsStackView.insertArrangedSubview(chip2, at: 1)
        let chip3 = Chips("Retunrning")
        chipsStackView.insertArrangedSubview(chip3, at: 2)
        
        chipsView.addSubview(chipsStackView)
        chipsStackView.centerXAnchor.constraint(equalTo: chipsView.centerXAnchor).isActive = true
//        chipsStackView.leftAnchor.constraint(equalTo: chipsView.leftAnchor,constant: 16).isActive = true
//        chipsStackView.rightAnchor.constraint(equalTo: chipsView.rightAnchor,constant: -70).isActive = true
        
    }
    
    // MARK: last 2 views
    let comissionLabel: UILabel = {
        let label = UILabel()
        label.text = "Комиссия 0 ₸"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.565, green: 0.565, blue: 0.565, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let comissionLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.heightAnchor.constraint(equalToConstant: 58).isActive = true
        view.backgroundColor = .clear
        return view
    }()
    
    
}
