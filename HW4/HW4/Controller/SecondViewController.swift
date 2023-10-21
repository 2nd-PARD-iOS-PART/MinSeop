//
//  SecondViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let SearchTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        // UISearchController 설정
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a show, movie, genre, etc"
        searchController.searchBar.searchTextField.backgroundColor = UIColor.clear

        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .regular)
        searchController.searchBar.setImage(UIImage(systemName: "mic.fill", withConfiguration: imageConfig), for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true

        // Navigation title 설정
        title = "Search"
        
        // Search Bar를 만드는 함수 호출
        makeSearchBar()

        view.addSubview(SearchTable)
        SearchTable.delegate = self
        SearchTable.dataSource = self

        setHeader()
        setTableView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SearchTable.frame = view.bounds
    }

    //Header 라벨 표시하기
    func setHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let h_label = UILabel(frame: header.bounds)
        h_label.text = "Poplular Searches"
        h_label.textAlignment = .left
        h_label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.addSubview(h_label)

        SearchTable.tableHeaderView = header
    }

    let leftImageView: UIImageView = {
      let image = UIImageView()
      image.contentMode = .scaleToFill
      image.clipsToBounds = true
      return image
    }()
    
    func configuration(with image: UIImage, name: String){
      leftImageView.image = image
    }
    
    func setTableView() {
        // 위치 설정
        
        SearchTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            SearchTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            SearchTable.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            SearchTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            SearchTable.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    func makeSearchBar() {
        searchBar.placeholder = "Search for a show, movie, genre, etc"
        
        // Search Bar 스타일을 minimal로 설정하고 배경색을 회색으로 변경
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = UIColor.gray
        
        // Search Bar 마이크 모양 설정
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .regular)
        let mic = UIBarButtonItem(image: UIImage(systemName: "mic.fill", withConfiguration: imageConfig), style: .plain, target: self, action: nil)
        mic.tintColor = .white

        // navigationItem으로 searchBar, mic 할당
        navigationItem.rightBarButtonItem = mic
        navigationItem.titleView = searchBar
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // 셀에 텍스트 설정
        cell.textLabel?.text = "Dark"
        
        
        // 셀을 커스텀하고 버튼을 오른쪽 중앙에 추가
        let playButton = UIButton(type: .system)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.tintColor = .white
        playButton.frame = CGRect(x: cell.contentView.frame.width - 40, y: cell.contentView.frame.height / 2 - 15, width: 30, height: 30)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        cell.contentView.addSubview(playButton)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    @objc func playButtonTapped() {
        // 버튼을 탭했을 때 실행할 동작을 여기에 추가
        print("Play button tapped")
    }
}
