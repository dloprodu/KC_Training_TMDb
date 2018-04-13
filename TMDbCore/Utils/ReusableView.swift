//
//  ReusableView.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 13/04/2018.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import UIKit

protocol ReusableView: class {
	static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {

	static var defaultReuseIdentifier: String {
		return String(describing: self)
	}
}
