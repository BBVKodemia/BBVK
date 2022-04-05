//
//  DetailTransactionViewController.swift
//  BBVK
//
//  Created by Saúl Pérez on 05/04/22.
//

import UIKit

class DetailTransactionViewController: UIViewController {
    let titleLabel = UILabel()
    let amountLabel = UILabel()
    let conceptLabel = UILabel()
    let recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
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
                                                constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: 20)
        ])
        
        view.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            amountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                            constant: 50)
        ])
        
        view.addSubview(conceptLabel)
        conceptLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conceptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conceptLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,
                                            constant: 5)
        ])
        
        
        titleLabel.text = "Detalle de la transaccion"
        amountLabel.text = "$ \(recipe.data.transaction.amount)"
        conceptLabel.text = recipe.data.transaction.concept
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
