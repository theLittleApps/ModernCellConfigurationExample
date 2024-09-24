//
//  NewsCell_MCC.swift
//  ModernCellConfigurationExe
//
//  Created by YEN-JU HUANG on 2024/9/12.
//

import UIKit

class NewsCell_MCC: UITableViewCell {
    static let identifier = "NewsCell_MCC"

    func set(news: News) {
        contentConfiguration = NewsContentConfiguration(news: news)
    }
}
