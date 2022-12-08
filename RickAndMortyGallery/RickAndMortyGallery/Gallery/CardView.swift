//
//  CardView.swift
//  RickAndMortyGallery
//
//  Created by Felipe Carrasco on 06-12-22.
//

import UIKit

protocol CardViewDelegate: AnyObject {
    func didTappedButton(word: String)
}

class CardView: UIView {
    
    weak var delegate: CardViewDelegate?
    
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "rick")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Bienvenido a la App de Rick and Morty"
        label.textColor = .blue
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var skipOnBoardingButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Pulsa para continuar"
        config.subtitle = "Onboarding"
               
        let button = UIButton(type: .system)
        button.setTitle("Pulsa para continuar", for: .normal)
        button.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Hola", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        return button
    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//        isUserInteractionEnabled = true
////        skipOnBoardingButton.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
//    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        configureConstraints()
    }
    
    private func addSubviews() {
        [onboardingImageView, textLabel, skipOnBoardingButton]
            .forEach(addSubview)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            onboardingImageView.topAnchor.constraint(equalTo: topAnchor),
            onboardingImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

            textLabel.topAnchor.constraint(equalTo: onboardingImageView.bottomAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            skipOnBoardingButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            skipOnBoardingButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            skipOnBoardingButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            skipOnBoardingButton.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc func showMessage() {
        print("Skip onboarding")
        delegate?.didTappedButton(word: "Hello")
    }
}
