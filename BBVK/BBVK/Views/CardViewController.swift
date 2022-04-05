//
//  CardViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 02/04/22.
//

import UIKit

class CardViewController: UIViewController {
    let titleLabel = UILabel()
    let cardView = CardView()
    let cardTitleLabel = UILabel()
    let cardLabel = UILabel()
    let validityTitleLabel = UILabel()
    let validityLabel = UILabel()
    let cvvTitleLabel = UILabel()
    let cvvLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: 27),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 40)
        ])
        titleLabel.text = "TARJETA"
        
        view.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 244),
            cardView.widthAnchor.constraint(equalToConstant: 144),
        ])
        cardView.dropShadow()
        
        
        view.addSubview(cardTitleLabel)
        cardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 27),
            cardTitleLabel.topAnchor.constraint(equalTo: cardView.bottomAnchor,
                                                constant: 50)
        ])
        cardTitleLabel.text = "No. de Tarjeta"
        
        view.addSubview(cardLabel)
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel.leadingAnchor.constraint(equalTo: cardTitleLabel.leadingAnchor),
            cardLabel.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor)
        ])
        cardLabel.text = "5439 2464 7664 2003"
        cardLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        
        
        view.addSubview(validityTitleLabel)
        validityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            validityTitleLabel.leadingAnchor.constraint(equalTo: cardTitleLabel.leadingAnchor),
            validityTitleLabel.topAnchor.constraint(equalTo: cardLabel.bottomAnchor,
                                                    constant: 20)
        ])
        validityTitleLabel.text = "Vigencia"
        
        view.addSubview(validityLabel)
        validityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            validityLabel.leadingAnchor.constraint(equalTo: validityTitleLabel.leadingAnchor),
            validityLabel.topAnchor.constraint(equalTo: validityTitleLabel.bottomAnchor)
        ])
        validityLabel.text = "11/26"
        validityLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        
        
        view.addSubview(cvvTitleLabel)
        cvvTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cvvTitleLabel.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            cvvTitleLabel.centerYAnchor.constraint(equalTo: validityTitleLabel.centerYAnchor)
        ])
        cvvTitleLabel.text = "CVV"
        
        view.addSubview(cvvLabel)
        cvvLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cvvLabel.leadingAnchor.constraint(equalTo: cvvTitleLabel.leadingAnchor),
            cvvLabel.topAnchor.constraint(equalTo: cvvTitleLabel.bottomAnchor)
        ])
        cvvLabel.text = "125"
        cvvLabel.textColor = UIColor.black.withAlphaComponent(0.6)
        
    }

}
