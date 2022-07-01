//
//  MovieRailCell.swift
//  MovieDB
//
//  Created by Sergio Murilo on 17/06/22.
//

import UIKit

final class MovieRailCell: UICollectionViewCell {
    
    private let images = [
                 "https://s2.glbimg.com/lpdFI6vFwfkhAwJycRv7hTRQXGY=/200x304/https://s2.glbimg.com/Rc59Y92u-MWWOQgvVgicRmU87SQ=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2021/e/E/G0ka1KTBqfz5RLAAtSSA/2021-1925-doc-juliette-poster.jpg",
                 "https://s2.glbimg.com/OEK2k3vbSvXfLJWiPltXRuE3hQA=/200x304/https://s2.glbimg.com/IWh7J9NeOamm06ps1pJizKB7reM=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2022/Q/q/6H1W4rRYK5oE6C1DxYcQ/2022-2615-click-bbb-poster.jpg",
                 "https://s2.glbimg.com/cUpgWJuhonwqtzrRMeQP81xTmT8=/200x304/https://s2.glbimg.com/v9g07mxgVoCfkkWClIR2y6m3C8Q=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2021/P/c/HtMPDJQFC625qrY4fJNQ/2021-2058-835-nos-tempos-do-imperador-poster.jpg",
                 "https://s2.glbimg.com/nA11BkDi4Ca_ENqT5aqFJKvMsbk=/200x304/https://s2.glbimg.com/dMGoziJcnfJOCKllDVp3T4yP0Zs=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2022/s/0/QAdBKgRDCNq2dDuF4Dbg/2021-2661-alem-da-ilusao-poster.jpg",
                 "https://s2.glbimg.com/tjZ7RV1O2b9eOPyv3Av7xrYU4Pw=/200x304/https://s2.glbimg.com/87aOxOVPt0J9XaKJe3ocMcKISJo=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2021/E/8/WBbmwmSW6N59Wsi916lw/2021-2457-marighella-poster-globoplay-globoplay.jpg",
                 "https://s2.glbimg.com/nA11BkDi4Ca_ENqT5aqFJKvMsbk=/200x304/https://s2.glbimg.com/dMGoziJcnfJOCKllDVp3T4yP0Zs=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2022/s/0/QAdBKgRDCNq2dDuF4Dbg/2021-2661-alem-da-ilusao-poster.jpg",
                 "https://s2.glbimg.com/cUpgWJuhonwqtzrRMeQP81xTmT8=/200x304/https://s2.glbimg.com/v9g07mxgVoCfkkWClIR2y6m3C8Q=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2021/P/c/HtMPDJQFC625qrY4fJNQ/2021-2058-835-nos-tempos-do-imperador-poster.jpg",
                 "https://s2.glbimg.com/OEK2k3vbSvXfLJWiPltXRuE3hQA=/200x304/https://s2.glbimg.com/IWh7J9NeOamm06ps1pJizKB7reM=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2022/Q/q/6H1W4rRYK5oE6C1DxYcQ/2022-2615-click-bbb-poster.jpg",
                 "https://s2.glbimg.com/lpdFI6vFwfkhAwJycRv7hTRQXGY=/200x304/https://s2.glbimg.com/Rc59Y92u-MWWOQgvVgicRmU87SQ=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2021/e/E/G0ka1KTBqfz5RLAAtSSA/2021-1925-doc-juliette-poster.jpg",
                 "https://s2.glbimg.com/bKo7kGtrBMkDBbw3-Vr3ay0G2EU=/200x304/https://s2.glbimg.com/HixZa4AIJZrcTlr-mdIU5qcqU3M=/i.s3.glbimg.com/v1/AUTH_c3c606ff68e7478091d1ca496f9c5625/internal_photos/bs/2022/d/4/bdpNPPTlufAKF2vzw2Sg/2022-2752-pantanal-poster.jpg"
                ]
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    func setUp() {
        collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        self.collectionView.contentInset = UIEdgeInsets(top: 0,
                                                        left: 16,
                                                        bottom: 0,
                                                        right: 0)
        
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension MovieRailCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UICollectionViewCell()}
        cell.setUp(link: images[indexPath.row], tag: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MovieRailCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 100
        return CGSize(width: width, height: 100 / (2/3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
