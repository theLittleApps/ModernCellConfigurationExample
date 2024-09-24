//
//  NewsContentConfiguration.swift
//  ModernCellConfigurationExe
//
//  Created by YEN-JU HUANG on 2024/9/12.
//

import UIKit

struct NewsContentConfiguration: UIContentConfiguration {
    // data
    let news: News
    
    func makeContentView() -> any UIView & UIContentView {
        return NewsContentView(configuration: self)
    }
    
    // update different style based on cell's state
    func updated(for state: any UIConfigurationState) -> NewsContentConfiguration {
        return self
    }
}
