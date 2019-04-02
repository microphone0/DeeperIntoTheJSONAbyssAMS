//
//  DetailViewController.swift
//  DeeperIntoTheJSONAbyss
//
//  Created by Adam Saxton on 3/18/19.
//  Copyright © 2019 Adam Saxton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    @IBOutlet weak var studio: UILabel!
    @IBOutlet weak var contentDescription: UILabel!
    @IBOutlet weak var summary: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
            if let episodes = detail.episode {
                episodesLabel.text = "\(episodes)"
            }
            
            let url = URL(string: detail.imageURL)
            let data = try! Data(contentsOf: url!)
            let image = UIImage(data: data)
            picture.image = image
            
            if let end = detail.yearEnd {
                year.text = detail.yearStart + " - " + end
            } else {
                year.text = detail.yearStart
            }
            
            contentTitle.text = detail.name
            format.text = detail.format
            studio.text = detail.studio
            contentDescription.text = detail.description
            summary.text = detail.summary
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureView()
    }

    var detailItem: Entry? {
        didSet {
            // Update the view.
            //configureView()
        }
    }


}
