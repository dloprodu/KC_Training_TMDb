//
//  PushDetailNavigator.swift
//  TMDbCore
//
//  Created by David Lopez Rodriguez on 14/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PushDetailNavigator {
    
    private let navigationController: UINavigationController
    
    // Como no se puede inyectar un assembly directamente en las clases de nuestro proyecto
    // definimos un protocolo que implementara el assebly, y será una eesntacia de este protocolo,
    // lo que injectemos (Providers).
    private unowned let detailViewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController,
         detailViewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.detailViewControllerProvider = detailViewControllerProvider
    }
}

extension PushDetailNavigator : DetailNavigator {
    func navigateToShow(withIdentifier identifier: Int64) {
        let detailViewController = detailViewControllerProvider.showViewController(withIdentifier: identifier)
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func navigateToMovie(withIdentifier identifier: Int64) {
        let detailViewController = detailViewControllerProvider.movieViewController(withIdentifier: identifier)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
