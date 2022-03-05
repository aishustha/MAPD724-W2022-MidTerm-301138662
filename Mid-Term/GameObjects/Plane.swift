// File Name - MidTerm Test - Modify Mail Pilot
// Author's Name - Aishwarya Shrestha
// Student Id - 301138662
// Date - 05/03/2022

import GameplayKit
import SpriteKit

//plane inherit from gameobject
class Plane : GameObject
{
    //initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle
    //task-5 - adjusted
    override func CheckBounds()
    {
        // constrain on the left boundary
        if(position.y <= -250)
        {
            position.y = -250
        }
        
        // constrain on the right boundary
        if(position.y >= 250)
        {
            position.y = 250
        }
    }
    
    // Initialization
    override func Start()
    {
        zPosition = 2
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        //jump to new position
        position = newPos
    }
}
