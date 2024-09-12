//
//  NewsCell_MCC.swift
//  ModernCellConfigurationExe
//
//  Created by YEN-JU HUANG on 2024/9/12.
//

import UIKit

class NewsCell_MCC: UITableViewCell {
    static let identifier = "NewsCell_MCC"
    
    private var a_news = News(image: nil, title: nil, source: nil)
    
    // when cell is selected, this update would be called
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        
        // generate configuration for cell background
        var backgroundConfig = backgroundConfiguration?.updated(for: state)
        backgroundConfig?.backgroundColor = .white
        
        // generate configuration for cell content based on cell's state
        let contentConfig = NewsContentConfiguration(news: a_news).updated(for: state)
        
        // when cell is selected, change cell's background color
        if state.isSelected {
            backgroundConfig?.backgroundColor = .red
        }
        
        backgroundConfiguration = backgroundConfig
        contentConfiguration = contentConfig
    }
        
    func set(news: News) {
        contentConfiguration = NewsContentConfiguration(news: news)
        a_news = news
    }
}
