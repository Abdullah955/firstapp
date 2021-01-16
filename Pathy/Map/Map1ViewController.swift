//
//  Map1ViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 17/01/2021.
//

import UIKit
import MapKit

class Map1ViewController: UIViewController,UISearchBarDelegate {
    
    @IBOutlet weak var maView: MKMapView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 90
        let mapWidth:CGFloat = 414 // view.width
        let mapHeight:CGFloat = 530 // view.height - 50

        view.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)

//        view.frame =

        // Do any additional setup after loading the view.
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.becomeFirstResponder()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchBar.text!){
            (placemarks:[CLPlacemark]?, error:Error? ) in
            
            if error ==  nil{
                let placemark = placemarks?.first
                let anno = MKPointAnnotation()
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = searchBar.text!
                
                self.maView.addAnnotation(anno)
                self.maView.selectAnnotation(anno, animated: true)
                
                print(searchBar.bottom)
                print(searchBar.top)
                
            }
            
            else {print(error?.localizedDescription ?? "error")}
        }
        //print("Searchig ...",searchBar.text )
    }
    
    
    
    
    
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
