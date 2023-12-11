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
        let nvc = createNavigationCont(title: "Transfer",image: UIImage(systemName: "doc.richtext"),tag:1,vc:TransferViewController(presenter: transactionPresenter) )
        
        let nvc2 = createNavigationCont(title: "History", image: UIImage(systemName: "doc.richtext"), tag: 0 , vc: HistoryViewController(presenter: transactionPresenter))
        
        let nvc3 = createNavigationCont(title: "Profile", image: UIImage(systemName: "doc.richtext"), tag: 2 , vc: ProfileViewController())
        
        let nvc4 = createNavigationCont(title: "Profile", image: UIImage(systemName: "doc.richtext"), tag: 3 , vc: ParentViewController())
        
        
        self.viewControllers=[nvc2,nvc,nvc3,nvc4]
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
