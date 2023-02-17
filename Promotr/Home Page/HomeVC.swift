//
//  HomeVC.swift
//  Promotr
//
//  Created by Mac on 2/7/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var suggestionsCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
            return 40
        }
        else
        {
           return 20
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
            cell.cellView.clipsToBounds = true
            return cell
           
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoriesCell
            cell.categoriesImage.image = #imageLiteral(resourceName: "download (6)")
            cell.categoriesName.text = "Hellos"
            cell.categoriesImage.layer.cornerRadius = 20
            return cell
        }
       
    }
    
    
}
