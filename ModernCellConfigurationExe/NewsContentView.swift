//
//  NewsContentView.swift
//  ModernCellConfigurationExe
//
//  Created by YEN-JU HUANG on 2024/9/12.
//

import UIKit

class NewsContentView: UIView, UIContentView {
    var configuration: any UIContentConfiguration {
        didSet {
            setStyle()
        }
    }
    
    private let newsImageView = UIImageView()
    private var newsTitleLabel = UILabel()
    private let newsSourceLabel = UILabel()
    
    init(configuration: any UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        layoutViews()
        setNews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setNews() {
        guard let config = configuration as? NewsContentConfiguration else {
            return
        }
        
        newsImageView.image = config.news.image
        newsTitleLabel.text = config.news.title
        newsSourceLabel.text = config.news.source
    }
    
    private func setStyle() {
        guard let config = configuration as? NewsContentConfiguration else {
            return
        }
        
        newsTitleLabel.textColor = config.textColor
        newsSourceLabel.textColor = config.textColor
    }
        
    private func layoutViews() {
        addSubviews()
        configureSubViews()
        setConstraints()
    }
    
    private func addSubviews() {
        addSubview(newsImageView)
        addSubview(newsTitleLabel)
        addSubview(newsSourceLabel)
    }

    private func configureSubViews() {
        configureImageView()
        configureTitleLabel()
        configureSourceLabel()
    }
    
    private func configureImageView() {
        newsImageView.layer.cornerRadius = 16
        newsImageView.clipsToBounds = true
    }
    
    private func configureTitleLabel() {
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.adjustsFontSizeToFitWidth = true
        newsTitleLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
    }
    
    private func configureSourceLabel() {
        newsSourceLabel.numberOfLines = 0
        newsSourceLabel.adjustsFontSizeToFitWidth = true
        newsSourceLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    private func setConstraints() {
        setImageViewConstraints()
        setTitleLabelConstraints()
        setSourceLabelConstraints()
    }
    
    private func setImageViewConstraints() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12.0).isActive = true
        newsImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.9).isActive = true
        newsImageView.heightAnchor.constraint(equalTo: newsImageView.widthAnchor, multiplier: 9/16).isActive = true
    }
    
    private func setTitleLabelConstraints() {
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16.0).isActive = true
        newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor).isActive = true
        newsTitleLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor).isActive = true
    }
    
    private func setSourceLabelConstraints() {
        newsSourceLabel.translatesAutoresizingMaskIntoConstraints = false
        newsSourceLabel.leadingAnchor.constraint(equalTo: newsTitleLabel.leadingAnchor).isActive = true
        newsSourceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12.0).isActive = true
    }
}
