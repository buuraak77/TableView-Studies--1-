//
//  ViewController.swift
//  TableViewExamples-Multiple
//
//  Created by Burak Yılmaz on 15.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var countries: [String] = [String]()
    var cities: [String] = [String]()
    

    @IBOutlet var tableView1: UITableView!
    @IBOutlet var tableView2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["Türkiye", "Almanya", "Hollanda", "Amerika", "İngiltere"]
        cities = ["İzmir", "Berlin", "Amsterdam", "New York", "Londra"]
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        tableView2.delegate = self
        tableView2.dataSource = self
        
        
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "BACK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var veri: Int?
        
        if tableView == tableView1 {
            veri = countries.count
        }
        if tableView == tableView2 {
            veri = cities.count
        }
        
        return veri!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if tableView == tableView1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
            cell?.textLabel?.text = countries[indexPath.row]
        }
        if tableView == tableView2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
            cell?.textLabel?.text = cities[indexPath.row]
        }
        
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableView1 {
            
            makeAlert(title: "Choosen Country", message: "\(countries[indexPath.row])")
        }
        if tableView == tableView2 {
            
            makeAlert(title: "Choosen City", message: "\(cities[indexPath.row])")
        }
    }
    
}

