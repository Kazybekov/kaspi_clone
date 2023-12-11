//
//  TransactionCell.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 24.11.2023.
//

import Foundation
import UIKit

class TransactionCell: UITableViewCell  {
    
    static let identifier = "transactionCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        setupView()
    }
    
    func setupCellData(data: TransferData){
        
        transferAmount.text = getStringFromFloat(float:data.money)
        nameTitle.text = data.receiverName
        
        if let message = data.message{
            messageLabel.isHidden = false
            messageLabel.text = message
            messageLabel.widthAnchor.constraint(equalToConstant: messageLabel.intrinsicContentSize.width+30).isActive = true
        }else{
            messageLabel.isHidden = true
        }
        
        guard let date = data.date else{
            print("no date")
            return
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let monthString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "d"
        let dayOfMonth = dateFormatter.string(from: date)
        
        dateLabel.text = dayOfMonth + " " + monthString
        
    }
    
    func getStringFromFloat(float:Float)->String{
        let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 2
                formatter.decimalSeparator = ","
                formatter.groupingSeparator = " "

                let number = NSNumber(value: float)
                let formattedValue = formatter.string(from: number)!
        
        return formattedValue + " ₸"
    }
    
    func setupView(){
        self.addSubview(dateLabel)
        mainView.addSubview(avatarView)
        mainView.addSubview(kaspiGoldTitle)
        mainView.addSubview(arrow)
        mainView.addSubview(nameTitle)
        mainView.addSubview(transferAmount)
        mainView.addSubview(smallLabel)
        mainView.addSubview(messageLabel)
        self.addSubview(mainView)
        setupUI()
    }
    
    let transferAmount:UILabel = {
        let label = UILabel()
        label.text = "1 123,45 ₸"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let smallLabel:UILabel = {
        let label = UILabel()
        label.text = "Клиенту Kaspi"
        label.textColor = UIColor(red: 0.565, green: 0.565, blue: 0.565, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nameTitle:UILabel = {
        let label = UILabel()
        label.text = "Аскар К."
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let arrow: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "rigthArrow")
        
            
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    let kaspiGoldTitle:UILabel = {
        let label = UILabel()
        label.text = "Kaspi Gold"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let avatarView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Icon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.text = "15 декабря"
        label.textColor = UIColor(red: 0.565, green: 0.565, blue: 0.565, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let messageLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.backgroundColor = UIColor(red: 0.565, green: 0.565, blue: 0.565, alpha: 1)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.preferredMaxLayoutWidth = 199.0
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: smallLabel.centerYAnchor),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
            
        ])
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 88)
        ])
        
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            avatarView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 40),
            avatarView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            kaspiGoldTitle.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            kaspiGoldTitle.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 12),
            
        ])
        
        NSLayoutConstraint.activate([
            arrow.topAnchor.constraint(equalTo: kaspiGoldTitle.bottomAnchor, constant: 2),
            arrow.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 12),
            arrow.widthAnchor.constraint(equalToConstant: 24),
            arrow.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: kaspiGoldTitle.bottomAnchor, constant: 4),
            nameTitle.leftAnchor.constraint(equalTo: arrow.rightAnchor, constant: 6),
            
        ])
        
        NSLayoutConstraint.activate([
            transferAmount.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            transferAmount.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -16)
            
        ])
        
        NSLayoutConstraint.activate([
            smallLabel.topAnchor.constraint(equalTo: arrow.bottomAnchor, constant: 2),
            smallLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 12)
        ])
    }
    
}
