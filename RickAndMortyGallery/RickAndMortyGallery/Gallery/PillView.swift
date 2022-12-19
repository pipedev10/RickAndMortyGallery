//
//  PillView.swift
//  RickAndMortyGallery
//
//  Created by Felipe Carrasco on 16-12-22.
//

import UIKit

class PillView: UIView {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Alive"
        label.font = UIFont.configFont(name: .arialBold, size: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    init(textPill: String, backgroundColor: UIColor = .white) {
        super.init(frame: .zero)
        configView()
        configPill(pillName: textPill, color: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configView() {
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
        ])
    }
    
    private func configPill(pillName textPill: String, color backgroundColor: UIColor) {
        textLabel.text = textPill
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}
