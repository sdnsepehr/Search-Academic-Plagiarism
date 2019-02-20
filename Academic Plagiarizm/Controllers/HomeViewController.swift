//
//  ViewController.swift
//  Academic Plagiarizm
//
//  Created by AHG on 2/19/19.
//  Copyright © 2019 Microcis. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView();
        imageView.image = #imageLiteral(resourceName: "indexj");
        imageView.isUserInteractionEnabled = true;
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped));
        imageView.addGestureRecognizer(tap);
        imageView.contentMode = .scaleAspectFit;
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView;
    }();
    
    let subTitleLabel: UILabel = {
        let label = UILabel();
        label.text = "Academic Plagiarizm Detection Platfrom".uppercased();
        label.textAlignment = .center;
        label.textColor = UIColor.black.withAlphaComponent(0.92);
        label.font = UIFont.boldSystemFont(ofSize: 22);
         label.numberOfLines = 0;
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let enterTextHereLabel: UILabel = {
        let label = UILabel();
        label.textAlignment = .center;
        label.numberOfLines = 0;
        label.font = UIFont.systemFont(ofSize: 14)
         label.textColor = UIColor.black.withAlphaComponent(0.8);
        label.text = "Enter the suspicious text below:";
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .custom);
        button.backgroundColor = UIColor(r: 50, g: 140, b: 255);
        button.setTitle("Search", for: .normal);
        button.setTitleColor(.white, for: .normal);
        button.layer.cornerRadius = 4;
        button.layer.masksToBounds = true;
        button.addTarget(self, action: #selector(searchTapped), for: .touchUpInside);
        button.translatesAutoresizingMaskIntoConstraints = false;
        return button;
    }()
    
    let textView: UITextView = {
        let textView = UITextView();
        textView.backgroundColor = .white;
        textView.showsVerticalScrollIndicator = false;
        textView.showsHorizontalScrollIndicator = false;
        textView.layer.borderWidth = 1;
        textView.layer.cornerRadius = 4;
        textView.layer.masksToBounds = true;
        textView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor;
        textView.translatesAutoresizingMaskIntoConstraints = false;
        return textView;
    }();
    
    let lineView: UIView = {
        let view = UIView();
        view.backgroundColor = UIColor(r: 50, g: 140, b: 255).withAlphaComponent(0.5);
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }();
    
    let orLabel: UILabel = {
        let label = UILabel();
        label.text = "OR";
        label.textAlignment = .center;
         label.textColor = UIColor.black.withAlphaComponent(0.8);
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    lazy var browseButton: UIButton = {
        let button = UIButton(type: .system);
        button.setTitle("Browse File", for: .normal);
        button.translatesAutoresizingMaskIntoConstraints = false;
        return button;
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .white;
        
        view.addSubview(iconView);
        view.addSubview(subTitleLabel);
        view.addSubview(enterTextHereLabel);
        view.addSubview(textView);
        view.addSubview(searchButton);
        view.addSubview(lineView);
        view.addSubview(orLabel);
        view.addSubview(browseButton);
        
        setupConstraints();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.view.stopActivityIndicator();
        self.textView.text = "";
        self.navigationController?.setNavigationBarHidden(true, animated: false);
    }
    
    private func setupConstraints() {
        //iconView constraints
        iconView.topAnchor.constraint(equalTo: view.topAnchor, constant: 38).isActive = true;
        iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        iconView.widthAnchor.constraint(equalToConstant: 200).isActive = true;
        iconView.heightAnchor.constraint(equalToConstant: 110).isActive = true;
        
//        subTitleLabel .constraints
        subTitleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 30).isActive = true;
        subTitleLabel.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true;
        subTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        
//        enterTextHereLabel .constraints
        enterTextHereLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30).isActive = true;
        enterTextHereLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true;
        
//        textView .constraints
        textView.topAnchor.constraint(equalTo: enterTextHereLabel.bottomAnchor, constant: 4).isActive = true;
        textView.leadingAnchor.constraint(equalTo: enterTextHereLabel.leadingAnchor, constant: -2).isActive = true;
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true;
        textView.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        //        searchButton .constraints
        searchButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true;
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        searchButton.widthAnchor.constraint(equalToConstant: 110).isActive = true;
        searchButton.heightAnchor.constraint(equalToConstant: 38).isActive = true;
        
//        lineView .constraints
        lineView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 68).isActive = true;
        lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        lineView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true;
        
//        orLabel .constraints
        orLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 24).isActive = true;
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        
//        browseButton .contentEdgeInsets
        browseButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: -4).isActive = true;
        browseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        browseButton.widthAnchor.constraint(equalToConstant: 110).isActive = true;
        browseButton.heightAnchor.constraint(equalToConstant: 38).isActive = true;
        
    }
    
    @objc private func viewTapped() {
        self.view.endEditing(true);
    }
}


extension HomeViewController {
    @objc private func searchTapped() {
        guard let text = textView.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            PopupMessages.showWarningMessage(message: "Please enter at least on paragraph.");
            return;
        }
        
        // Here needs to call the API, as it is not yet ready, we use some dummy data to simulate the API is returned and needs to be shown
        view.startActivityIndicator();
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            self.view.stopActivityIndicator();
            if text.contains("Piracy") || text.contains("Software") {
            let seachResultCollectionView = ResultCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout());
            self.navigationController?.pushViewController(seachResultCollectionView, animated: true);
            } else {
                PopupMessages.showThinyWarningMessage(message: "No results found for \(text)");
            }
        }
        
    }
}
