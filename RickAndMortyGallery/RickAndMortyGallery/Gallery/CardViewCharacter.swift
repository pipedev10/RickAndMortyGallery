//
//  CardViewCharacter.swift
//  RickAndMortyGallery
//
//  Created by Felipe Carrasco on 06-12-22.
//

import UIKit

class CardViewCharacter: UIView {

    private let nameCharacterLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 32)
        label.textAlignment = .left
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let imageCharacterView: UIImageView = {
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
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.textAlignment = .left
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let speciesCharacterLabel: UILabel = {
        let label = UILabel()
        label.text = "Human"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.textAlignment = .left
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
        //addShadow()
        
        addSubview(nameCharacterLabel)
        addSubview(imageCharacterView)
        addSubview(statusCharacterLabel)
        addSubview(speciesCharacterLabel)
        
        NSLayoutConstraint.activate([
            nameCharacterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            nameCharacterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameCharacterLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageCharacterView.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 10),
            imageCharacterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCharacterView.heightAnchor.constraint(equalToConstant: 150),
            imageCharacterView.widthAnchor.constraint(equalToConstant: 150),
            
            statusCharacterLabel.topAnchor.constraint(equalTo: nameCharacterLabel.bottomAnchor, constant: 10),
            statusCharacterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            speciesCharacterLabel.topAnchor.constraint(equalTo: statusCharacterLabel.bottomAnchor, constant: 5),
            speciesCharacterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
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
