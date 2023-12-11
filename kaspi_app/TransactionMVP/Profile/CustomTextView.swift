//
//  CustomTextView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 01.11.2023.
//

import UIKit

class CustomTextView:UIView,UITextFieldDelegate{
    
    let boldText:String
    var regularText:String = "john"
     
    let defaults = UserDefaults()
    
    init(_ boldText:String) {
        
        self.boldText=boldText
        //regularText = defaults.object(forKey: boldText) as? String ?? "John"
        super.init(frame: .zero)
        
        // bad idea
        editButton.addTarget(self, action: #selector(refactorTextField), for: .touchUpInside)

        textField.delegate=self
        
        regularText = defaults.string(forKey: self.boldText) ?? "John"
        
        self.addSubview(editButton)
        self.addSubview(textField)
        self.backgroundColor = .white
        setupLayout()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField(){
        textField.attributedText=boldAndRegular()
    }
    
    
    let textField: UITextField={
        let text = UITextField()
        text.isEnabled=false
        text.translatesAutoresizingMaskIntoConstraints = false
        text.autocorrectionType = .no
        text.returnKeyType = .done
        return text
    }()
    let editButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Edit.png"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func refactorTextField(){
        textField.attributedText=nil
        textField.text = regularText
        textField.isEnabled=true
        textField.becomeFirstResponder()
        editButton.isHidden = true
    }
    
    func setupLayout(){
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 22),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -50),
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textField.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            editButton.heightAnchor.constraint(equalToConstant: 24),
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            editButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13)
        ])
    }
    
    
    func boldAndRegular()->NSAttributedString{
        let boldAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0)]
        let regularAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)]
        let boldText = NSAttributedString(string: boldText+": ", attributes: boldAttribute)
        let regularText = NSAttributedString(string: regularText , attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        return newString
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField){
        if let newText=textField.text{
            defaults.set( newText, forKey: boldText )
            regularText = newText
        }
        else{regularText = ""}
        textField.isEnabled=false
        editButton.isHidden = false
        setupTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}



