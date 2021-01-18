





import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var UItable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

        let mapView = MKMapView()

        mapView.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.height)

//            mapView.showsUserLocation = true
//            mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
//            self.mapView.delegate =  self
        // Or, if needed, we can position map in the center of the view
//        mapView.center = view.center

        view.addSubview(mapView)
        
        
        let mySearchBar = UISearchBar()
        mySearchBar.frame = CGRect(x: 0, y: mapView.top + 10 , width: view.frame.size.width, height: 50)
        mySearchBar.showsCancelButton = true
        mySearchBar.placeholder = "Search .."
//        mySearchBar.barStyle = .black
        mySearchBar.searchBarStyle = .minimal
        self.view.addSubview(mySearchBar)
        
//        CGRect(x:25,y: headerView.bottom + 40,width: view.width-50,height: 52.0)
        
        
        
    }


}
