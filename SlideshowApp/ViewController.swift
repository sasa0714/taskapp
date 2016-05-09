//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Sasaki on 2016/04/19.
//  Copyright © 2016年 Sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nstimer: UIButton!
    
    var playFlag = false
    
    /// 【変更】　クラスのプロパティとして宣言
    var timer : NSTimer!
    
    @IBAction func nstimer(sender: AnyObject) {
        
        
        if playFlag{
            
            nstimer.setTitle("再生", forState: .Normal)
            
            playFlag = false
            
            // 処理止める時
            
        } else {
            nstimer.setTitle("停止", forState: .Normal)
            
            playFlag = true
            
            
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("NexPic:"), userInfo: nil, repeats: true)
            
            /// 【変更】　不要なのでコメントアウト（もしくは削除）
            //                func NexPic(timer: NSTimer) {
            //                    // 2秒おきに行う処理
            //                }
            
            //処理始める時
            
        }
        
    }
    
    /// 【変更】　2秒おきに呼び出される関数を作成
    func NexPic(timer: NSTimer) {
        // 2秒おきに行う処理
    }


        
    /* var testButton: UIButton!
    func configureButton() {
        // ボタンのタイプを設定して作成
        testButton.setTitle("再生", forState: .Normal)
        // アクションの設定
        testButton.addTarget(self, action: "push:", forControlEvents: .TouchUpInside)
        // ボタンを画面に表示
        self.view.addSubview(testButton)
    }
    
    func push(sender: UIButton) {
        testButton.setTitle("停止", forState: .Normal)
        
        
        var timer: NSTimer!
        
        func timerInitialized () {
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("NexPic"), userInfo: nil, repeats: true)
        }
        
    }
    */
 
    @IBAction func Second(sender: AnyObject) {
    }   

    @IBAction func ReverseNo(sender: AnyObject) {

        imageNo -= 1
        if imageNo == -1{
        imageNo = 2}
        
        let name = nameArray[imageNo] // imageNoに対応するファイルの名前を取り出し
        
        let image = UIImage(named: name)
        
        Pic1.image = image
    }
    
    @IBAction func NexPic(sender: AnyObject) {
    
            print ("test")
    
        imageNo += 1
        if imageNo == 3{
        imageNo = 0
        }
        
        let name = nameArray[imageNo] // imageNoに対応するファイルの名前を取り出し
        
        let image = UIImage(named: name)
        
        Pic1.image = image
    }

    @IBOutlet weak var label: UIImageView!
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var Pic1: UIImageView!
    
    @IBAction func Tap(sender: AnyObject) {
        
        print ("test")
        
      performSegueWithIdentifier("ImageView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        let name = nameArray[imageNo] // imageNoに対応するファイルの名前を取り出し
        
        let image = UIImage(named: name)

        let vc = segue.destinationViewController as! ResultViewController
        
        vc.image = image
    }
    
    var imageNo = 1 // 現在表示している画像の番号
    let nameArray = ["baseball.jpg", "Soccor.jpg", "Basket.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        nstimer.setTitle("再生", forState: .Normal)

        
        let name = nameArray[imageNo] // imageNoに対応するファイルの名前を取り出し
        
        let image = UIImage(named: name)
        
        Pic1.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
