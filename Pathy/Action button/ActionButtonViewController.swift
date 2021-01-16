
import Foundation
import UIKit
import Macaw
import FanMenu


class ActionButtonViewController: UIViewController {
    
    @IBOutlet weak var fanMenu: FanMenu!
    @IBOutlet weak var colorLabel: UILabel!
    
//    let colors = [0x231FE4, 0x00BFB6, 0xFFC43D]

    let items = [
        
        ("thought", 0x9F85FF),
        ("picture", 0x85B1FF),
        ("map", 0xFF703B),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fanMenu.button = mainButton(colorHex:  0x9F85FF)
//        fanMenu.items = colors.enumerated().map { arg -> FanMenuButton in

//            let (index, item) = arg
//            return FanMenuButton(
//                id: String(index),
//                image: .none,
//                color: Color(val: item)
//            )
//        }

        fanMenu.items = items.map { button in
            FanMenuButton(
                id: button.0,
                image: UIImage(named: "menu_\(button.0)"),
                color: Color(val: button.1)
            )
        }

        fanMenu.menuRadius = 90.0
        fanMenu.duration = 0.2
        fanMenu.interval = (Double.pi + 0.50 , 2 * Double.pi - 0.50)
        fanMenu.radius = 15.0
        fanMenu.menuBackground = .clear
    
        
        fanMenu.onItemWillClick = { button in

            if button.id == "map" {
                let LoginVC = MapViewController()
//                LoginVC.modalPresentationStyle = .popover
                self.present(LoginVC, animated: true)
             }
        }
        
//        fanMenu.onItemWillClick = { button in
//            self.hideTitle()
//            if button.id != "main" {
//                print(button.id)
//                let newColor = self.colors[Int(button.id)!]
//
//                let fanGroup = self.fanMenu.node as? Group
//                let circleGroup = fanGroup?.contents[2] as? Group
//                let shape = circleGroup?.contents[0] as? Shape
//                shape?.fill = Color(val: newColor)
//            }
//        }
        
        
       // fanMenu.transform = CGAffineTransform(rotationAngle: CGFloat(3 * Double.pi/2.0))
        
        fanMenu.backgroundColor = .clear
    }
    
    func hideTitle() {
        let newValue = !self.colorLabel.isHidden
        UIView.transition(
            with: colorLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.colorLabel.isHidden = newValue
        }, completion: nil)
    }
    
    func mainButton(colorHex: Int) -> FanMenuButton {
        return FanMenuButton(
            id: "main",
            image: UIImage(systemName: "plus.app"),
            color: Color(val: colorHex)
        )
    }
}

