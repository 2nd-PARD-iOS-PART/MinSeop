//
//  SecondViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit
import AVFoundation
import AVKit

class SecondViewController: UIViewController {
    
    private var movieData: [MovieData] = []
    var selectedMovie: MovieData?
    
    private let SearchTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieData = MovieData.MovieModelData
        configureSearchController()
        setupUI()
    }

    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a show, movie, genre, etc"
        searchController.searchBar.searchTextField.backgroundColor = UIColor.clear
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular)
        searchController.searchBar.setImage(UIImage(systemName: "mic.fill", withConfiguration: imageConfig), for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true
        title = "Search"
    }

    func setupUI() {
        makeSearchBar()
        view.addSubview(SearchTable)
        SearchTable.delegate = self
        SearchTable.dataSource = self
        setHeader()
        setTableView()
    }
    
    func setHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let h_label = UILabel(frame: header.bounds)
        h_label.text = "Popular Searches"
        h_label.textAlignment = .left
        h_label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        header.addSubview(h_label)
        SearchTable.tableHeaderView = header
    }

    func setTableView() {
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
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = UIColor.gray
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .regular)
        let mic = UIBarButtonItem(image: UIImage(systemName: "mic.fill", withConfiguration: imageConfig), style: .plain, target: self, action: nil)
        mic.tintColor = .white
        navigationItem.rightBarButtonItem = mic
        navigationItem.titleView = searchBar
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let movie = movieData[indexPath.row]

        cell.textLabel?.text = movie.title
        cell.imageView?.image = UIImage(named: movie.image)

        // 셀을 커스텀하고 버튼을 오른쪽 중앙에 추가
        let playButton = UIButton(type: .system)
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal) // 버튼에 재생 아이콘 설정
        playButton.tintColor = .white // 버튼 아이콘 색상 설정
        playButton.frame = CGRect(x: cell.contentView.frame.width - 40, y: cell.contentView.frame.height / 2 - 15, width: 30, height: 30) // 버튼 프레임 설정
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside) // 버튼이 탭되었을 때 실행할 액션 설정
        cell.contentView.addSubview(playButton) // 셀의 컨텐츠 뷰에 버튼 추가

        return cell // 생성한 셀 반환
    }
    
    // 셀의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160 // 셀의 높이 설정
    }

    // 헤더의 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // 헤더의 높이 설정
    }

    @objc func playButtonTapped(sender: UIButton) {
        
    }

}

