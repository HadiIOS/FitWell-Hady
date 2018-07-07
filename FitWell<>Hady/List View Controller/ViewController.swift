//
//  ViewController.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 06/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    private var races: [Race] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBarButtons()
        self.setupTitleFont()
        self.title = "Races"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(self.loadData), for: .valueChanged)

        loadData()
    }

    //MARK:- Navigation Button Action
    override func rightAction() {
        BaseUtil.showAlert("Search Action", vc: self)
    }
    
    override func leftAction() {
        BaseUtil.showAlert("Back Action", vc: self)
    }
    
    //MARK:- Data
    @objc func loadData() {
        Service().getRaces { (races, error) in
            self.races = races ?? []
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    //MARK:- Table View Delegats
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let race = races[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RaceListTableViewCell", for: indexPath) as! RaceListTableViewCell
        cell.setupCell(race)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

