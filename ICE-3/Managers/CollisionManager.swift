//
//  CollisionManager.swift
//  ICE-3
//
//  Created by Aishwarya Shrestha on 02/02/2022.
//

import SpriteKit
import GameplayKit

class CollisionManager
{
    //utility function
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        //DISTANCE BETWEEN CENTER AND RADII
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
        
        //AABB - ACCESS ALIGN BOUNDING BOX
    }
    
    public static func SqauredRadiusCheck(Scene: SKScene, object1: GameObject, object2: GameObject) -> Void
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        //radius
        let Radii = P1Radius + P2Radius
        
        if(SquaredDistance(point1: P1, point2: P2) < Radii * Radii)
        {
            //collision here
            //if object2 is not colliding
            
            //object1 - plane
            //object2 - island
            
            if(!object2.isCollding!)
            {
                switch(object2.name)
                {
                case "island":
                    print("Collided with Island")
                    break
                    
                case "cloud":
                    print("Collided with Cloud")
                    break
                    
                default:
                    break
                }
                
                object2.isCollding = true
            }
            
        }
    }
}
