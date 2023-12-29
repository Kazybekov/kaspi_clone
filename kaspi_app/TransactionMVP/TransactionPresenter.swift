//
//  TransactionPresenter.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 28.11.2023.
//

import Foundation
import UIKit
import CoreData


protocol TransactionProtocol{
    func addNewTransaction(data: TransactionData)
    
    func getUserMoney()->String
    
    func isEnoughMoney(for needed:Float)->Bool
}

protocol HistoryProtocol{
    func getTransactionDataArrayCount()->Int

    func getTransactionData(at index: Int)->TransferData?
    
    func searchTransaction(data: String)
    
    func filterByDate(dateOne:Date?,dateTwo:Date?)
}


class TransactionPresenter{
    
    let defaults = UserDefaults()
    
    var transferItem = [TransferData]()
    
    var moc:NSManagedObjectContext!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var user = UserModel(userMoney: defaults.float(forKey: "userMoney"))
  
    init(){
        moc = appDelegate?.persistentContainer.viewContext
        loadData()
        
    }
    
    func addToDatabase(data: TransactionData) {
     
      let transferItem = TransferData(context: moc)
      
        transferItem.id = data.id
        transferItem.date = Date()
        transferItem.receiverName = data.receiverName
        transferItem.money = data.money
        
        if let message = data.message {
            transferItem.message = message
        }
      
      appDelegate?.saveContext()
            
    }
    
    func loadData(){
       
       let request:NSFetchRequest<TransferData> = TransferData.fetchRequest()
            
       do {
           try transferItem = moc.fetch(request)
       }catch {
           print("Could not load data")
       }
        
    }
    

    
}

extension TransactionPresenter : TransactionProtocol{
    
    func isEnoughMoney(for needed: Float) -> Bool {
        if(user.money>=needed){
            defaults.set(user.money-needed, forKey: "userMoney")
            user.money=user.money-needed
            return true
        }
        return false
    }
    
    func getUserMoney() -> String {
        return getStringFromFloat(float: user.money)
    }
    
    func addNewTransaction(data: TransactionData) {
        addToDatabase(data:data)
        loadData()
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
}

extension TransactionPresenter : HistoryProtocol{
   
    
    func filterByDate(dateOne: Date?, dateTwo: Date?) {
        loadData()
        guard let one = dateOne, let two = dateTwo else{return}
       
        transferItem=transferItem.filter{ $0.date!>=one && $0.date!<=two}
        
    }
    
    func searchTransaction(data: String) {
        if(data==""){
            loadData()
            return
        }
        transferItem=transferItem.filter{ $0.receiverName!.contains(data)||String($0.money).contains(data)}
    }
    
    func getTransactionData(at index: Int) -> TransferData? {
        
        if(index>=transferItem.count){
            return nil
        }
        return transferItem[index]
    }
    
    
    func getTransactionDataArrayCount()-> Int{
        return transferItem.count
    }
    
}
