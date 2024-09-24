//
//  NewsContentConfiguration_US.swift
//  ModernCellConfigurationExe
//
//  Created by YEN-JU HUANG on 2024/9/24.
//

import UIKit

struct NewsContentConfiguration_US: UIContentConfiguration {
    // data
    let news: News
    // ui style
    var textColor: UIColor?
    
    func makeContentView() -> any UIView & UIContentView {
        return NewsContentView_US(configuration: self)
    }
    
    func updated(for state: any UIConfigurationState) -> NewsContentConfiguration_US {
        guard let state = state as? UICellConfigurationState else {
            return self
        }
        
        var updatedConfig = self
        // when cell is selected, text color would turn to white
        if state.isSelected {
            updatedConfig.textColor = .systemRed
        }else {
            updatedConfig.textColor = .black
        }
        
        return updatedConfig
    }
}
