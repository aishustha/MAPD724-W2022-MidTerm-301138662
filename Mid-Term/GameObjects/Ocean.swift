// File Name - MidTerm Test - Modify Mail Pilot
// Author's Name - Aishwarya Shrestha
// Student Id - 301138662
// Date - 05/03/2022

import GameplayKit
import SpriteKit

//ocean going to inherit from game object
class Ocean : GameObject
{
    
   //Constructor
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //LifeCycle functions
    override func CheckBounds()
    {
        //if position of my ocean is less than or equal to
        if(position.x <= -773)
        {
            Reset()
        }
    }
    
    //reset - whenever i'm in bottom it resets
    override func Reset()
    {
        position.x = 773
    }
    
    //Initialization
    override func Start()
    {
        //layering top of each other
        zPosition = 0
        horizontalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}
