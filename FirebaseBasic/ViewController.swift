/*firebase basic*/
import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase
import CodableFirebase // 데이터 자동 변환

class ViewController: UIViewController, FUIAuthDelegate {

    let authUI = FUIAuth.defaultAuthUI() // firebase 변수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    } // viewdidLoad에서는 로그인 창 띄울 수 없음. 새 함수 설정 필요
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let providers:[FUIAuthProvider] = [FUIGoogleAuth(),FUIFacebookAuth(),FUIKakaoAuth()]
        // providers 변수는 로그인 공급 요소가 된다. 여기에 어떤 사이트 계정을 사용할 것인지 추가하면 된다.
        // 로그인 창 띄우기/말기 선택하는 방법. currentuser의 존재 유무에 따라 결정
        if let user = Auth.auth().currentUser{
            let mainViewController = self.storyboard?.instantiateViewController(identifier:"mainView") as! mainViewController
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: false, completion: nil)
        } else{
            
            let providers:[FUIAuthProvider] = [FUIGoogleAuth(),FUIFacebookAuth()]
        
            self.authUI!.providers = providers
            self.authUI!.delegate = self
        
            // viewcontroller 만들기
            // 로고 투입 시  authViewController 상속 받는 거 필요
            
            
            //let authViewController = self.authUI!.authViewController()
            let authViewController = CustomAuthViewController(authUI: self.authUI!)
            
            authViewController.modalPresentationStyle = .fullScreen // 풀스크린으로 띄우기
            
            self.present(authViewController, animated: true, completion: nil)
            
        }
    
    }
  
    // 로그인했는지 확인시켜주는 함수
    // 로그인 성공 시, 콘솔 창에 login complete 뜬다
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        if let error = error {
            NSLog(error.localizedDescription)
            return
        }
        // 트리 구조의 데이터베이스.firebase내에서 트리 구조로 데이터 쌓이는 거 확인 가능하다. 
        if let user = Auth.auth().currentUser {
            let user_id = user.uid
            var ref = Database.database().reference()
            ref.child("users").child(user_id).observeSingleEvent(of: .value, with:{
                (snapshot)in
                // 유저 정보 가져온 뒤 처리과정
                if let value = snapshot.value{
                    do{
                        let user = try FirebaseDecoder().decode(User.self, from: value)
                        NSLog("정보 있음")
                        dump(user)
                    }catch let error{
                        NSLog(error.localizedDescription)
                        NSLog("추가 정보 입력 필요")
                        let user = User(name: "test",email:"test@test.com")
                        let data = try! FirebaseEncoder().encode(user)
                        ref.child("users").child(user_id).setValue(data)
                    }
                }
            })
        {
            (error) in NSLog(error.localizedDescription)
            
        }
    }
 } // authUI의 끝
    
    // 로그아웃 액션 연결
      @IBAction func doLogout(_ sender: UIButton) {
          guard let user = Auth.auth().currentUser else{
              return
          }
          do{
              try Auth.auth().signOut()
              NSLog("로그아웃 성공")
          }catch{
              NSLog("로그아웃 실패")
          }
      }
    // 
}

