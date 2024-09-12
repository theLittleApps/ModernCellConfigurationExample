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
    
    // ui style
    var textColor: UIColor?
    
    func makeContentView() -> any UIView & UIContentView {
        return NewsContentView(configuration: self)
    }
    
    // update different style based on cell's state
    func updated(for state: any UIConfigurationState) -> NewsContentConfiguration {
        guard let state = state as? UICellConfigurationState else {
            return self
        }
        
        var updatedConfig = self
        // when cell is selected, text color would turn to white
        if state.isSelected {
            updatedConfig.textColor = .white
        }else {
            updatedConfig.textColor = .black
        }
        
        return updatedConfig
    }
}
