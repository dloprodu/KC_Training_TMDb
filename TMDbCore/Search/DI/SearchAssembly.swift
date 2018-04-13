//
//  SearchAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class SearchAssembly {
	private let imageLoadingAssembly: ImageLoadingAssembly

	init(imageLoadingAssembly: ImageLoadingAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
	}

	func presenter() -> SearchPresenter {
		return SearchPresenter()
	}

	func resultPresenter() -> SearchResultPresenter {
		return SearchResultPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
}

extension SearchAssembly: SearchViewControllerProvider {
	func searchViewController() -> UIViewController {
		return SearchViewController(presenter: presenter(), resultPresenter: resultPresenter())
	}
}
