//
//  NetworkServices.swift
//  RickAndMorty-Characters
//
//  Created by ilia nikashov on 17.04.2022.
//

import Foundation
import UIKit

class NetworkServises {
    
    var completion: (([Character]) -> Void)?
    var baseURL = "https://rickandmortyapi.com/api/character/?page="
    var pageNumber = 1
    
    
    func fetchCharacters(with baseURL: String?) {
        if let baseURL = baseURL {
            request(with: baseURL)
        } else {
            print("Error")
        }
    }
    
    func nextPage() {
        let page = pageNumber + 1
        fetchCharacters(with: baseURL + String(page))
        print("\(baseURL + String(page))")
        pageNumber = page
    }
    
    func prevPage() {
        let page = pageNumber - 1
        fetchCharacters(with: baseURL + String(page))
        print("\(baseURL + String(page))")
        pageNumber = page
    }

                     
    func request(with URLreq: String) {
        guard let url = URL(string: URLreq) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let characters = self.parseJSON(with: data) {
                    DispatchQueue.main.async {
                        self.completion?(characters)
                    }
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(with data: Data) -> [Character]? {
        let decoder = JSONDecoder()
        do {
            let rickAndmorty = try decoder.decode(RickAndMortyResults.self, from: data)
            var characters = [Character]()
            for character in rickAndmorty.results {
                guard let character = Character(characterInfo: character) else {
                    return nil
                }
                characters.append(character)
            }
            return characters
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func getImage(with character: Character, in imageView: UIImageView) {
        imageView.image = UIImage(named: "icon")
        let url = URL(string: character.image)
        DispatchQueue.main.async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data!)
            }
        }
    }
}
