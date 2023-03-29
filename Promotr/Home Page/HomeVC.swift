//
//  HomeVC.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit
import SDWebImage
class HomeVC: UIViewController {
    @IBOutlet weak var suggestionsCollectionView: UICollectionView!
    @IBOutlet weak var searchTopView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var categoriesModel:CategorieModel?
    var promoModel:PromoData?
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoriesApi()
        promocodeApi()
       print(UserDefaults.standard.string(forKey: "Promoter_id"))
        searchTopView.layer.cornerRadius = 25
        self.searchTopView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        // Do any additional setup after loading the view.
    }
    @IBAction func filterButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == suggestionsCollectionView
        {
            return (promoModel?.data?.promocode?.count) ?? 0
        }
        else
        {
            return (categoriesModel?.data?.cats?.count) ?? 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == suggestionsCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SuggestionListCell
            cell.productImage.image = #imageLiteral(resourceName: "influencer")
            cell.cellView.layer.cornerRadius = 10
            cell.cellView.layer.borderWidth = 0.5
            cell.cellView.layer.borderColor = UIColor.systemGray2.cgColor
            
            cell.codeLable.text = promoModel?.data?.promocode?[indexPath.row].code_id
            cell.companyName.text = promoModel?.data?.promocode?[indexPath.row].title
            cell.discountLbl.text = promoModel?.data?.promocode?[indexPath.row].description
            cell.cellView.clipsToBounds = true
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCell
            cell.categoriesImage.layer.cornerRadius = 20
            cell.categoriesName.text = categoriesModel?.data?.cats?[indexPath.row].name
            let str = categoriesModel?.data?.cats?[indexPath.row].full_image_url
            if let url = URL(string:str!) {
                print(url)
                cell.categoriesImage!.sd_setImage(with: url, placeholderImage: nil, options: SDWebImageOptions(rawValue: 0))
            }
         
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == suggestionsCollectionView {
            let id = promoModel?.data?.promocode?[indexPath.row].id
            let vc = self.storyboard?.instantiateViewController(identifier: "PermotrGetByID") as! PermotrGetByID
            vc.id = id
            self.navigationController?.pushViewController(vc, animated: true)
           
        }
        else
        {
            let id = categoriesModel?.data?.cats?[indexPath.row].id
            let name = categoriesModel?.data?.cats?[indexPath.row].name
            let vc = self.storyboard?.instantiateViewController(identifier: "SearchFilterVC") as! SearchFilterVC
            vc.Id = id
            vc.category = name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    //========API Integration =======
    
    func CategoriesApi()
    {
        let param = [String:Any]()
        CategioryViewModel.callCategoryApi(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.categoriesModel = responseObject
            print("Get Data SuccessFully")
            self.collectionView.reloadData()
        }
    }
    
    func promocodeApi()
    {
        let param = [String:Any]()
        CategioryViewModel.CallPromoCodeOfTheDayApi(viewController: self, parameters:param as NSDictionary ) {
            responseObject in
            self.promoModel = responseObject
            print("Get Data SuccessFully")
            self.suggestionsCollectionView.reloadData()
        }
    }
}
