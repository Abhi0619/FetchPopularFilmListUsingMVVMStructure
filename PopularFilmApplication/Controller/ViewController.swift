//
//  ViewController.swift
//  PopularFilmApplication
//
//  Created by IPS-153 on 06/10/22.
//

import UIKit
enum ViewControllerSec {
    case title
    case list
    
    var tableViewDate: (cellId: String,height: CGFloat)  {
        switch self {
        case .title:
            return (cellId:"titleCell",height:UITableView.automaticDimension)
        case .list:
            return (cellId:"listCell",height:UITableView.automaticDimension)
        }
    }
}
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var arrOfFamousFilm: [Results] = []
    var arrSec: [ViewControllerSec] = []
    var viewModel:FetchPopularFilm?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareUI()
    }

}

//MARK: - UI Method
extension ViewController {
    func updateUI() {
        arrSec = arrOfFamousFilm.isEmpty ? [] : [.title,.list]
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func prepareUI() {
        FetchPopularFilm.shared.getPopularFilmData(movieType: "popular") { result in
            self.arrOfFamousFilm = result.results
            self.updateUI()
        }
    }
}

//MARK: - Table View Method
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSec.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let secType = arrSec[section]
        switch secType {
        case .title:
            return 1
        case .list:
            return arrOfFamousFilm.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let secType = arrSec[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: secType.tableViewDate.cellId, for: indexPath) as! FamousFilmTableViewCell
        cell.configure(secType: secType, apiDate: arrOfFamousFilm[indexPath.row])
        return cell
    }
}
