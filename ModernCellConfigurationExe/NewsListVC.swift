//
//  NewsListVC.swift
//  ModernCellConfigurationExe
//
//  Created by YEN-JU HUANG on 2024/9/11.
//

import UIKit

class NewsListVC: UIViewController {
    
    var tableView = UITableView()
    var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        news = fetchNews()
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        // set delegate
        setTableViewDelegate()
        // set row height
        tableView.rowHeight = 330
        
        // register cells
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        tableView.register(NewsCell_MCC.self, forCellReuseIdentifier: NewsCell_MCC.identifier)
        
        // set constraints
        tableView.pin(to: view)
    }
    
    private func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension NewsListVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // classic cell for custom cell in programming
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
         */
        // modern cell for custom cell upon iOS 14
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell_MCC.identifier, for: indexPath) as! NewsCell_MCC
        let a_news = news[indexPath.row]
        cell.set(news: a_news)
        
        return cell
    }
}

// MARK: - Dummy data
extension NewsListVC {
    func fetchNews() -> [News] {
        let news1 = News(image: Images.appleCard, title: Titles.appleCardTitle, source: "bbd")
        let news2 = News(image: Images.chtIphone16, title: Titles.chtIphone16Title, source: "T 邦邦")
        let news3 = News(image: Images.dragonBaseball, title: Titles.dragonBaseballTitle, source: "東x新聞")
        let news4 = News(image: Images.samsungGalaxyS25, title: Titles.samsungGalaxyS25, source: "三爽")
        let news5 = News(image: Images.submarine, title: Titles.submarineTitle, source: "國防布")
        let news6 = News(image: Images.cht, title: Titles.chtTitle, source: "種花電信")
        
        return [news1, news2, news3, news4, news5, news6]
    }
}
