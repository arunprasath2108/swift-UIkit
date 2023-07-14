//
//  Movie.swift
//  MovieCollection
//
//  Created by arun-pt6232 on 27/02/23.
//

import UIKit

struct Movie {
    let title: String
    let image: UIImage
}

let images: [Movie] = [
    Movie(title: "1917", image: UIImage(named: "1917")!),
    Movie(title: "Air Lift", image: UIImage(named: "Airlift")!),
    Movie(title: "Assasian", image: UIImage(named: "assasian")!),
    Movie(title: "Black Mirror", image: UIImage(named: "BlackMirror")!),
    Movie(title: "Dora", image: UIImage(named: "Dora")!),
    Movie(title: "Mad Max", image: UIImage(named: "MadMax")!),
    Movie(title: "Dark Mystery", image: UIImage(named: "mystery")!),
    Movie(title: "Star Wars", image: UIImage(named: "StarWars")!),
]
