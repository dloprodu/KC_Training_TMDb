
import TMDbCore
import RxSwift

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct RandomUserResponse: Decodable {
    struct User: Decodable {
        struct Name: Decodable {
            let title: String
            let first: String
            let last: String
        }
        
        struct Picture: Decodable {
            // let large: URL
            let imageURL: URL
            
            private enum CodingKeys: String, CodingKey {
                case imageURL = "large"
            }
        }
        
        let name: Name
        let picture: Picture
    }
    
    let results: [User]
}


let randomUserApiUrl = URL(string: "https:randomuser.me/api")!
let session = URLSession(configuration: .default)
let decoder = JSONDecoder()

func getRandomUserResponse(completion: @escaping (RandomUserResponse?, Error?) -> Void ) {
    let task = session.dataTask(with: randomUserApiUrl) { (data, response, error) in
        if let data = data,
           let result = try? decoder.decode(RandomUserResponse.self, from: data) {
           completion(result, nil)
        } else {
            completion(nil, error)
        }
    }
    
    task.resume()
}

func getImage(for url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
    let task = session.dataTask(with: url) { (data, response, error) in
        if let data = data, let image = UIImage(data: data) {
            completion(image, nil)
        } else {
            completion(nil, error)
        }
    }
    
    task.resume()
}

func getRandomUserImage(completion: @escaping (UIImage?, Error?) -> Void) {
    getRandomUserResponse { (response, error) in
        guard let response = response else {
            completion(nil, error)
            return
        }
        
        getImage(for: response.results[0].picture.imageURL, completion: completion)
    }
}

getRandomUserImage { (image, error) in
    if let image = image {
        print(image)
    } else {
        print(error ?? "error")
    }
}
