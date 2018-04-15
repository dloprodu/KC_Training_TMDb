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


let webService = WebService(configuration: .default)
webService.load(Configuration.self, from: .configuration)
    .subscribe(onNext: {
        print($0)
    }, onError: { error in
        print(error)
    })

enum TestError: Error {
    case imageNotFound
}

webService.load(Page<Show>.self, from: .showsOnTheAir(page: 1))
    .flatMap { page -> Observable<UIImage> in
        guard let backdropPath = page.results.first?.backdropPath else {
            throw TestError.imageNotFound
        }
        
        return imageRepository.image(at: backdropPath, size: .original)
    }
    .subscribe { event in
        switch event {
        case .next(let image):
            print(image)
        case .error(let error):
            print(error)
        case .completed:
            print("completed")
        }
    }
