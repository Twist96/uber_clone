

import UIKit
import FirebaseAuth
import MapKit

private let reuseIdentifier = "Cell"

class HomeController: UIViewController {
    
    // MARK: - Properties
    private let mapView = MKMapView()
    

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        checkIfUserIsLoggedIn()
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
