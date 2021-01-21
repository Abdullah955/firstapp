//

import UIKit
import MapKit
import CoreLocation



                                    

class MapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {

//    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var UItable: UITableView!
//    @IBOutlet var searchBar: UISearchBar!
    let mySearchBar =  UISearchBar()
    var mapView: MKMapView!

  
    
//    let locationManager = CLLocationManager()
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurMapView()
        configurSearchBar()
        self.view.addSubview(mySearchBar)
        mySearchBar.delegate = self


//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestLocation()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func configurMapView() {
        mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.height/3)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        self.view.addSubview(mapView)
    }
    
    func configurSearchBar() {
        
        mySearchBar.frame = CGRect(x: 0, y: mapView.top + 10 , width: view.frame.size.width, height: 50)
        mySearchBar.showsCancelButton = true
        mySearchBar.placeholder = "Search .."
        mySearchBar.searchBarStyle = .minimal
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    
    @objc func searchBarSearchButtonClicked(_ mySearchBar: UISearchBar) {
        print("***")
        mySearchBar.becomeFirstResponder()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(mySearchBar.text!){
            (placemarks:[CLPlacemark]?, error:Error? ) in

            if error ==  nil{
                let placemark = placemarks?.first
                let anno = MKPointAnnotation()
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = mySearchBar.text!
                print("********")
//                print(searchBar.text)
                print("********")
                self.mapView.addAnnotation(anno)
                self.mapView.selectAnnotation(anno, animated: true)
//                print(self.mapView.annotations)
            }

            else {print(error?.localizedDescription ?? "error")}
        }
        //print("Searchig ...",searchBar.text )
    }

}
