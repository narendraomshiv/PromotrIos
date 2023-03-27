//
//  SliderViewCell.swift
//  Promotr
//
//  Created by Mac on 2/22/23.
//

import UIKit

class SliderViewCell: UICollectionViewCell {
 
    @IBOutlet weak var sliderImage:UIImageView?
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var signinButton: DesignableButton!
    @IBOutlet weak var SignUP:UIButton!
    @IBOutlet weak var titles:UILabel!
    @IBOutlet weak var subTitles:UILabel!
    @IBOutlet weak var pageController:UIPageControl!
    
    var signUpButtonPressed : (() -> ()) = {}
    var signinButtonPressed : (() -> ()) = {}
    var skipButtonPressed : (() -> ()) = {}
    @IBAction func signInButtonAction(_ sender: UIButton) {
        signinButtonPressed()
    }
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        signUpButtonPressed()
    }
    @IBAction func skipButtonAction(_ sender: UIButton) {
        skipButtonPressed()
    }
}
