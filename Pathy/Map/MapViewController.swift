





import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {

//    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var UItable: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    let mapView = MKMapView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        mapView.delegate = self
        
        let mySearchBar = UISearchBar()
        mySearchBar.frame = CGRect(x: 0, y: mapView.top + 10 , width: view.frame.size.width, height: 50)
        mySearchBar.showsCancelButton = true
        mySearchBar.placeholder = "Search .."
//        mySearchBar.barStyle = .black
        mySearchBar.searchBarStyle = .minimal
        self.view.addSubview(mySearchBar)
        mySearchBar.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//
//     func ConflocationManager(){
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.height/3)
//            mapView.showsUserLocation = true
//            mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
    }
    
    @objc func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HERE")
        searchBar.becomeFirstResponder()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchBar.text!){
            (placemarks:[CLPlacemark]?, error:Error? ) in

            if error ==  nil{
                let placemark = placemarks?.first
                let anno = MKPointAnnotation()
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = searchBar.text!
                print("********")
//                print(searchBar.text)
                print("********")
                print(self.mapView)
                self.mapView.addAnnotation(anno)
                self.mapView.selectAnnotation(anno, animated: true)

                print(searchBar.bottom)
                print(searchBar.top)

            }

            else {print(error?.localizedDescription ?? "error")}
        }
        //print("Searchig ...",searchBar.text )
    }

    


}
