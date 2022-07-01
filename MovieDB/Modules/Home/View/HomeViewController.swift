//
//  HomeViewController.swift
//  MovieDB
//
//  Created by Sergio Murilo on 17/06/22.
//
import UIKit
import SwiftUI

final class HomeViewController: UIViewController {
    
    private var presenter: HomePresenterProtocol = HomePresenter()
    private var sections: [GenreEntity] = [GenreEntity]()
    private var router = MoviesDBRouter()
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "MovieRailCell", bundle: nil), forCellWithReuseIdentifier: "MovieRailCell")
        self.collectionView.register(UINib(nibName: "MovieRailHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "MovieRailHeader")
        self.presenter.setDelegate(delegate: self)
        self.presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieRailCell", for: indexPath) as? MovieRailCell else { return UICollectionViewCell()}
            cell.setUp()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MovieRailHeader", for: indexPath) as? MovieRailHeader else {
            return UICollectionReusableView()}
            header.headerTitle.text = self.sections[indexPath.section].name
            return header
    }
    
    
  //  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  //      print("item at \(indexPath.section)/\(indexPath.item) tapped")
  //    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 150)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


// MARK: - HomePresenterDelegate

extension HomeViewController: HomePresenterDelegate {
    func setUp(sections: [GenreEntity]) {
        self.sections = sections
        self.collectionView.reloadData()
    }
}
