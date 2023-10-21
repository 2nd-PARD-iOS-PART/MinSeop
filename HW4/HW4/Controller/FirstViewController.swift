//
//  FirstViewController.swift
//  HW4
//
//  Created by 김민섭 on 2023/10/06.
//

import UIKit

class FirstViewController: UIViewController {
    let sectionTitles: [String] = ["Previews","Continue Watching for MinSeop Kim", "My List", "Europe movie", "Romance/Drama", "Action/Thriller"]

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)

        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        configureNavbar()

        let headerView = MediaViewCell(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }

    private func configureNavbar() {
        var image = UIImage(named: "netflixImage")
        image = image?.withRenderingMode(.alwaysOriginal)
        let logo = UIBarButtonItem(image: image, style: .done, target: self, action: nil)

        let item1 = UIBarButtonItem(title: "TV Shows", style: .plain, target: self, action: #selector(barButtonPressed))
        let item2 = UIBarButtonItem(title: "Movie", style: .plain, target: self, action: #selector(barButtonPressed))
        let item3 = UIBarButtonItem(title: "My List", style: .plain, target: self, action: #selector(barButtonPressed))

        item1.tintColor = UIColor.white
        item2.tintColor = UIColor.white
        item3.tintColor = UIColor.white


        navigationItem.leftBarButtonItems = [logo, item1, item2, item3]
    }

    @objc private func barButtonPressed() {
        // 네비게이션 바 버튼 클릭 시 동작을 추가할 수 있습니다.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            print("Failed to dequeue CollectionViewTableViewCell")
            return UITableViewCell()
        }

        if indexPath.section < MovieData.MovieModelData.count {
            let data = MovieData.MovieModelData[indexPath.section] // 수정된 부분
            //cell.configure(with: data)
        }

        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            
        case 0:
            return 180
        
        case 1:
            return 250
        
        default:
            return 200
        }
    }
}
