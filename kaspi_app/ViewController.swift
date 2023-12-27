//
//  ViewController.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 06.12.2023.
//

import UIKit

@available(iOS 16.0, *)
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        self.tabBar.tintColor = .red
        // Do any additional setup after loading the view.
    }
    
    func createNavigationCont( title:String,image: UIImage?,tag: Int,vc:UIViewController )->UINavigationController{
        let nvc = UINavigationController(rootViewController: vc)
        nvc.title = title
        nvc.tabBarItem = UITabBarItem(title: title, image:image , tag: tag)
        return nvc
    }
    
    func setupTabs(){
        
        let transactionPresenter = TransactionPresenter()
        let vcc = UIViewController()
        SwiftUIView().injectIn(controller: vcc)
        vcc.view.backgroundColor = .white
        let mainpage = createNavigationCont(title: "Главная",image: UIImage(named: "myBankButton"),tag:0,vc:vcc)
        
        let nvc = createNavigationCont(title: "Переводы",image: UIImage(named: "transferButton"),tag:2,vc:TransferViewController(presenter: transactionPresenter) )
        
        let nvc2 = createNavigationCont(title: "История", image: UIImage(named: "historyButton"), tag: 1 , vc: HistoryViewController(presenter: transactionPresenter))
        
        let nvc3 = createNavigationCont(title: "Профиль", image: UIImage(named: "myBankButton"), tag: 3 , vc: ProfileViewController())
        
        
        
        self.viewControllers=[mainpage,nvc2,nvc,nvc3]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
