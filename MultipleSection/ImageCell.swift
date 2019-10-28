//
//  ImageCell.swift
//  MultipleSection
//
//  Created by Raul Armas Santiago on 10/10/19.
//  Copyright © 2019 Sento40. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var images: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IconsCell
        
        if let imageName = images?[indexPath.item]{
            cell.imageView.image = UIImage(named: imageName)
        }
        
        return cell
    }
    
    // Tamaño de la celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 20)
    }
    
    // espacio entre las celdas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    let cellId = " cellId"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(collectionView)
        
        collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private class IconsCell: UICollectionViewCell {
    
        let imageView: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            image.layer.cornerRadius = 15
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
    
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup() {
            
            //setCellShadow()
            
            addSubview(imageView)
            
            imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            /*
            imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true*/
        }
    }
}
