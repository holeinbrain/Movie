//
//  ViewController.swift
//  Movie
//
//  Created by Anton Levin on 01.12.2020.
//

import UIKit
class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var data1:[NSDictionary]!
    var output:[String:Any]!
    var data = [Movie]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output = DataManager.shared.taskDetails(type: "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=ru-US&page=1&")
        //print(output)
        data1 = (output["results"] as! [NSDictionary])
        for result in data1{
            let title =  result["original_title"] as! String
            let year =  result["release_date"] as! String
            let overview =  result["overview"] as! String
            let rating =  result["vote_average"] as! Double
            let posterImage = result["poster_path"] as! String
            
            let details = Movie(title: title, year: year, rate: rating, posterImage: posterImage, overview: overview)
            data.append(details)
            //print(rating)
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.count + 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let dataArr = data[indexPath.row]
        cell.title.text = dataArr.title
        cell.rating.text = String(dataArr.rate!)
        cell.year.text = dataArr.year
        //cell.overview.text = dataArr.overview
        
        let image1 = dataArr.posterImage
        
        var imageUrlString = "https://image.tmdb.org/t/p/w300" + image1!
        
        imageUrlString = imageUrlString.replacingOccurrences(of: " ", with: "%20")
        if let url = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.moviePoster.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
   // func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
  //      return 170
  //  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show" {
            if let indexPath = tableView.indexPathForSelectedRow  {
                let detailsVC = segue.destination as! DetailViewController
                let dataArrey = data[indexPath.row]
                detailsVC.lableTitle = dataArrey.title
                detailsVC.detailText = dataArrey.overview
                let image2 = dataArrey.posterImage
                
                var imageUrlString = "https://image.tmdb.org/t/p/w300" + image2!
                
                imageUrlString = imageUrlString.replacingOccurrences(of: " ", with: "%20")
                if let url = URL(string: imageUrlString) {
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        if let data = data {
                            DispatchQueue.main.async {
                                detailsVC.imageDetail.image = UIImage(data: data)
                            }
                        }
                    }.resume()
                }
            }
        }
    }
}

