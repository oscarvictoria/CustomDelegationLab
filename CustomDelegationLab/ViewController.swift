//
//  ViewController.swift
//  CustomDelegationLab
//
//  Created by Oscar Victoria Gonzalez  on 1/27/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var fontSize: CGFloat = 24 {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        movies = Movie.allMovies
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fontVC = segue.destination as? FontViewController else {
            fatalError("Error")
        }
        fontVC.font = Double(fontSize)
        fontVC.delegate = self
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.textLabel?.font = UIFont.systemFont(ofSize: fontSize)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return cell
    }
}

extension ViewController: FontSize {
    func changeSize(_ fontVC: FontViewController, fontSize: Float) {
        self.fontSize = CGFloat(fontSize)
    }
}
