//
//  CountryVC.swift
//  Promotr
//
//  Created by Mac on 3/1/23.
//

import UIKit
protocol ContryNameCode: class {
    func countryDidSelect(country: String,code:String)
}
class CountryVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var CountryList:[CountryModel] = [CountryModel]()
    @IBOutlet weak var countryCodeTableView: UITableView!
    weak var delegate: ContryNameCode?
    override func viewDidLoad() {
        super.viewDidLoad()
        fatchData()
      
        

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryCodeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryCell
        cell.countrycode.text = CountryList[indexPath.row].dial_code
        cell.name.text = CountryList[indexPath.row].name
        cell.emoji.text = CountryList[indexPath.row].emoji
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let country = CountryList[indexPath.row].name
        let countryCode = CountryList[indexPath.row].dial_code
        self.delegate?.countryDidSelect(country: country!, code: countryCode!)
        self.dismiss(animated: true, completion: nil)
        
    }
    func fatchData()
    {
        guard let fileLocation=Bundle.main.url(forResource: "CountryData", withExtension: "json") else {
            return
        }
        do
        {
            let data = try Data(contentsOf:fileLocation)
            let receviedData = try JSONDecoder().decode([CountryModel].self, from: data)
            self.CountryList = receviedData
            DispatchQueue.main.async {
                self.countryCodeTableView.reloadData()
        }
        }
        catch
        {
            print("Error while Decoding Json")
        }
    }
}


