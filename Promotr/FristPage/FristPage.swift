//
//  FristPage.swift
//  Promotr
//
//  Created by Mac on 2/6/23.
//

import UIKit
import SDWebImage
class FristPage: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,
                 UICollectionViewDelegateFlowLayout{
    
    var currentPage = 0
    @IBOutlet weak var mycollectionView:UICollectionView!
    
   
    var slideModel:SliderModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SliderApi()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return (slideModel?.data?.appSliders?.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mycollectionView.dequeueReusableCell(withReuseIdentifier:"cell", for: indexPath) as! SliderViewCell
        cell.signinButton.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        cell.SignUP.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
        cell.skipButton.setTitle(NSLocalizedString("Skip", comment: ""), for: .normal)
             cell.SignUP.layer.cornerRadius = 20
             cell.SignUP.layer.borderWidth = 1
             cell.SignUP.layer.borderColor = #colorLiteral(red: 0.9743235707, green: 0.7031511068, blue: 0.6096453667, alpha: 1)
        cell.pageController.currentPage = indexPath.row
        let str = slideModel?.data?.appSliders?[indexPath.row].full_image_url
        if let url = URL(string:str!) {
            print(url)
            cell.sliderImage!.sd_setImage(with: url, placeholderImage: nil, options: SDWebImageOptions(rawValue: 0))
        }
        cell.titles.text = slideModel?.data?.appSliders?[indexPath.row].title
        cell.subTitles.text = slideModel?.data?.appSliders?[indexPath.row].subtitle
        mycollectionView.contentInsetAdjustmentBehavior = .never
        cell.signUpButtonPressed = {
                    let vc = self.storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpVC
                    self.navigationController?.pushViewController(vc, animated: true)
        }
        cell.signinButtonPressed = {
            let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        cell.skipButtonPressed = {
            let vc = self.storyboard?.instantiateViewController(identifier: "UserTabBarVC") as! UserTabBarVC
            UserDefaults.standard.setValue("", forKey: "skip")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemWidth = collectionView.bounds.width
            let itemHeight = collectionView.bounds.height
            return CGSize(width: itemWidth, height: itemHeight)
    }
}
extension FristPage {
    
    func SliderApi(){
        let param = [String:Any]()
        SliderViewModel.callSliderApi(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.slideModel = responseObject
            print("Get Data SuccessFully")
            self.mycollectionView.reloadData()
        }
    }
 
}
