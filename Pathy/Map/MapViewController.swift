    import UIKit
    import MapKit
    class MapViewController: UIViewController, MKMapViewDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            let mapView = MKMapView()
            
            let leftMargin:CGFloat = 10
            let topMargin:CGFloat = 90
            let mapWidth:CGFloat = view.width
            let mapHeight:CGFloat = view.height
            
            mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
            
//            mapView.showsUserLocation = true
//            mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
            mapView.mapType = MKMapType.standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true
//            self.mapView.delegate =  self
            // Or, if needed, we can position map in the center of the view
            mapView.center = view.center
            
            view.addSubview(mapView)
        }
        
    }
    
