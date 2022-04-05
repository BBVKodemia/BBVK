//
//  CardView.swift
//  BBVK
//
//  Created by Jonathan Avila on 05/04/22.
//
import UIKit

class CardView: UIView {
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        
        let imageNameView = UIImageView()
        imageNameView.image = UIImage(named: "ImageName")
        addSubview(imageNameView)
        imageNameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageNameView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageNameView.heightAnchor.constraint(equalToConstant: 24),
            imageNameView.widthAnchor.constraint(equalToConstant: 113.5),
            imageNameView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
        ])
        imageNameView.contentMode = .scaleAspectFit
        
        let imageIconView = UIImageView()
        imageIconView.image = UIImage(named: "ImageLogo")
        addSubview(imageIconView)
        imageIconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageIconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageIconView.heightAnchor.constraint(equalToConstant: 28),
            imageIconView.widthAnchor.constraint(equalToConstant: 44),
            imageIconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
        ])
        imageIconView.contentMode = .scaleAspectFit

        
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    func dropShadow() {
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 9
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowColor = UIColor(red: 0.498, green: 0.498, blue: 0.498, alpha: 1).cgColor
    }
}
