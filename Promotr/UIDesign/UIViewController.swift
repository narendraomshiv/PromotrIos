//
//  UIViewController.swift
//  WhoShoot
//
//  Created by Mac on 12/8/22.
//

import Foundation
import UIKit
fileprivate var aview: UIView?
let loader = UIActivityIndicatorView(style: .large)
extension UIViewController {
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height/2 + 200, width: 200, height: 35))
        toastLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    func showLoader() {
        aview = UIView(frame: self.view.bounds)
        aview!.backgroundColor = UIColor.black.withAlphaComponent( 0.15)
        loader.center = aview!.center
        loader.color = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        loader.startAnimating()
        aview!.addSubview(loader)
        UIView.transition(with: self.view, duration: 0.10, options: [.transitionCrossDissolve], animations: {
            self.view.addSubview(aview!)
        }, completion: nil)
    }
    func removeLoader() {
        loader.stopAnimating()
        UIView.transition(with: self.view, duration: 0.10, options: [.transitionCrossDissolve], animations: {
            aview?.removeFromSuperview()
        }, completion: nil)
        aview = nil
    }
}
extension String {
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter.date(from: self)
    }
}
