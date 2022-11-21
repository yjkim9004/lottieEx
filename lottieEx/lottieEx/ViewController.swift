//
//  ViewController.swift
//  lottieEx
//
//  Created by Aekyung on 2022/05/06.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var lottieMain: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
          let animationView: AnimationView = .init(name: "icecream2")
          lottieMain.addSubview(animationView)
          
          
          // animationView의 설정 작업은 알아서 하세요
          animationView.frame = self.view.bounds
          animationView.center = self.view.center
          animationView.contentMode = .scaleAspectFit
          animationView.play()
//
//
//        // 애니메이션을 1번만 실행함
//        animationView.loopMode = .playOnce
//
        // 애니메이션을 3번만큼 실행하고 종료
//        animationView.loopMode = .repeat(5)
//
//        // 애니메이션을 무한으로 실행
//        animationView.loopMode = .loop
//
//        // 애니메이션을 실행한 뒤, 실행한 애니메이션을 거꾸로 다시 실행함 (3번만큼 실행)
//        animationView.loopMode = .repeatBackwards(1)
//
//         애니메이션을 실행한 뒤, 실행한 애니메이션을 거꾸로 다시 실행함 (무한 반복)
        animationView.loopMode = .autoReverse
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) {
            animationView.removeFromSuperview()
            self.second()
        }
        
    }

    @objc func second() {
        let secondView: AnimationView = .init(name: "mobileUI")
        lottieMain.addSubview(secondView)
        secondView.frame = self.view.bounds
        secondView.center = self.view.center
        secondView.contentMode = .scaleAspectFit
        secondView.play()
        secondView.loopMode = .repeat(10)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) {
            secondView.removeFromSuperview()
            self.third()
        }
    }
    
    @objc func third() {
        let thirdView: AnimationView = .init(name: "icecream")
        lottieMain.addSubview(thirdView)
        thirdView.frame = self.view.bounds
        thirdView.center = self.view.center
        thirdView.contentMode = .scaleAspectFit
        thirdView.play()
        thirdView.loopMode = .autoReverse
    }
    
    func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
        var first : [Int] = []
        var second : [Int] = []
        var result : [Int] = []
        var fRemovedArray = [Int]()
        var sRemovedArray = [Int]()
        for lotto in lottos {
            for win_num in win_nums {
                if lotto == win_num || lotto == 0{
                    second.append(lotto)
                    for i in second {
                        if sRemovedArray.contains(i) == false {
                            sRemovedArray.append(i)
                        }
                    }
                } else if lotto == win_num && lotto != 0{
                    first.append(lotto)
                    for i in first {
                        if fRemovedArray.contains(i) == false {
                            fRemovedArray.append(i)
                        }
                    }
                }
            }
        }
        result.append(fRemovedArray.count)
        result.append(sRemovedArray.count)
        return result
    }
}

