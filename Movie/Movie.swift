//
//  Model.swift
//  Movie
//
//  Created by Anton Levin on 03.12.2020.
//


import UIKit
struct Movie {
    
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    init(title: String, year: String, rate: Double, posterImage: String, overview: String) {
        self.title = title
        self.year = year
        self.rate = rate
        self.posterImage = posterImage
        self.overview = overview
    }
}
