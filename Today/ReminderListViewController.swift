//
//  ViewController.swift
//  Today
//
//  Created by Betanyeli Bravo on 23-01-23.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource <Int, String>
    var dataSource: DataSource!
    // uiController !== uiCollectionViewCntroller, son !==, !== cosos de vida, como para hacer listados, grids, obj
    override func viewDidLoad() { // its like a hook, like a componentDidMount
        super.viewDidLoad()
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        // es legal en swift xD por el hard typing
        // Do any additional setup after loading the view.
        let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
        }
    }
    
    private func listLayout () -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

