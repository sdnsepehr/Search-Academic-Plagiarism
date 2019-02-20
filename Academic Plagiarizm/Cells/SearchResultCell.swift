//
//  SearchResultCell.swift
//  Academic Plagiarizm
//
//  Created by AHG on 2/19/19.
//  Copyright © 2019 Microcis. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var thesis: Thesis? {
        didSet {
            self.thesisTitle.text = thesis?.title;
            if let thesisYear = thesis?.year {
                 self.thesisYear.text =  ("Year: " + thesisYear).uppercased();
            }
            
            if let thesisId = thesis?.id {
                self.thesisID.text = ("ID: " + thesisId).uppercased();
            }
        
            if let university = thesis?.university, let faculty = thesis?.faculty {
                 self.university.text = (faculty + ", " + university).uppercased();
            }
           
            
            if let reported = thesis?.isReported, !reported {
                self.reportButton.isEnabled = false;
            }
        }
    }
    
    let thesisTitle: UILabel = {
        let label = UILabel();
        label.numberOfLines = 0;
        label.font = UIFont.boldSystemFont(ofSize: 24);
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let thesisYear: UILabel = {
        let label = UILabel();
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.darkText;
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let thesisID: UILabel = {
        let label = UILabel();
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.gray;
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    let university: UILabel = {
        let label = UILabel();
//        label.backgroundColor = UIColor.orange.withAlphaComponent(0.2) //UIColor(r: 213, g: 231, b: 255).withAlphaComponent(0.5);
        label.layer.cornerRadius = 2;
        label.layer.masksToBounds = true;
        label.adjustsFontSizeToFitWidth = true;
        label.font = UIFont.systemFont(ofSize: 12);
        label.textColor = UIColor.gray;
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }();
    
    lazy var reportButton: UIButton = {
        let button = UIButton(type: .custom);
        button.setTitle("Report", for: .normal);
        button.backgroundColor = UIColor.orange.withAlphaComponent(0.8);
        button.setTitleColor(.white, for: .normal);
        button.layer.cornerRadius = 4;
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14);
        button.titleLabel?.adjustsFontSizeToFitWidth = true;
        button.layer.masksToBounds = true;
        button.addTarget(self, action: #selector(reportPlagiarizm), for: .touchUpInside);
        button.translatesAutoresizingMaskIntoConstraints = false;
        return button;
    }();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        backgroundColor = .white;
        
        addSubview(thesisTitle);
        addSubview(thesisYear);
        addSubview(thesisID);
        addSubview(university);
        addSubview(reportButton);
        
        setupConstraints();
    }
    
    convenience init() {
        self.init(frame: CGRect.zero);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc private func reportPlagiarizm() {
        PopupMessages.showSuccessMessage(message: "Report sent to \(university.text ?? " Kabul University.")");
    }
    
    @objc private func setupConstraints() {
//        thesisTitle .constraints
        thesisTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true;
        thesisTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true;
        thesisTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true;
        
//        thesisYear .constraints
        thesisYear.topAnchor.constraint(equalTo: thesisTitle.bottomAnchor, constant: 10).isActive = true;
        thesisYear.leadingAnchor.constraint(equalTo: thesisTitle.leadingAnchor).isActive = true;
    
//        thesisID .constraints
        thesisID.leadingAnchor.constraint(equalTo: thesisYear.trailingAnchor, constant: 10).isActive = true;
        thesisID.centerYAnchor.constraint(equalTo: thesisYear.centerYAnchor).isActive = true;
    
//        university .constraints
        university.leadingAnchor.constraint(equalTo: thesisID.trailingAnchor, constant: 10).isActive = true;
        university.centerYAnchor.constraint(equalTo: thesisID.centerYAnchor).isActive = true;
        university.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true;
        
//        reportButton .constraints
        reportButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true;
        reportButton.widthAnchor.constraint(equalToConstant: 54).isActive = true;
        reportButton.heightAnchor.constraint(equalToConstant: 26).isActive = true;
        reportButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true;
    }
}
