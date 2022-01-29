//
//  GameObject.swift
//  ICE-2
//
//  Created by Aishwarya Shrestha on 23/01/2022.
//


import GameplayKit
import SpriteKit

//inherit or extend SKSpriteNode
//Ocean, Cloud, Plane(player), island inherits from game object
//collision manager - static class / singleton - overlap -collision-sounds-game

//overlap - island and plane - we have collision - collision manager checks collision-
//rectangle, square, capsule, line, circle - overlap

//scoremanager - static class / singleton
//distance check - both circle collides
//distance between centers - is less than the combined radii - collision
//line od sights and detection radius - enemy


class GameObject : SKSpriteNode, GameProtocol
{
    // public instance members
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    var width: CGFloat? //to know boundary
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    
    var scale: CGFloat? // uniform scale
    var isCollding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    
  
    
    
    // constructor / initializer
    init(imageString: String, initialScale: CGFloat)
    {
        // initialize the game object with an image
        //every game obj should have img
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        //pass texture, color, size
        super.init(texture: texture, color: color, size: texture.size())
        
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isCollding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //game protocol
    func CheckBounds()
    {
        
    }
    
    func Reset()
    {
        
    }
    
    func Start()
    {
        
    }
    
    func Update()
    {
        
    }

}
