//
//  DownloadsViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/11/09.
//

import UIKit
import RealmSwift

let realm = try! Realm()

class DownloadsViewController: UIViewController {
    var imageSelectButton: UIButton? // 이미지 선택 버튼을 클래스 수준 변수로 선언
    var titleTextField: UITextField!
    var descriptionTextField: UITextField!
    var movieImageView: UIImageView?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
        setupImagePicker()
    }
    
    func setupUI() {
        titleTextField = createTextField(placeholder: "영화 제목을 입력하시오.")
        descriptionTextField = createTextField(placeholder: "줄거리를 입력하시오.")
        imageSelectButton = createImageView() // 이미지 선택 버튼 초기화

        let submitButton = createSubmitButton()
        
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            descriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 40),
            
            imageSelectButton!.centerXAnchor.constraint(equalTo: view.centerXAnchor), // 이미지 선택 버튼 수정
            imageSelectButton!.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
            imageSelectButton!.widthAnchor.constraint(equalToConstant: 200),
            imageSelectButton!.heightAnchor.constraint(equalToConstant: 50),
            
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        ])
    }
    
    func setupImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
    }
    
    @objc func imageTapped() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func submitButtonPressed() {
        guard let title = titleTextField.text, let description = descriptionTextField.text, let image = movieImageView?.image else {
            return
        }

        // 데이터 확인.
        print("Title: \(title), Description: \(description)")

        let newMovie = Movie()
        newMovie.title = title
        newMovie.descriptionText = description
        newMovie.imageData = image.jpegData(compressionQuality: 1.0) // 이미지를 JPEG 형식의 Data로 변환

        try! realm.write {
            realm.add(newMovie)
        }

        self.dismiss(animated: true, completion: nil)

        // 데이터를 추가한 후에 FourthViewController를 새로 고칠 때 알림을 보냅니다.
        NotificationCenter.default.post(name: NSNotification.Name("ReloadData"), object: nil)
    }


}

extension DownloadsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if movieImageView == nil {
                movieImageView = UIImageView()
                movieImageView?.contentMode = .scaleAspectFit
                movieImageView?.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(movieImageView!)
                
                NSLayoutConstraint.activate([
                    movieImageView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    movieImageView!.topAnchor.constraint(equalTo: imageSelectButton!.bottomAnchor, constant: 20),
                    movieImageView!.widthAnchor.constraint(equalToConstant: 300), // 이미지뷰 크기 조절
                    movieImageView!.heightAnchor.constraint(equalToConstant: 300), // 이미지뷰 크기 조절
                ])
            }
            movieImageView?.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

extension DownloadsViewController {
    func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        let fontSize: CGFloat = 18
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)])
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        return textField
    }
    
    func createSubmitButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Download", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        view.addSubview(button)
        return button
    }
    
    func createImageView() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("이미지 선택", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }
}
