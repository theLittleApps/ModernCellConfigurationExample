//
//  NewsCell_MCC_US.swift
//  ModernCellConfigurationExe
//
//  Created by YEN-JU HUANG on 2024/9/24.
//

import UIKit

class NewsCell_MCC_US: UITableViewCell {
    static let identifier = "NewsCell_MCC_US"
    
    private var a_news = News(image: nil, title: nil, source: nil)
    
    // when cell is selected, this update would be called
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        
        // generate configuration for cell content based on cell's state
        let contentConfig = NewsContentConfiguration_US(news: a_news).updated(for: state)
        contentConfiguration = contentConfig
    }
        
    func set(news: News) {
        contentConfiguration = NewsContentConfiguration_US(news: news)
        a_news = news
    }
}
