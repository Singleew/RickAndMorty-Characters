//
//  CharactersModel.swift
//  RickAndMorty-Characters
//
//  Created by ilia nikashov on 17.04.2022.
//

import Foundation

struct RickAndMortyResults: Codable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let pages: Int
    let next: String?
    let prev: String?
}

struct Result: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
//    let url: String
}

struct Episode: Codable {
    let name: String
//    let date: String
//    let episode: String
//    let characters: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case date = "air_date"
//        case episode = "episode"
//        case characters = "characters"
//    }
}


struct Character: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
    var episodesNumber: String {
        return String(episode.count)
    }

    init?(characterInfo: Result) {
        name = characterInfo.name
        status = characterInfo.status
        species = characterInfo.species
        gender = characterInfo.gender
        origin = characterInfo.origin.name
        location = characterInfo.location.name
        image = characterInfo.image
        episode = characterInfo.episode
        url = characterInfo.url
        created = characterInfo.created
    }
}
