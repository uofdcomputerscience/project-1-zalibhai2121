//
//  MercuryCell.swift
//  MercuryBrowser
//
//  Created by Zainab Alibhai on 10/9/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class MercuryCell: UITableViewCell {
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var mercurycell: UILabel!
    @IBOutlet weak var mercuryImafe: UIImageView!
    
    
     func getImage(for url: URL, completion: @escaping ((URL, UIImage) -> Void)) {
        // download the image, and call the completion with the url and image.
        // the cell can then verify that the image being returned is the one
        // requested.
        // you may even keep a dictionary of results, and then call the completion
        // with an entry from that dictionary, if one exists, otherwise make the
        // network call and store its result in the dictionary as well as calling
        // the completion. This would allow the _second_ call for any image to not
        // perform a network operation!
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: url) { (data, response, error) in
           if let data = data {
               let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.mercuryImafe.image = image
            }
            }
        }
        task.resume()
    }
}
