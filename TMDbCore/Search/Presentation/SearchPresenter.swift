//
//  SearchPresenter.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

/// Presents search results
final class SearchPresenter {

	/// The search query
	let query = Variable("")

    private let detailNavigator: DetailNavigator
    
    init(detailNavigator: DetailNavigator) {
        self.detailNavigator = detailNavigator
    }
    
	/// The search results
	private(set) lazy var searchResults: Observable<[SearchResult]> = Observable
		// TODO: implement
		.just([.movie(Movie(identifier: 330459,
							title: "Rogue One: A Star Wars Story",
							posterPath: "/qjiskwlV1qQzRCjpV0cL9pEMF9a.jpg",
							backdropPath: "/tZjVVIYXACV4IIIhXeIM59ytqwS.jpg",
							releaseDate: Date(timeIntervalSince1970: 1474905532),
							genreIdentifiers: [28, 12, 878]))])

	/// Called by the view when the user selects a search result
	func didSelect(searchResult: SearchResult) {
        switch searchResult {
        case .movie(let movie):
            detailNavigator.navigateToMovie(withIdentifier: movie.identifier)
        case .show(let show):
            detailNavigator.navigateToShow(withIdentifier: show.identifier)
        case .person(let person):
            // TODO
            print("[Exercise] Navigate to person with identifier \(person.identifier)")
        }
	}
}
