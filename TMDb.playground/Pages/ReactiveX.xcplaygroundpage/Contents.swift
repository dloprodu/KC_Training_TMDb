
import TMDbCore
import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum APIError: Error {
    case invalidKey
    case notAnImage
}

let some = Observable.from(["😀", "😒", "😎"]) // Emojis: Ctrl + Cmd + space
let empy = Observable<Int>.empty()
let error = Observable<Int>.error(APIError.invalidKey)
let single = Observable.just("Hola k ase, programa")

let hello = Observable<String>.create { observer in
    observer.onNext("Hello")
    observer.onNext("world")
    observer.onCompleted()
    
    return Disposables.create()
}

let promise = Observable<String>.create { observer in
    observer.onNext("Hello")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        observer.onNext("Five seconds later")
        observer.onCompleted()
    }
    
    return Disposables.create()
}

func doSomethingInTheFeature(completion: (String) -> Void) {
    
}

promise.subscribe { event in
    switch event {
    case .next(let value):
        print("next \(value)")
    case .error(let error):
        print("error \(error)")
    case .completed:
        print("completed")
    }
}
