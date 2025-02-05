//
//  PhotoDetailsViewController.swift
//  Eventa
//
//  Created by Vinod P on 05/02/25.
//
import UIKit
import SDWebImage

class PhotoDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploaderLabel: UILabel!
    
    var image: ImageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image {
            imageView.sd_setImage(with: URL(string: image.imageUrl), placeholderImage: UIImage(named: "placeholder"))
            uploaderLabel.text = "Added by \(image.uploaderName)"
        }
    }
}



//import UIKit
//
//class PhotoDetailsViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
