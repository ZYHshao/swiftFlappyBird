//
//  ViewController.swift
//  swiftFlappyBird
//
//  Created by wutong on 15/6/11.
//  Copyright (c) 2015年 wutong. All rights reserved.
//

import UIKit
//用常量的形式代理OC中的宏定义
let G:Float=9.8
let SCREEN_SIZE = UIScreen.mainScreen().bounds
class ViewController: UIViewController {
    var timer:NSTimer?
    var i:Int=0
    var timer2:NSTimer?
    var timer3:NSTimer?
    var bird:UIImageView?
    var t:Float=0.0
    var isDowm:Bool=false
    var isGameOver:Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.creatBackgroundView()
        self.creatWood()
        self.creatBird()
        self.creatTimer()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func creatBackgroundView(){
        var image=UIImage(named: "bg.jpg")
        var view1=UIImageView(image: image)
        var view2=UIImageView(image: image)
        view1.tag=101
        view2.tag=102
        view1.frame=CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)
        view2.frame=CGRectMake(SCREEN_SIZE.width, 0, SCREEN_SIZE.width+1, SCREEN_SIZE.height)
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        var image2=UIImage(named: "03.png")
        var view3=UIImageView(frame: CGRectMake(0, SCREEN_SIZE.height-100, SCREEN_SIZE.width, 100))
        var view4=UIImageView(frame: CGRectMake(SCREEN_SIZE.width, SCREEN_SIZE.height-100, SCREEN_SIZE.width+1, 100))
        view3.tag=103
        view4.tag=104
        view3.image=image2
        view4.image=image2
        self.view.addSubview(view3)
        self.view.addSubview(view4)
    }
    func creatTimer(){
        timer=NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "appAction", userInfo: nil, repeats: true)
        timer2=NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "appAction2", userInfo: nil, repeats: true)
        timer3=NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "birdMove", userInfo: nil, repeats: true)
    }
    func appAction(){
        self.mainViewMove()
        self.isHitting()
    }
    func appAction2(){
        var view1=self.view.viewWithTag(301)
        var view2=self.view.viewWithTag(302)
        var view3=self.view.viewWithTag(303)
        var view4=self.view.viewWithTag(304)
        var view5=self.view.viewWithTag(305)
        var view6=self.view.viewWithTag(306)
        if view1?.frame.origin.x > -350{
            var frame:CGRect=view1!.frame
            frame.origin.x-=2
            view1?.frame=frame
            var frame2:CGRect=view2!.frame
            frame2.origin.x-=2
            view2?.frame=frame2
        }else{
            var frame=view1?.frame
            frame?.origin.x=SCREEN_SIZE.width
            view1?.frame=frame!
            
            var frame2=view2?.frame
            frame2?.origin.x=SCREEN_SIZE.width
            view2?.frame=frame2!
            self.appearWood(view1 as UIImageView, view2: view2 as UIImageView)
        }
        if view3?.frame.origin.x > -350{
            var frame:CGRect=view3!.frame
            frame.origin.x-=2
            view3?.frame=frame
            var frame2:CGRect=view4!.frame
            frame2.origin.x-=2
            view4?.frame=frame2
        }else{
            var frame=view3?.frame
            frame?.origin.x=SCREEN_SIZE.width
            view3?.frame=frame!
            
            var frame2=view4?.frame
            frame2?.origin.x=SCREEN_SIZE.width
            view4?.frame=frame2!
            self.appearWood(view3 as UIImageView, view2: view4 as UIImageView)
        }
        if view5?.frame.origin.x > -350{
            var frame:CGRect=view5!.frame
            frame.origin.x-=2
            view5?.frame=frame
            var frame2:CGRect=view6!.frame
            frame2.origin.x-=2
            view6?.frame=frame2
        }else{
            var frame=view5?.frame
            frame?.origin.x=SCREEN_SIZE.width
            view5?.frame=frame!
            
            var frame2=view6?.frame
            frame2?.origin.x=SCREEN_SIZE.width
            view6?.frame=frame2!
            self.appearWood(view5 as UIImageView, view2: view6 as UIImageView)
        }
    }
    func birdMove(){
        if !isDowm{
            if bird?.frame.origin.y < SCREEN_SIZE.height-100{
                var rant:CGRect=bird!.frame
                rant.origin.y += (CGFloat)(G*(t*t/2))
                bird?.frame=rant
                t+=0.025
            }
        }else{
            if t<0.24{
                var rant = bird?.frame
                rant?.origin.y -= 4.9-(CGFloat)(G*t*t/2)
                bird?.frame=rant!
                t+=0.025
            }else{
                isDowm=false
            }
        }
    }
    
    
    func appearWood(view1:UIImageView,view2:UIImageView){
        var hight=arc4random()%222+30
        var rant1=view1.frame
        var rant2=view2.frame
        rant1.origin.y = (CGFloat)(-SCREEN_SIZE.height)+(CGFloat)(hight)
        rant2.origin.y = (CGFloat)(hight)+100.0
        view1.frame=rant1
        view2.frame=rant2
        
    }
    
    func mainViewMove(){
        i=i+1
        if i>100{
            i=1
        }
        var view1=self.view.viewWithTag(101)
        var view2=self.view.viewWithTag(102)
        var view3=self.view.viewWithTag(103)
        var view4=self.view.viewWithTag(104)
        
        if view1?.frame.origin.x > -SCREEN_SIZE.width{
            var frame=view1?.frame
            frame?.origin.x-=1
            view1?.frame=frame!
        }else{
            var frame=view1?.frame
            frame?.origin.x=SCREEN_SIZE.width
            view1?.frame=frame!
        }
        if view2?.frame.origin.x > -SCREEN_SIZE.width{
            var frame=view2?.frame
            frame?.origin.x-=1
            view2?.frame=frame!
        }else{
            var frame=view2?.frame
            frame?.origin.x=SCREEN_SIZE.width
            view2?.frame=frame!
        }
        if view3?.frame.origin.x > -SCREEN_SIZE.width{
            var frame=view3?.frame
            frame?.origin.x-=2
            view3?.frame=frame!
        }else{
            var frame=view3?.frame
            frame?.origin.x=SCREEN_SIZE.width
            view3?.frame=frame!
        }
        if view4?.frame.origin.x > -SCREEN_SIZE.width{
            var frame=view4?.frame
            frame?.origin.x-=2
            view4?.frame=frame!
        }else{
            var frame=view4?.frame
            frame?.origin.x=SCREEN_SIZE.width
            view4?.frame=frame!
        }
        
    }
    func isHitting(){
        var view1=self.view.viewWithTag(301)
        var view2=self.view.viewWithTag(302)
        var view3=self.view.viewWithTag(303)
        var view4=self.view.viewWithTag(304)
        var view5=self.view.viewWithTag(305)
        var view6=self.view.viewWithTag(306)
        if CGRectIntersectsRect(bird!.frame, view1!.frame)||CGRectIntersectsRect(bird!.frame, view2!.frame)||CGRectIntersectsRect(bird!.frame, view3!.frame)||CGRectIntersectsRect(bird!.frame, view4!.frame)||CGRectIntersectsRect(bird!.frame, view5!.frame)||CGRectIntersectsRect(bird!.frame, view6!.frame){
            timer!.fireDate=NSDate.distantFuture() as NSDate
            timer2!.fireDate=NSDate.distantFuture() as NSDate
            timer3!.fireDate=NSDate.distantFuture() as NSDate
            bird?.stopAnimating()
            self.gameOver()
            
        }
    }
    func creatWood(){
        var image:UIImage = UIImage(named: "04.png")!
        var image2:UIImage = UIImage(named: "05.png")!
        var view1:UIImageView=UIImageView(frame: CGRectMake(SCREEN_SIZE.width, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height))
        var view2:UIImageView=UIImageView(frame: CGRectMake(SCREEN_SIZE.width, SCREEN_SIZE.height, 54, SCREEN_SIZE.height))
        view1.image=image
        view2.image=image2
        view1.tag=301
        view2.tag=302
        
        var view3:UIImageView=UIImageView(frame: CGRectMake(SCREEN_SIZE.width+200, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height))
        var view4:UIImageView=UIImageView(frame: CGRectMake(SCREEN_SIZE.width+200, SCREEN_SIZE.height, 54, SCREEN_SIZE.height))
        view3.image=image
        view4.image=image2
        view3.tag=303
        view4.tag=304
        
        var view5:UIImageView=UIImageView(frame: CGRectMake(SCREEN_SIZE.width+400, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height))
        var view6:UIImageView=UIImageView(frame: CGRectMake(SCREEN_SIZE.width+400, SCREEN_SIZE.height, 54, SCREEN_SIZE.height))
        view5.image=image
        view6.image=image2
        view5.tag=305
        view6.tag=306
        
        var image0=self.view.viewWithTag(103)
        self.view.insertSubview(view1, belowSubview: image0!)
        self.view.insertSubview(view2, belowSubview: image0!)
        self.view.insertSubview(view3, belowSubview: image0!)
        self.view.insertSubview(view4, belowSubview: image0!)
        self.view.insertSubview(view5, belowSubview: image0!)
        self.view.insertSubview(view6, belowSubview: image0!)
    }
    func creatBird(){
        var images:NSMutableArray=NSMutableArray()
        for var j = 1; j<4; j++ {
            var image = UIImage(named: NSString(format: "bird%d.png", j))
            images.addObject(image!)
        }
        bird=UIImageView(frame: CGRectMake(50, 200, 35, 35))
        bird?.animationImages=images
        bird?.animationRepeatCount=0
        bird?.animationDuration=0.3
        bird?.image=images[i] as? UIImage
        bird?.startAnimating()
        self.view.addSubview(bird!)
    }
    
    func gameOver(){
        isGameOver=true
        var gameOver:UIImageView=UIImageView(frame: CGRectMake(30, 100, SCREEN_SIZE.width-60, 60))
        gameOver.image=UIImage(named: "gameover2.png")
        gameOver.tag=900
        self.view .addSubview(gameOver)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        if isGameOver{
            isGameOver=false
            var im=self.view.viewWithTag(900)
            im!.removeFromSuperview()
            self.reloadGame()
        }else{
            isDowm=true
            t=0
        }
    }
    func reloadGame(){
        i=0
        t=0
        var view1=self.view.viewWithTag(301)
        var view2=self.view.viewWithTag(302)
        var view3=self.view.viewWithTag(303)
        var view4=self.view.viewWithTag(304)
        var view5=self.view.viewWithTag(305)
        var view6=self.view.viewWithTag(306)
        view1!.frame=CGRectMake(SCREEN_SIZE.width, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height)
        view2!.frame=CGRectMake(SCREEN_SIZE.width, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height)
        view3!.frame=CGRectMake(SCREEN_SIZE.width, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height)
        view4!.frame=CGRectMake(SCREEN_SIZE.width, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height)
        view5!.frame=CGRectMake(SCREEN_SIZE.width, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height)
        view6!.frame=CGRectMake(SCREEN_SIZE.width, -SCREEN_SIZE.height, 54, SCREEN_SIZE.height)
        bird?.frame=CGRectMake(50, 200, 35, 35)
        timer!.fireDate=NSDate.distantPast() as NSDate
        timer2!.fireDate=NSDate.distantPast() as NSDate
        timer3!.fireDate=NSDate.distantPast() as NSDate
        bird?.startAnimating()
    }
    
}

