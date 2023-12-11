//
//  HistoryViewController.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 23.11.2023.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController {
    
    let presenter: HistoryProtocol
    init(presenter: HistoryProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backButtonTapped() {
            navigationController?.popViewController(animated: true)
        }
    
    func configureTopNavigation(){
        let label : UILabel = {
            let label = UILabel()
            label.text = "History"
            
            return label
        }()
        
        navigationItem.titleView = label
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .white
        let backButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    // MARK: view did load
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        
    }
    func viewSetup(){
        tableView.dataSource = self
        tableView.delegate = self
        searchBarView.searchBar.delegate = self
        configureTopNavigation()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(segmentedControl)
        view.addSubview(searchBarView)
        view.addSubview(calendarView)
        view.addSubview(datePicker)
        datePicker.isHidden = true
        setupLayout()
        setupTableView()
        calendarView.calendarButton.addTarget(self, action: #selector(changeDate), for: .touchUpInside)
        
        
        
    }
    // date picker
    @objc func changeDate(){
        datePicker.isHidden = false
        calendarView.dateOne.backgroundColor = .systemRed
    }
    let datePicker: UIDatePicker = {
        
        let picker = UIDatePicker()
        picker.calendar = Calendar(identifier: .gregorian)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.preferredDatePickerStyle = .inline
        picker.datePickerMode = .date
        picker.maximumDate = Date()
        picker.backgroundColor = .white
        picker.clipsToBounds = true
        picker.layer.borderWidth = 1
        picker.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        picker.layer.cornerRadius = 10
        picker.addTarget(self, action: #selector(onDateValueChanged(_:)), for: .valueChanged)
        
        return picker
        }()
    
    var isDateOne = true
    var dateOne:Date? 
    var dateTwo:Date?

     @objc private func onDateValueChanged(_ datePicker: UIDatePicker) {
         let date = datePicker.date
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "LLLL"
         let monthString = dateFormatter.string(from: date)
         dateFormatter.dateFormat = "d"
         let dayOfMonth = dateFormatter.string(from: date)
         if(isDateOne){
             calendarView.dateOne.backgroundColor = .clear
             calendarView.dateTwo.backgroundColor = .systemRed

             dateOne = date
             calendarView.dateOne.text = dayOfMonth + " " + monthString + " - "
             datePicker.minimumDate = date
             isDateOne=false
         }else{
             dateTwo = date
             calendarView.dateTwo.backgroundColor = .clear
             calendarView.dateTwo.text = dayOfMonth + " " + monthString
             datePicker.minimumDate = nil
             isDateOne=true
             datePicker.isHidden = true
             presenter.filterByDate(dateOne: dateOne, dateTwo: dateTwo)
             tableView.reloadData()
         }
    }
    
    //MARK: Calendar
    let calendarView: CalendarView = {
            let view = CalendarView()
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.dateOne.text = " - "
        view.dateOne.layer.cornerRadius = 5
        view.dateTwo.layer.cornerRadius = 5
            return view
    }()

    //MARK: UIsearchBar
    let searchBarView: SearchBarView = {
        let view = SearchBarView()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        var textFieldInsideSearchBar = view.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .black
        return view
    }()
    
    //MARK: segmented control
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.insertSegment(withTitle: "МОИ ПЕРЕВОДЫ", at: 0, animated: true)
        control.insertSegment(withTitle: "ИСТОРИЯ", at: 1, animated: true)
        control.selectedSegmentIndex = 1
        control.translatesAutoresizingMaskIntoConstraints = false
        control.tintColor = .green
        return control
    }()

    
    //MARK: tableView
    func setupTableView(){
        tableView.separatorStyle = .none
        tableView.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.identifier)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.reloadData()
    }
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.allowsSelection = false
        return view
    }()
    
    // MARK: layout calendar searchbar segmented
    func setupLayout(){
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: calendarView.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            calendarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            calendarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            calendarView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor),
            calendarView.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        NSLayoutConstraint.activate([
            searchBarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchBarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            searchBarView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            searchBarView.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        segmentedControl.backgroundColor = .white
        segmentedControl.selectedSegmentTintColor = UIColor(red: 0.93, green: 0.29, blue: 0.24, alpha: 1)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = CGColor(red: 0.93, green: 0.29, blue: 0.24, alpha: 1)
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for:.normal)
        let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 6),
            segmentedControl.heightAnchor.constraint(equalToConstant: 34),
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 8),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -9)
        ])
    }
}

@available(iOS 16.0, *)
extension HistoryViewController:UISearchBarDelegate{
    
    func searchBar(_: UISearchBar, textDidChange: String){
        presenter.searchTransaction(data: textDidChange)
        tableView.reloadData()
    }
    
}
// MARK: cell size


extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
}
// MARK: table view delegate


extension HistoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getTransactionDataArrayCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        if let safeData=presenter.getTransactionData(at: presenter.getTransactionDataArrayCount()-1-indexPath.row){
            cell.setupCellData(data:safeData )
        }
        
        return cell
    }
}






