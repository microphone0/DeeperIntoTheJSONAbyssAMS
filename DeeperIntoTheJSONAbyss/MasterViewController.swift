//
//  MasterViewController.swift
//  DeeperIntoTheJSONAbyss
//
//  Created by Adam Saxton on 3/18/19.
//  Copyright © 2019 Adam Saxton. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let dataController = MovieDataController()
    var rebootDataModel: MovieDataModel? {
        didSet {
            //Do the things
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        //Change the label in nav bar to an image
        let titleImage = UIImage(named: "IRDBlogo.png")
        let titleImageView = UIImageView(image: titleImage)
        navigationItem.titleView = titleImageView
        
        dataController.getRebootData(completion:{
            dataModel in
            self.rebootDataModel = dataModel
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object =
                    rebootDataModel!.franchise[indexPath.section].entries[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (rebootDataModel?.franchise.count) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (rebootDataModel?.franchise[section].franchiseName) ?? "No data yet"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (rebootDataModel?.franchise[section].entries.count) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let mediaName = (rebootDataModel?.franchise[indexPath.section].entries[indexPath.row].name)!
        cell.textLabel!.text = mediaName
        
        let mediaYear = (rebootDataModel?.franchise[indexPath.section].entries[indexPath.row].yearStart)!
        cell.detailTextLabel!.text = mediaYear

        return cell
    }
}

