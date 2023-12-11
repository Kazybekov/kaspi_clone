//
//  CalendarView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 27.11.2023.
//

import Foundation
import UIKit

class CalendarView: UIView {
    
    init(){
        super.init(frame: .zero)
        
        setupCalendarView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let dateOne: UITextField = {
        let label = UITextField()
        label.text = "9 декабря -"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isEnabled=false
        return label
    }()
    
    
    let dateTwo: UITextField = {
        let label = UITextField()
        label.isEnabled=false
        label.text = "16 декабря"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    func setupCalendarView(){
        self.addSubview(calendarButton)
        self.addSubview(dateOne)
        
        self.addSubview(dateTwo)
        
        NSLayoutConstraint.activate([
            dateOne.topAnchor.constraint(equalTo: calendarButton.topAnchor),
            dateOne.bottomAnchor.constraint(equalTo: calendarButton.bottomAnchor),
            dateOne.leftAnchor.constraint(equalTo: calendarButton.rightAnchor, constant: 16),
            self.heightAnchor.constraint(equalToConstant: 56)
            
        ])
        
        NSLayoutConstraint.activate([
            dateTwo.topAnchor.constraint(equalTo: calendarButton.topAnchor),
            dateTwo.bottomAnchor.constraint(equalTo: calendarButton.bottomAnchor),
            dateTwo.leftAnchor.constraint(equalTo: dateOne.rightAnchor    , constant: 1),
            self.heightAnchor.constraint(equalToConstant: 56)
            
        ])
        
        
        
        NSLayoutConstraint.activate([
            calendarButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            calendarButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        ])
        
    }
    
    
}
