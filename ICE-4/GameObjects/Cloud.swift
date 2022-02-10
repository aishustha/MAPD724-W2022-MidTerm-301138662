//
//  Cloud.swift
//  ICE-3
//
//  Created by Aishwarya Shrestha on 29/01/2022.
//


import GameplayKit
import SpriteKit

//island going to inherit from game object
class Cloud : GameObject
{
    
   //Constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //LifeCycle functions
    override func CheckBounds()
    {
        //if position of my ocean is less than or equal to
        if(position.y <= -756)
        {
            Reset()
        }
    }
    
    //reset - whenever i'm in bottom it resets
    override func Reset()
    {
        //random variation
        //randomize vertical speed
        //0 and 5 --- 0 and 1 and then multiply by 5 and add 5 to it. min-5, max-10
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        //randomize horizontal drift - marching left / right
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        position.y = 756
        //get a pseudo random number from -262 to 262
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        
        position.x = CGFloat(randomX)
        isCollding = false
        
        //get a pseudo random number from 756 to 776
        let randomY:Int = (randomSource?.nextInt(upperBound: 20))! + 756
        
        position.y = CGFloat(randomY)
        isCollding = false
        //connect with island
    }
    
    //Initialization
    override func Start()
    {
        Reset()
        //layering top of each other
        zPosition = 3
        alpha = 0.5 // 50% transparent
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
