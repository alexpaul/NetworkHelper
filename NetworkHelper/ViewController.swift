//
//  ViewController.swift
//  NetworkHelper
//
//  Created by Alex Paul on 12/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  // TODO: table view loads podcasts
  // show artistName and collectionNam, use subtitle cell style
  var podcasts = [Podcast]() {
    didSet {
      DispatchQueue.main.async {
       // self.tableView.reloadData()
      }
    }
  }
  
  let urlString = "https://www.billboard.com/files/styles/article_main_image/public/media/Rockefeller-Center-Christmas-Tree-2017-billboard-1548.jpg"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // does not compile since initializer is private
    //let networkHelper = NetworkHelper()
    //loadJokes()
    
    loadPodcasts()
  }

  @IBAction func loadImagePressed(_ sender: UIBarButtonItem) {
    NetworkHelper.shared.performDataTask(with: urlString) { [weak self] (result) in
      switch result {
      case .failure(let appError):
        print("appError: \(appError)")
      case .success(let data):
        let image = UIImage(data: data)
        
        DispatchQueue.main.async {
           self?.imageView.image = image
        }
      }
    }
  }
  
  func loadPodcasts() {
    PodcastAPIClient.getPodcasts { [weak self] (result) in
      switch result {
      case .failure(let appError):
        print("appError: \(appError)")
      case .success(let podcasts):
        print("\(podcasts.count) was found")
        self?.podcasts = podcasts
      }
    }
  }
  
  func loadJokes() {
    // TODO: refactor to use a completion handler
    let jokes = JokeAPIClient.getJokes()
    print("loadJokes: \(jokes.count)")
  }
  
}

