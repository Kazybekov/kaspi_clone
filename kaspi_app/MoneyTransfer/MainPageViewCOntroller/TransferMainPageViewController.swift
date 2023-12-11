////
////  mainPageViewController.swift
////  kaspi_app
////
////  Created by Yersin Kazybekov on 30.10.2023.
////
//
//import UIKit
//
//class TransferMainPageViewController: UIViewController {
//
//
//
//    let transactionPresenter: TransactionPresenter = TransactionPresenter()
//
//    lazy var TransferVC=TransferViewController(presenter: transactionPresenter)
//
//  //  lazy var HistoryVC = HistoryViewController(presenter: transactionPresenter)
//
//
//
//    func configureTopNavigation(){
//        //navigationItem.titleView = segmentedControl
//
//        //self.navigationItem.title="Kaspi Perevody"
//        self.navigationController?.navigationBar.topItem?.title="Kaspi Perevody"
//        self.navigationController?.navigationBar.tintColor = .red
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.navigationBar.backgroundColor = .white
////        let backButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(backButtonTapped))
////        navigationItem.leftBarButtonItem = backButton
//    }
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
//
//        configureTopNavigation()
//        view.backgroundColor = .white
//        //view.addSubview(segmentedControl)
//
////
////
////        addChild(HistoryVC)
////
////        view.addSubview(HistoryVC.view)
////        HistoryVC.view.isHidden = true
////
////
////        setupLauouts()
//        //HistoryVC.didMove(toParent: self)
//    }
////    private let segmentedControl: UISegmentedControl = {
////        let control = UISegmentedControl()
////        control.insertSegment(withTitle: "МОИ ПЕРЕВОДЫ", at: 0, animated: true)
////        control.insertSegment(withTitle: "ИСТОРИЯ", at: 1, animated: true)
////        control.selectedSegmentIndex = 0
////        control.translatesAutoresizingMaskIntoConstraints = false
////        control.tintColor = .green
////        return control
////    }()
//
//    func setupLauouts(){
//
//    }
//
////    Sets the action for the segment at the index you specify.
//    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
//
//        HistoryVC.view.isHidden = true
//
//    }
//
//    func displayContentController(content: UIViewController) {
//        addChild(content)
//        content.view.frame = view.bounds
//        view.addSubview(content.view)
//        content.didMove(toParent: self)
//    }
//
//    func hideContentController(content: UIViewController) {
//        content.willMove(toParent: nil)
//        content.view.removeFromSuperview()
//        content.removeFromParent()
//    }
//
//}
