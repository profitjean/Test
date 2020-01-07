
import UIKit
import FirebaseUI

class FUIKakaoAuth:NSObject,FUIAuthProvider{
    var providerID: String? = "KakaoTalk"
    
    var shortName: String = "KakaoTalk"
    
    var signInLabel: String = "sign in with kakaoTalk"
    
    var icon: UIImage = UIImage()
    
    // 배경 색(옐로우 -> RGB값 설정 필요)
    var buttonBackgroundColor: UIColor 
    // 텍스트 색(블랙)
    var buttonTextColor: UIColor = .black
    
    func signIn(withEmail email: String?, presenting presentingViewController: UIViewController?, completion: FUIAuthProviderSignInCompletionBlock? = nil) {
       
    }
    // 카카오로그인 설정 - developers.kakao.com 에 앱 새로 추가
    // import.plist에 KAKAO_APP_KEY 추가, url 추가, 추가적인 스키마 추가
    // functions 폴더 새로 만들기 - 지난 시간의 kakaoNodeApp처럼 새로 만들기
    
    func signIn(withDefaultValue defaultValue: String?, presenting presentingViewController: UIViewController?, completion: FUIAuthProviderSignInCompletionBlock? = nil) {
            // 카카오로그인 시작
            // 카카오로그인 끝나면 user id와 email 얻기
            // 파이어베이스 로그인하기
            // 현재 로그인 목록창 끄기
    }
    func signOut() {
        <#code#>
    }
    
}
