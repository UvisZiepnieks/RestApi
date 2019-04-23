//
//  ViewControllerPhotos.swift
//  RestApi
//
//  Created by Vidzemes Augstkola on 27/03/2019.
//  Copyright © 2019 Vidzemes Augstkola. All rights reserved.
//

import UIKit

class ViewControllerPhotos: UIViewController, UITableViewDataSource {

    final let url = URL(string: "https://api.github.com/repos/uvisziepnieks/iosMd5Repo/contents/Photos")
    private var photos = [jsonData]()
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadPhotos()
    }
    
    
    func downloadPhotos(){
        guard let downloadedURL = url else{return}
        URLSession.shared.dataTask(with: downloadedURL) { (data, urlResponse , error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Something is wrong")
                return
            }
            print("Loaded JSON")
            do{
                let decoder = JSONDecoder()
                let downloadedPhotos = try decoder.decode([jsonData].self, from: data)
                self.photos = downloadedPhotos
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print("Something wrong after loading")
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell") as? PhotosCell else { return UITableViewCell() }
        
        cell.nameLabel.text = photos[indexPath.row].name
        return cell
        
    }

    
    @IBAction func btnPressed(_ sender: UIButton) {
        let point = (sender as AnyObject).convert(CGPoint.zero, to: tableView as UIView)
        let indexPath: IndexPath! = tableView.indexPathForRow(at: point)
        
        downloadData(name: photos[indexPath.row].name, downURL: photos[indexPath.row].download_url)
    }
    
}
