//
//  Island.swift
//  ICE-2
//
//  Created by Aishwarya Shrestha on 29/01/2022.
//

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
        if(position.y <= -730)
        {
            Reset()
        }
    }
    
    //reset - whenever i'm in bottom it resets
    override func Reset()
    {
        position.y = 730
        //get a pseudo random number from -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 616))! - 313
        
        position.x = CGFloat(randomX)
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
        position.y -= verticalSpeed!
    }
}
