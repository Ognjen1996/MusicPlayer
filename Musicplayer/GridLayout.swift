//
//  GridLayout.swift
//  Tehnomanija
//
//  Created by Lazar Andonov on 22.3.21..
//  Copyright © 2021 Lazar Andonov. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        self.itemSize = CGSize(width: 150, height: 150)
        self.minimumInteritemSpacing = 5
        self.minimumLineSpacing = 5
        self.sectionInset = .zero
        self.scrollDirection = .vertical
        
    }
}
