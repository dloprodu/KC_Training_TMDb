//
//  DetailNavigation.swift
//  TMDbCore
//
//  Created by David Lopez Rodriguez on 14/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
    func navigateToShow(withIdentifier identifier: Int64)
    func navigateToMovie(withIdentifier identifier: Int64)
}
