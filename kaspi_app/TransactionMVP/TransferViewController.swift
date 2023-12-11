//
//  TransferViewController.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 11.11.2023.
//

import Foundation
import UIKit
import ContactsUI


class TransferViewController: UIViewController{
    
    let presenter: TransactionProtocol

    init(presenter: TransactionProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let defaults = UserDefaults()
    private let contactPicker = CNContactPickerViewController()
    
    // MARK: Navigation Controller
    func configureTopNavigation(){
        let label : UILabel = {
            let label = UILabel()
            label.text = "Клиенту Kaspi"
            
            return label
        }()
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        
        navigationItem.titleView = label
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .white
    }
    @objc func backButtonTapped(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cashViewTitle.delegate = self
        
        view.backgroundColor = .white
        configureTopNavigation()
        setupLayouts()
        addViewsToStackView()
        view.addSubview(scrollView)
        scrollView.frame = view.frame
        scrollView.addSubview(stackView)
        SetupStackView()
        
        updateDepositMoney()
        
    }
    func addViewsToStackView(){
        stackView.addArrangedSubview(whiteSpaceViewInTop)
        stackView.setCustomSpacing(0, after: whiteSpaceViewInTop)
        stackView.addArrangedSubview(depositView)
        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(contactView)
        stackView.addArrangedSubview(errorLabelRName)
        errorLabelRName.isHidden = true
        stackView.addArrangedSubview(popUpView)
        popUpView.isHidden = true
        stackView.addArrangedSubview(cashView)
        stackView.addArrangedSubview(errorLabelMoney)
        errorLabelMoney.isHidden = true
        stackView.addArrangedSubview(transferViewBottom)
        stackView.addArrangedSubview(transferButtonView)
    }
    
    func setupLayouts(){
        setupCashView()
        setupContactView()
        setupSegmentedControlView()
        setupPopUpview()
        setupTransferButton()
    }
    
    func updateDepositMoney(){
        depositView.DepositViewNumber.text = presenter.getUserMoney()
    }
    
    var rName:String? = nil
    var rMoney:Float? = nil
    
    func errorNotEnoughMoney(){
        DispatchQueue.main.async {
            self.cashView.layer.borderWidth = 1
            self.cashView.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        }
        errorLabelMoney.text = "Not enough money"
        errorLabelMoney.isHidden = false
    }
    
    func errorNoReceiverName(){
        DispatchQueue.main.async {
            self.contactView.layer.borderWidth = 1
            self.contactView.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        }
        errorLabelRName.isHidden = false
    }
    func errorNoMoneyamount(){
        DispatchQueue.main.async {
            self.cashView.layer.borderWidth = 1
            self.cashView.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        }
        errorLabelMoney.text = "No transfer amount"
        errorLabelMoney.isHidden = false
    }
    
    
    @objc func transferMoney(){
        guard let r=rName,let m=rMoney else{
            if rName==nil {
               errorNoReceiverName()
            }; if rMoney==nil{
                errorNoMoneyamount()
            }; return }
        
        if !presenter.isEnoughMoney(for: m){
            errorNotEnoughMoney()
            return
        }
        presenter.addNewTransaction(data: TransactionData(id: UUID(), date: Date(), receiverName: r, money: m, message: transferViewBottom.messageTextField.text))
        
        
        DispatchQueue.main.async {
            self.cashViewTitle.text = "0 ₸"
            
            self.transferButton.setTitle("Перевести 0 ₸", for: .normal)
            
            self.stackView.arrangedSubviews[5].isHidden = true
            
            self.stackView.setCustomSpacing(20, after: self.contactView)
            
            self.numberField.text = ""
        }
        updateDepositMoney()
        rName=nil
        rMoney=nil
    }
    
    //MARK: transferViewBottom
    let transferViewBottom: TransferViewBottom = {
        let view = TransferViewBottom()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    //MARK: scrollView
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.isScrollEnabled = true
        scroll.bounces = true
        return scroll
    }()
    //MARK: depositView
    let depositView: DepositView = {
       let view = DepositView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.heightAnchor.constraint(equalToConstant: 76).isActive = true
        view.backgroundColor = .white
       return view
    }()
    
    //MARK: Stack view
    var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    let whiteSpaceViewInTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        return view
    }()
    
    // MARK: Segmented controller
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.insertSegment(withTitle: "Телефон", at: 0, animated: true)
        control.insertSegment(withTitle: "Kарта", at: 1, animated: true)
        control.insertSegment(withTitle: "Каспи QR", at: 2, animated: true)
        control.setImage(UIImage.textEmbededImage(
            image: UIImage(named:  "qr")!,
            string: "Каспи QR",
            color: .red
        ),
        forSegmentAt: 2)
        control.selectedSegmentIndex = 0
        return control
    }()
    // MARK: ContactView Search user
    let contactView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 76).isActive = true
        view.backgroundColor = .white
        return view
    }()
    let contactButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "contacts"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    let numberField: UITextField = {
        let field = UITextField()
        field.placeholder = "Телефон получателя"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.keyboardType = .phonePad
        return field
    }()
    
    @objc func searchContact(){
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    // MARK: errror message
    
    let errorLabelMoney: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        label.text = "Not enough Money"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    
    let errorLabelRName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 12).isActive = true
        label.text = "No receiver data"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .red
        return label
    }()
    
    
    // MARK: pop up view

    let popUpView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.heightAnchor.constraint(equalToConstant: 76).isActive = true
        view.backgroundColor = UIColor(red: 0.82, green: 0.671, blue: 0.427, alpha: 1)
        return view
    }()
    let nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18)
        view.text = nil
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    let infoLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12)
        view.text = "Деньги поступят на карту Kaspi Gold"
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    let transferButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Перевести 0 ₸", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.537, blue: 0.82, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let transferButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.heightAnchor.constraint(equalToConstant: 72).isActive = true
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: CashView
    let cashView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints=false
        view.heightAnchor.constraint(equalToConstant: 76).isActive = true
        view.backgroundColor = .white
        return view
    }()
    let cashViewTitle: UITextField = {
        let view = UITextField()
        view.text = "0 ₸"
        view.keyboardType = .numberPad
        view.clearsOnBeginEditing = true
        view.font = UIFont.systemFont(ofSize: 32)
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    
}


extension TransferViewController:UITextFieldDelegate{
    internal func textFieldDidEndEditing(_ textField: UITextField){
        guard let money = textField.text else{return}
        if money==""{
            DispatchQueue.main.async {
                self.transferButton.setTitle("Перевести 0 ₸", for: .normal)
                textField.text = "0 ₸"
            }
        }else{
            DispatchQueue.main.async {
                self.errorLabelMoney.isHidden = true
                self.transferButton.setTitle("Перевести " + money + " ₸", for: .normal)
                self.rMoney = Float(money)
                textField.text = money + " ₸"
                self.cashView.layer.borderWidth = 0
            }
        }
    }
}

