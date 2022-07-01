//
//  HomePresenter.swift
//  MovieDB
//
//  Created by Sergio Murilo on 17/06/22.
//

// MARK: - Protocols

protocol HomePresenterProtocol {
    func viewDidLoad()
    func setDelegate(delegate: HomePresenterDelegate)
}

// MARK: - Delegates

protocol HomePresenterDelegate: AnyObject {
    func setUp(sections: [GenreEntity])
}

final class HomePresenter {
    
    let movieListInteractor: MovieListInteractorProtocol = MovieListInteractor()
    var delegate: HomePresenterDelegate?
    
    init() {
        self.movieListInteractor.setDelegate(delegate: self)
    }
}


// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    func setDelegate(delegate: HomePresenterDelegate) {
        self.delegate = delegate
    }
    func viewDidLoad() {
        self.movieListInteractor.fetch()
    }
}


// MARK: - MovieListInteractorDelegate

extension HomePresenter: MovieListInteractorDelegate {
    func didFetch(sections: [GenreEntity]) {
        self.delegate?.setUp(sections: sections)
    }
}
