//
//  TitlePresenter.swift
//  MovieDB
//
//  Created by Sergio Murilo on 01/07/22.
//


// MARK: - Protocols

protocol TitlePresenterProtocol {
    func viewDidLoad()
    func setDelegate(delegate: TitlePresenterDelegate)
}

// MARK: - Delegates

protocol TitlePresenterDelegate: AnyObject {
    func setUp(sections: [GenreEntity])
}

final class TitlePresenter: TitletInteractorDelegate {
    func didFetch(sections: [GenreEntity]) {
        self.delegate?.setUp(sections: sections)
    }
    
    let titleInteractor: TitleInteractorProtocol = TitleInteractor()
    var delegate: TitlePresenterDelegate?
    
    init() {
        self.titleInteractor.setDelegate(delegate: self)
    }
}


// MARK: - TitlePresenterProtocol

extension TitlePresenter: TitlePresenterProtocol {
    func setDelegate(delegate: TitlePresenterDelegate) {
        self.delegate = delegate
    }
    func viewDidLoad() {
        self.titleInteractor.fetch()
    }
}

