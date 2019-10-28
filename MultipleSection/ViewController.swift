//
//  ViewController.swift
//  MultipleSection
//
//  Created by Raul Armas Santiago on 10/10/19.
//  Copyright © 2019 Sento40. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor   = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    // CLOUSER
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "bg")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let imagesCellId = "imagesCellId" // Identificadores para los cell del banner
    
    let albumsCellId = "albumsCellId" // Identificador para los cell del collection view que viene de albumsCell
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Aqui definimos el numero de elementos por seccion y pasamos la cantidad de elementos que tenemos en el arreglo albumsArray definido mas abajo
        if section == 1 {
            return albumsArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath) as! AlbumsCell // Decimos que vamos a ultilixar del archivo AlbumsCell
            // Agregamos a la cell el elementos de indexPath
            cell.album = albumsArray[indexPath.item]
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId, for: indexPath) as! ImageCell // Decimos que vamos a ultilixar del archivo AlbumsCell
        // Agregamos a la cell el elementos de indexPath
        cell.images = imagesArray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width / 3) - 16, height: 100)
        }
        
        return CGSize(width: (view.frame.width), height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    
    let imagesArray = ["ny1","ny1","ny3","ny4","ny5"]
    let albumsArray = ["al1", "al2", "al3", "al4", "al5", "al6", "al7", "al8", "al9", "al1", "al2", "al3", "al4", "al5", "al6", "al7", "al8", "al9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: imagesCellId)
        collectionView.register(AlbumsCell.self, forCellWithReuseIdentifier: albumsCellId)
        
        
        setupViews()
    }
    
    func setupViews(){
        
        
        view.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor/*, constant: 150*/ ).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
 
        
        /*backgroundImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)*/
        
        view.addSubview(collectionView)
        /*collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)*/
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        //backgroundImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        //backgroundImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        //backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    

}

