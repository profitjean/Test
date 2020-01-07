import UIKit
import FirebaseUI

class CustomAuthViewController : FUIAuthPickerViewController{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, authUI: FUIAuth) {
        super.init(nibName: "FUIAuthPickerViewController", bundle: nibBundleOrNil, authUI: authUI)
    }
    required init?(coder:NSCoder){
        super.init(coder:coder)
    }
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // 이미지 가로세로 크기 설정
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let backgroundImageView = UIImageView(frame: CGRect(x:0,y:0,width:width,height:height))
        backgroundImageView.image = UIImage(named:"background")
        backgroundImageView.contentMode = .scaleAspectFill
        // 배열처럼 동작한다고 본다.
        self.view.insertSubview(backgroundImageView, at: 0)
        self.view.subviews[1].backgroundColor = UIColor.clear // 배경색 투명으로 설정
        // subviews의 1번이 scrollview
        self.view.subviews[1].subviews[0].backgroundColor = UIColor.clear
        // view >> background image view >> scrollview >> view
    }
    
}
