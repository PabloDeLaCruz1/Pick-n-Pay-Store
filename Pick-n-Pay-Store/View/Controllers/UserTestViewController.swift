//
//  LandingViewController.swift
//  Pick-n-Pay-Store
//
//  Created by Pablo De La Cruz on 4/1/22.
//

import UIKit

class UserTestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let db = MainDBHelper.init()

    @IBOutlet weak var tableView: UITableView!

    var userData: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)

        fetchUserData()
    }

//    let data = [id: 1]
    func fetchUserData() {
        Service.fetchData { result in
            switch result {
            case .success(let data):
                self.userData = data
                self.tableView.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }

        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTestTableViewCell

        cell.userTestViewModel = UserTestViewModel(userData[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
}
