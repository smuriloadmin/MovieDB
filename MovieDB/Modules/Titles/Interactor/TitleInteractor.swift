//
//  TitleInteractor.swift
//  MovieDB
//
//  Created by Sergio Murilo on 01/07/22.
//


// MARK: - TitleInteractorProtocol

protocol TitleInteractorProtocol {
    func fetch()
    func setDelegate(delegate: TitletInteractorDelegate)
}


// MARK: - TitleintarectorDelegate

protocol TitletInteractorDelegate: AnyObject {
    func didFetch(sections: [GenreEntity])
}

final class TitleInteractor {
    var delegate: TitletInteractorDelegate?
}


// MARK: - TitleInteractorProtocol

extension TitleInteractor: TitleInteractorProtocol {

    func setDelegate(delegate: TitletInteractorDelegate) {
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
