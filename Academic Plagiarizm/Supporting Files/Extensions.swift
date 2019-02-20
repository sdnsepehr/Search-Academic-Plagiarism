//
//  Extensions.swift
//  Academic Plagiarizm
//
//  Created by AHG on 2/19/19.
//  Copyright © 2019 Microcis. All rights reserved.
//

import UIKit
import Lottie

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1);
    }
    
    convenience init(colorString: String) {
        let valueArray = colorString.components(separatedBy: ":");
        
        if (valueArray.count < 3) {
            self.init(r: 181/255, g: 181/255, b: 181/255);
        } else {
            self.init(red: CGFloat(Float(valueArray[0])!/255.0), green: CGFloat(Float(valueArray[1])!/255.0), blue: CGFloat(Float(valueArray[2])!/255.0), alpha: 1);
        }
    }
}

extension UIView {
    var activityIndicatorTag: Int { return 9427342 }
    func startActivityIndicator() {
        DispatchQueue.main.async {
            if self.subviews.filter({$0.tag == self.activityIndicatorTag}).first != nil {
                return;
            }
            let dimView = UIView();
            dimView.frame = self.frame;
            dimView.center = self.center;
            dimView.backgroundColor = UIColor.black.withAlphaComponent(0.3);
            //            dimView.alpha = 0.8;
            dimView.tag = self.activityIndicatorTag;
            self.addSubview(dimView)
            
            let spinnerFrame = CGRect(x: (self.frame.size.width-200)/2, y: self.frame.size.height/3, width: 200, height: 200);
            let spinnerView = LOTAnimationView(name: "waiting");
            spinnerView.tintColor = .orange;
            spinnerView.loopAnimation = true;
            spinnerView.frame = spinnerFrame;
            spinnerView.backgroundColor = .clear;
            dimView.addSubview(spinnerView);
            
            spinnerView.play{ (finished) in
                print("Animation Finished!!")
            }
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let dimView = self.subviews.filter({$0.tag == self.activityIndicatorTag}).first {
                if let animationView = self.subviews.filter({$0.tag == self.activityIndicatorTag}).first as? LOTAnimationView {
                    animationView.loopAnimation = false;
                    animationView.stop();
                }
                dimView.removeFromSuperview();
            }
        }
    }
}
