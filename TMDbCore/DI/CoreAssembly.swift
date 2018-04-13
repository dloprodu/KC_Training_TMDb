//
//  CoreAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

final public class CoreAssembly {
	private(set) lazy var detailAssembly = DetailAssembly(imageLoadingAssembly: imageLoadingAssembly)
	private(set) lazy var featuredAssembly = FeaturedAssembly(imageLoadingAssembly: imageLoadingAssembly)
	private(set) lazy var searchAssembly = SearchAssembly(imageLoadingAssembly: imageLoadingAssembly)
	private(set) lazy var imageLoadingAssembly = ImageLoadingAssembly(webServiceAssembly: webServiceAssembly)
	private(set) lazy var webServiceAssembly = WebServiceAssembly()

	private let navigationController: UINavigationController

	public init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
}
