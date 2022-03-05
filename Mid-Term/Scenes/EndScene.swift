// File Name - MidTerm Test - Modify Mail Pilot
// Author's Name - Aishwarya Shrestha
// Student Id - 301138662
// Date - 05/03/2022

import SpriteKit
import GameplayKit

class EndScene: SKScene
{
    //instance variables
    var ocean: Ocean?
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "End"
        
        //task-2
        // add ocean to the scene
        ocean = Ocean() // allocate memory
        ocean?.position = CGPoint(x: 773, y:0)
        addChild(ocean!) // add the ocean to the scene
    }
    
    
    //cgpoint - have x and y coordinates
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
       
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
        
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
    }
}
