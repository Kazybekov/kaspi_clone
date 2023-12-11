//
//  SearchBarView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 27.11.2023.
//

import Foundation
import UIKit

class SearchBarView: UIView {
    
    init(){
        super.init(frame: .zero)
        
        setupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.backgroundColor = .white
        search.placeholder = "Имя, сумма, сообщение"
        search.layer.borderWidth = 1
        search.layer.borderColor = CGColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1)
        search.setImage(UIImage(named: "search"), for: .search, state: .normal)
        return search
    }()
    
    func setupSearchBar(){
        self.addSubview(searchBar)
        
        let searchField = searchBar.value(forKey: "searchField") as? UITextField
            if let field = searchField {
                field.backgroundColor = .white
                field.layer.cornerRadius = 15.0
                field.textColor = .white
                field.tintColor = .white
                field.layer.masksToBounds = true
                field.returnKeyType = .search
            }
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            searchBar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            searchBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
        ])
        
        
        
    }
    
}
