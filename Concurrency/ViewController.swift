//
//  ViewController.swift
//  Concurrency
//
//  Created by user on 2023/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    @IBOutlet weak var progression1: UIProgressView!
    @IBOutlet weak var progression2: UIProgressView!
    @IBOutlet weak var progression3: UIProgressView!
    @IBOutlet weak var progression4: UIProgressView!
    @IBOutlet weak var progression5: UIProgressView!
    
    let defaultImage = UIImage(systemName: "photo")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func getImageFromURL(url: URL, completion: @escaping (UIImage) -> ()) {

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else { return }
            guard let image = UIImage(data: imageData) else { return }
            completion(image)
        }.resume()
    }
    
    @IBAction func loadImage1(_ sender: Any) {
        image1.image = defaultImage
        
        guard let url = URL(string: "https://images.pexels.com/photos/51311/cow-calf-cattle-stock-51311.jpeg?cs=srgb&dl=pexels-pixabay-51311.jpg&fm=jpg") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let imageData = data else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image1.image = image
            }
        }.resume()
    }
    
    @IBAction func loadImage2(_ sender: UIButton) {
        image2.image = defaultImage
        
        guard let url = URL(string: "https://images.unsplash.com/photo-1474511320723-9a56873867b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YW5pbWFsfGVufDB8fDB8fA%3D%3D&w=1000&q=80") else { return }
        
        getImageFromURL(url: url) { image in
            DispatchQueue.main.async {
                self.image2.image = image
            }
        }
    }
    
    @IBAction func loadImage3(_ sender: UIButton) {
        image3.image = defaultImage
        
        guard let url = URL(string: "https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267__340.jpg") else { return }
        
        getImageFromURL(url: url) { image in
            DispatchQueue.main.async {
                self.image3.image = image
            }
        }
    }
    
    @IBAction func loadImage4(_ sender: UIButton) {
        image4.image = defaultImage
        
        guard let url = URL(string: "https://media.wired.com/photos/593261cab8eb31692072f129/master/w_2560%2Cc_limit/85120553.jpg") else { return }
        
        getImageFromURL(url: url) { image in
            DispatchQueue.main.async {
                self.image4.image = image
            }
        }
    }
    
    @IBAction func loadImage5(_ sender: UIButton) {
        image5.image = defaultImage
        
        guard let url = URL(string: "https://cdn.britannica.com/01/206301-050-AE5BE1A7/white-goat.jpg") else { return }
        
        getImageFromURL(url: url) { image in
            DispatchQueue.main.async {
                self.image5.image = image
            }
        }
    }
    
}
