// File Name - MidTerm Test - Modify Mail Pilot
// Author's Name - Aishwarya Shrestha
// Student Id - 301138662
// Date - 05/03/2022

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    var gameManager: GameManager?
    
    // instance variables
    var ocean: Ocean?
    var island: Island?
    var plane: Plane?
    var clouds: [Cloud] = []
 
    
      
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        // add ocean to the scene
        ocean = Ocean() // allocate memory
        //Task2 - for landscape orientation
        ocean?.position = CGPoint(x: 733, y: 0)
        addChild(ocean!) // add the ocean to the scene
        
        // add island to the scene
        island = Island()
        addChild(island!)
        
        // add plane to the scene
        //task-5
        plane = Plane()
        plane?.position = CGPoint(x: -500, y: 0)
        addChild(plane!)
        
        //add 3 clouds to the scene
        //array of clouds
        //for loop
        //creating and adding to the scene
        //task-1 -number of clouds -2
        for index in  0...1
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
        //Sounds
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        
        //preload / prewarm impulse
        
        do {
            let sounds:[String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch {
            
        }
        
    }
    
    //cgpoint - have x and y coordinates
    //task-5
    func touchDown(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -500, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -500, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -500, y: pos.y))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean?.Update()
        island?.Update()
        plane?.Update()
       
        //update each cloud in clouds
        //randomly position
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SqauredRadiusCheck(Scene: self, object1: plane!, object2: cloud)
        }
        
        
        CollisionManager.SqauredRadiusCheck(Scene: self, object1: plane!, object2: island!)
        
        if(ScoreManager.Lives < 1)
        {
            gameManager?.PresentEndScene()
        }
    }
}
