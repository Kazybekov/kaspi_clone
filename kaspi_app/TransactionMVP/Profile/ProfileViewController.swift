//
//  ViewController.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 28.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
//MARK: Init
    
    let defaults = UserDefaults()
    var networkingService: NetworkingService = SecondNetworkingService()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargetsForButtons()
        configureTopNavigation()
        setupViews()
        setAvatarImage()
        setupLayout()
        networkingService.delegate = self
    }
    
//MARK: Setup methods
    
    private func setupViews(){
        view.backgroundColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        avatarBackView.addSubview(avatarImageView)
        avatarBackView.addSubview(cameraButton)
        avatarBackView.addSubview(randomButton)
        view.addSubview(avatarBackView)
        view.addSubview(nameView)
        view.addSubview(surnameView)
    }
        
    private func setupTargetsForButtons(){
        randomButton.addTarget(self, action: #selector(setRandomAvatar), for: .touchUpInside)
        cameraButton.addTarget(self, action: #selector(setImage), for: .touchUpInside)
    }
    
    func configureTopNavigation(){
        navigationItem.title="Profile"
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.topItem?.title=""
        self.navigationController?.navigationBar.tintColor = .red
        self.navigationController?.navigationBar.isTranslucent = true
        let label : UILabel = {
            let label = UILabel()
            label.text = "Profile"
            
            return label
        }()
        
        navigationItem.titleView = label
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func backButtonTapped(){
        
    }
//MARK: Private methods
    
    func setAvatarImage(){
        var avatarImage = UIImage(named: "avatar.jpg")!
        if let imageData = defaults.object(forKey: "avatarPhoto") as? Data,
                let image = UIImage(data: imageData) {
                    avatarImage = image
                }
        updateAvatar(image:avatarImage)
    }
    
    func updateAvatar(image: UIImage?) {
        if let safeImage=image{
            if let pngRepresentation = safeImage.pngData() {
                defaults.set(pngRepresentation, forKey: "avatarPhoto")
            }
            DispatchQueue.main.async {
                self.avatarImageView.image = safeImage
            }
        }
    }
    
//MARK: Actions
    
    @objc func setRandomAvatar(){
        networkingService.loadRandomPhoto { data, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            if let pngRepresentation = image.pngData() {
                self.defaults.set(pngRepresentation, forKey: "avatarPhoto")
            }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }
    
//MARK: UI Elements
    
    let randomButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .red
        button.setTitle("Random", for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cameraButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Camera.png"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        return button
    }()
    
    let avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()

    let avatarBackView: UIView =  {
        let view=UIView()
        view.backgroundColor = UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameView: CustomTextView = {
        let view=CustomTextView("Name")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let surnameView: CustomTextView = {
        let view=CustomTextView("Surname")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

}


//MARK: UIImagePickerViewDelegate

extension ProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @objc func setImage(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                imagePicker.delegate = self
                imagePicker.sourceType =  .savedPhotosAlbum
                imagePicker.allowsEditing = true
                present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        updateAvatar(image:image)
        dismiss(animated: true)
    }
    
}






