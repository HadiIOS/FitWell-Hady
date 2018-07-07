//
//  MapViewController.swift
//  FitWell<>Hady
//
//  Created by Hadi NourAllah on 07/07/2018.
//  Copyright © 2018 Hadi NourAllah. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    private var cells: [Cell] = []
    private var raceDetails: RaceDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadData()
    }
    
    //MARK:- Navigation Button Action
    override func rightAction() {
        BaseUtil.showAlert("Search Action", vc: self)
    }
    
    override func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }

    private func setupView() {
        self.setupBarButtons()
        self.setupTitleFont()
        self.title = "Details"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(self.loadData), for: .valueChanged)
    }
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = cells[indexPath.row].type
        switch type {
        case .map:
            return 150
        case .user:
            return 90
        case .total:
            return 70
        case .segment:
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[indexPath.row]
        switch cell.type {
        case .map:
            let data = cell.data as! RaceDetails
            let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as! MapTableViewCell
            cell.setupCell(data)
            return cell
            
        case .user:
            let data = cell.data as! RaceDetails
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
            cell.setupCell(data)
            return cell
            
        case .total:
            let data = cell.data as! RaceDetails
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalDataTableViewCell", for: indexPath) as! TotalDataTableViewCell
            cell.setupCell(data)
            return cell
            
        case .segment:
            let data = cell.data as! RaceDetails.Segment
            let cell = tableView.dequeueReusableCell(withIdentifier: "SegmentTableViewCell", for: indexPath) as! SegmentTableViewCell
            cell.setupCell(data)
            return cell
        }
    }
    
    //MARK:- Data
    @objc private func loadData() {
        Service().getRaceDetails { (raceDetails, isError) in
            if isError {
                BaseUtil.showAlert("Error Occured!", vc: self)
            } else {
                self.raceDetails = raceDetails
                self.prepareCells()
            }
            self.refreshControl.endRefreshing()
        }
    }
    
    private func prepareCells() {
        guard let race: RaceDetails = raceDetails else {
            return
        }
        
        cells = []
        cells.append(Cell(type: .map, data: race))
        cells.append(Cell(type: .user, data: race))
        cells.append(Cell(type: .total, data: race))
        race.segments?.first?.isFirst = true
        race.segments?.last?.isLast = true
        for segment in race.segments ?? [] {
            cells.append(Cell(type: .segment, data: segment))
        }
    }
    
    
    struct Cell {
        let type: CellType
        let data: Any
        
        enum CellType {
            case map
            case user
            case total
            case segment
        }
    }
}

