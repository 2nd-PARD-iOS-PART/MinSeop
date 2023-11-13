//
//  FourthViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit
import RealmSwift

class FourthViewController: UIViewController {

    var realm: Realm! // Realm 데이터베이스를 인스턴스 변수로 이동
    var movies: Results<Movie>! // Movie 객체들을 가져옴
    var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureRealm()
        print(Realm.Configuration.defaultConfiguration.fileURL) // 데이터를 확인하기 위한 것

        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MovieCell") // 셀 등록
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name("ReloadData"), object: nil)

        reloadData()
    }

    @objc func reloadData() {
        movies = realm.objects(Movie.self)
        tableView.reloadData()

        if movies.count == 0 {
            makeUi()
            configureNavbar()
            tableView.isHidden = true
        } else {
            view.addSubview(tableView)
            tableView.isHidden = false
            configureNavbar()
        }
    }
    
    private func configureRealm() {
           realm = try! Realm()
           movies = realm.objects(Movie.self)
    }


    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Find Something to Download", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(FindSomethingtoDownloadbuttonPressed), for: .touchUpInside)
        return button
    }()
    
    private func configureNavbar() {
        let downloadButton = UIBarButtonItem(title: "Download", style: .plain, target: self, action: #selector(DownloadButtonPressed))
        downloadButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = downloadButton

        let trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashButtonPressed))
        trashButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = trashButton
    }

    func makeUi() {
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 280),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60)
        ])
    
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movies and TV shows that you\ndownload appear here."
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .center
        
        view.addSubview(label)
        
        let imageView = UIImageView(image: UIImage(named: "Image"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 474),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            imageView.topAnchor.constraint(equalTo: label.topAnchor, constant: -250), // 이미지 뷰를 레이블 아래로 이동
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110)
        ])

    }
    
    
    @objc func FindSomethingtoDownloadbuttonPressed(){
        let addMovieVC = DownloadsViewController()
        let navController = UINavigationController(rootViewController: addMovieVC)
        self.present(navController, animated: true, completion: nil)
    }

    @objc func buttonPressed(){
        
    }
    
    @objc func DownloadButtonPressed() {
        
    }
    @objc func trashButtonPressed() {
        
    }
}

extension FourthViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.descriptionText // 추가: Movie 객체의 설명을 셀의 서브 타이틀에 표시
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FourthViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
    }
}
