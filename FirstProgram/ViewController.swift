//
//  ViewController.swift
//  FirstProgram
//
//  Created by Артем Пучков on 31.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemPink,
        .systemOrange,
        .systemGreen,
        .systemBlue,
        .systemYellow,
        .systemPurple,
    ]
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action:  #selector(didTapButton), for:  .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 50,
            y: view.frame.height - 150 - view.safeAreaInsets.bottom,
            width: view.frame.width - 110,
            height:  55
        )
    }
    
    @objc func didTapButton() {
         getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

