////
////  ContactFieldStackView.swift
////  kaspi_app
////
////  Created by Yersin Kazybekov on 16.11.2023.
////
//
import Foundation
import UIKit
import ContactsUI

//// MARK: contact pickerdelegate
extension TransferViewController: CNContactPickerDelegate {

    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let phoneNumberCount = contact.phoneNumbers.count
        let contactName = contact.givenName + " " + String(contact.familyName.prefix(1)) + "."

        guard phoneNumberCount > 0 else {
            dismiss(animated: true)
            //show pop up: "Selected contact does not have a number"
            return
        }

        if phoneNumberCount == 1 {
            //new view and add number
            //setNumberFromContact(contactNumber: contact.phoneNumbers[0].value.stringValue,contactName)
            self.setNumberFromContact(contactNumber: contact.phoneNumbers[0].value.stringValue,contactName)
            //dismiss(animated: true)

        } else {
            let alertController = UIAlertController(title: "Select one of the numbers", message: nil, preferredStyle: .alert)

            for i in 0...phoneNumberCount-1 {
                let phoneAction = UIAlertAction(title: contact.phoneNumbers[i].value.stringValue, style: .default, handler: {
                alert -> Void in
                    self.setNumberFromContact(contactNumber: contact.phoneNumbers[i].value.stringValue,contactName)
                })
                alertController.addAction(phoneAction)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: {
            alert -> Void in

            })
            alertController.addAction(cancelAction)

            dismiss(animated: true)
            self.present(alertController, animated: false, completion: nil)
        }
    }

    func setNumberFromContact(contactNumber: String,_ name:String) {
        
        DispatchQueue.main.async {
            self.errorLabelRName.isHidden = true
            self.numberField.text = String(contactNumber)
            self.nameLabel.text = name
            self.rName = name
            
            UIView.animate(withDuration: 0.5, animations: {
                self.popUpView.isHidden = false
            })
            self.stackView.setCustomSpacing(0, after: self.contactView)
            
            self.contactView.layer.borderWidth = 0
        }
        
    }

    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {

    }
}

