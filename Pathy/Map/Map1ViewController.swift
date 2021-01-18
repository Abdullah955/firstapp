

//
//  Map1ViewController.swift
//  Pathy
//
//  Created by Abdullah Alatter on 17/01/2021.
//

import UIKit
import MapKit

class Map1ViewController: UIViewController {

    @IBOutlet weak var maView: MKMapView!
    @IBOutlet var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

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



}


extension Map1ViewController: UISearchBarDelegate {

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty == false {
                searchBar.setShowsCancelButton(true, animated: true)

                // whatever extra stuff you need to do
            } else {
                searchBar.setShowsCancelButton(false, animated: true)

                // whatever extra stuff you need to do
            }
            // whatever extra stuff you need to do
        }

    }


