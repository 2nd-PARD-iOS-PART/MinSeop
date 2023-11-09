//
//  DownloadsViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/11/09.
//

import UIKit
import Photos

class DownloadsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DownloadsViewController Loaded")
        addMovie()
        view.backgroundColor = .green
    }
    
    @objc func addMovie() {
        let alertController = UIAlertController(title: "영화 추가", message: "영화 정보를 입력해주세요", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "영화 제목"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "영화 줄거리 설명"
        }
        
        let selectPosterAction = UIAlertAction(title: "포스터 선택", style: .default, handler: { (action) in
            self.openPhotoLibrary()
        })
        
        let saveAction = UIAlertAction(title: "저장", style: .default) { (action) in
            guard let title = alertController.textFields?[0].text,
                  let description = alertController.textFields?[1].text,
                  let poster = self.selectedImage else {
                return
            }
            
            // 저장 로직 구현
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(selectPosterAction)
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func openPhotoLibrary() {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            default:
                return
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            self.selectedImage = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

