//
//  DetailViewController.swift
//  Movie
//
//  Created by Anton Levin on 07.12.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageDetail: UIImageView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var detailLable: UILabel!
    var imageView: UIImage?
    var lableTitle: String?
    var detailText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDetail.image = imageView
        titleLable.text = lableTitle
        detailLable.text = detailText
        detailLable.numberOfLines = 0
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
