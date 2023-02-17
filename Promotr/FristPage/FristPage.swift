//
//  FristPage.swift
//  Promotr
//
//  Created by Mac on 2/6/23.
//

import UIKit

class FristPage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
  
    
    @IBOutlet weak var mycollectionView:UICollectionView!
    @IBOutlet weak var Signin:UIButton!
    @IBOutlet weak var SignUP:UIButton!
    @IBOutlet weak var contantView:UIView!
    
    @IBOutlet weak var pageController:UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        Signin.layer.cornerRadius = 20
        SignUP.layer.cornerRadius = 20
        SignUP.layer.borderWidth = 1
        SignUP.layer.borderColor = #colorLiteral(red: 0.9743235707, green: 0.7031511068, blue: 0.6096453667, alpha: 1)
        contantView.layer.cornerRadius = 30
        contantView.layer.masksToBounds = true
        contantView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mycollectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath)
        return cell
    }
    func updatePageNumber() {
           // If not case to `Int` will give an error.
           let currentPage = Int(ceil(mycollectionView.contentOffset.x / mycollectionView.frame.size.width))
        pageController.currentPage = currentPage
       }

       func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           // This will be call when you scrolls it manually.
           updatePageNumber()
       }

       func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
           // This will be call when you scrolls it programmatically.
           updatePageNumber()
       }
   

}
