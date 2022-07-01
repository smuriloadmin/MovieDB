//
//  MovieAdapter.swift
//  MovieDB
//
//  Created by Sergio Murilo on 17/06/22.
//

import Alamofire
import Foundation
import UIKit

protocol MovieAdapterProtocol {
    func fetch(completion: @escaping(GenreListEntity) -> Void)
}
                            
final class MovieAdapter {
    
}


// MARK: - MovieAdapterProtocol

extension MovieAdapter: MovieAdapterProtocol {
    func fetch(completion: @escaping(GenreListEntity) -> Void){
        let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=a147283dfccdd46ac7fc8d3e2c0d4649&language=pt-BR"
        Alamofire.request(url, method: .get)
         .responseJSON{(response) in
           print (response)
           switch response.result{
           case .success:
               guard let json = response.result.value else {return}
               let decoder = JSONDecoder()
               do {
                   let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                   let listGernes = try decoder.decode(GenreListEntity.self, from: data)
                   completion(listGernes)
               } catch let jsonError{
                   
               }
               
           case .failure(let error):
                  print (error)
          }
       }
    }
}
