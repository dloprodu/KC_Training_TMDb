@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly(navigationController: UINavigationController())
let imageRepository = assembly.imageLoadingAssembly.imageRepository

imageRepository.image(at: "iTgmsxuZKOQI0tlZmTbmTZWcLwW.jpg", size: .w780)
	.subscribe(onNext: {
		let image = $0
		print(image)
	})
	.disposed(by: disposeBag)
