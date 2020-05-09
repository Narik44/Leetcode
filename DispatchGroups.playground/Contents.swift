import Foundation
import UIKit

struct Users: Decodable {
    let avatar_url: String
}

class ViewModel {
    
    let imageCache = NSCache<NSString,UIImage>()
    let urlSession = URLSession(configuration: .default)
    
    func loadImage(url:String, _ completion: @escaping ()->()){
        let dataTask = urlSession.dataTask(with: URL(string: url)!) {[weak self] (data,response,error) in
            print("here start \(url) \(Thread.current)")
            Thread.sleep(forTimeInterval: Double.random(in: 0...3))
            if let response = response as? HTTPURLResponse , response.statusCode == 200 {
                let image = UIImage(data: data!)
                self?.imageCache.setObject(image!, forKey: url as NSString)
                completion()
            } else {
                print("here finish\(url) \(Thread.current)")
                completion()
            }
        }
        dataTask.resume()
    }
    
    
    //   func loadImage(url:String, _ completion: @escaping ()->()){
    //       URLSession.shared.dataTask(with: URL(string: url)!) {[weak self] (data,response,error) in
    //           print("starting \(url) \(Thread.current)")
    //           Thread.sleep(forTimeInterval: Double.random(in: 0...3))
    //           if let response = response as? HTTPURLResponse , response.statusCode == 200 {
    //               let image = UIImage(data: data!)
    //               self?.imageCache.setObject(image!, forKey: url as NSString)
    //               completion()
    //           } else {
    //               print("finishing \(url) \(Thread.current)")
    //               completion()
    //           }
    //       }.resume()
    //   }
    
    func getUserImages() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let dispatchGroup = DispatchGroup()
            
            print("herer \(Thread.current)")
            var userAvatorsToLoad: [String] = []
            let url =  URL(string:"https://api.github.com/users")!
            dispatchGroup.enter()
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let response = response as? HTTPURLResponse , response.statusCode == 200 {
                    print("her\(Thread.current)")
                    let userResponse = try? JSONDecoder().decode([Users].self, from: data!)
                    userAvatorsToLoad.append(contentsOf:[userResponse![0].avatar_url,
                                                         userResponse![1].avatar_url,
                                                         userResponse![2].avatar_url])
                    userAvatorsToLoad.forEach {[weak self] (imageUrl) in
                        self?.loadImage(url: imageUrl) {
                            print("image Successfully cached")
                        }
                    }
                }
                dispatchGroup.leave()
            }.resume()
            
            dispatchGroup.wait()
            print("hello")
        }
    }
}
    
    let viewModel = ViewModel()
    viewModel.getUserImages()


