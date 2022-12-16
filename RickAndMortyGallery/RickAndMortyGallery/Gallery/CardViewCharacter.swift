//
//  CardViewCharacter.swift
//  RickAndMortyGallery
//
//  Created by Felipe Carrasco on 06-12-22.
//

import UIKit

class CardViewCharacter: UIView {
    private let image = UIImage()
    
    private let imageWith: Double = 150

    private func setupImageCornerRadius() {
        imageCharacterView.layer.cornerRadius = imageCharacterView.bounds.width / 2
        imageCharacterView.layer.masksToBounds = true
    }
    
    let pillView = PillView(textPill: "Text")
    
    private let nameCharacterLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        label.textAlignment = .left
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var imageCharacterView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rick")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .purple
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let statusCharacterLabel: UILabel = {
        let label = UILabel()
        label.text = "Alive"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        label.textAlignment = .left
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let speciesCharacterLabel: UILabel = {
        let label = UILabel()
        label.text = "Human"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        label.textAlignment = .left
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let containerPillStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGreen
        layer.cornerRadius = 20
        layer.masksToBounds = true
        //addShadow()
        
        addSubview(nameCharacterLabel)
        addSubview(imageCharacterView)
        addSubview(containerPillStackView)
       
        NSLayoutConstraint.activate([
            nameCharacterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            nameCharacterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nameCharacterLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            containerPillStackView.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 25),
            containerPillStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            imageCharacterView.leadingAnchor.constraint(greaterThanOrEqualTo: containerPillStackView.trailingAnchor, constant: 5),
            imageCharacterView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            imageCharacterView.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 10),
            imageCharacterView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        
        ])
                     
        containerPillStackView.addArrangedSubview(PillView(textPill: "Alive"))
        containerPillStackView.addArrangedSubview(PillView(textPill: "Human"))
        
        statusCharacterLabel.setContentHuggingPriority(.defaultHigh + 10, for: .vertical)
        
        setupImageCornerRadius()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            imageCharacterView.widthAnchor.constraint(equalToConstant: bounds.width / 2),
            imageCharacterView.heightAnchor.constraint(equalToConstant: bounds.width / 2)
        ])
        
        setupImageCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.55
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
}
