//
//  MovieListInteractor.swift
//  MovieDB
//
//  Created by Sergio Murilo on 17/06/22.
//


// MARK: - MovieListInteractorProtocol

protocol MovieListInteractorProtocol {
    func fetch()
    func setDelegate(delegate: MovieListInteractorDelegate)
}


// MARK: - MovieListintarectorDelegate

protocol MovieListInteractorDelegate: AnyObject {
    func didFetch(sections: [GenreEntity])
}

final class MovieListInteractor {
    var delegate: MovieListInteractorDelegate?
}


// MARK: - MovieListInteractorProtocol

extension MovieListInteractor: MovieListInteractorProtocol {

    func setDelegate(delegate: MovieListInteractorDelegate) {
        self.delegate = delegate
    }
    
    func fetch() {
        let movieAdapter = MovieAdapter()
        movieAdapter.fetch(completion: self.didCompleteMovieAdapter)
    }
    
    private func didCompleteMovieAdapter(genreListEntity: GenreListEntity) {
        self.delegate?.didFetch(sections: genreListEntity.genres)
        
    }
}
