// File Name - MidTerm Test - Modify Mail Pilot
// Author's Name - Aishwarya Shrestha
// Student Id - 301138662
// Date - 05/03/2022

import GameplayKit
import SpriteKit

//island going to inherit from game object
class Island : GameObject
{
    
   //Constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //LifeCycle functions
    override func CheckBounds()
    {
        //if position of my ocean is less than or equal to
        if(position.x <= -730)
        {
            Reset()
        }
    }
    
    //reset - whenever i'm in bottom it resets
    override func Reset()
    {
        position.x = 730
        //get a pseudo random number from -313 to 313
        let randomY:Int = (randomSource?.nextInt(upperBound: 616))! - 313
        
        position.y = CGFloat(randomY)
        isCollding = false
        //connect with island
    }
    
    //Initialization
    override func Start()
    {
        Reset()
        //layering top of each other
        zPosition = 1
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= verticalSpeed!
    }
}
