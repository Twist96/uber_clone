

import UIKit
import FirebaseAuth
import MapKit

private let reuseIdentifier = "Cell"

class HomeController: UIViewController {
    
    // MARK: - Properties
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        checkIfUserIsLoggedIn()
        enableLocation()
    }
    
    //MARK -API
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil{
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                self.present(nav, animated: true, completion: nil)
            }
        }else{
            configureUI()
        }
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
        }catch{
            print("DEBUG: Error signing ou t")
        }
    }

    //MARK: Selector
    
    //MARK: - Helper function
    
    func configureUI(){
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
   
}

//MARK: - Location services

extension HomeController: CLLocationManagerDelegate{
    func enableLocation() {
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        
        case .notDetermined:
            print("DEBUG: not determined. . .")
            locationManager.requestWhenInUseAuthorization()
        case .restricted , .denied:
            break
        case .authorizedAlways:
            print("DEBUG: Auth always. . .")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use. . .")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.requestAlwaysAuthorization()
        }
    }
}
