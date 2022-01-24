//
//  GameProtocol.swift
//  ICE-1
//
//  Created by Aishwarya Shrestha on 23/01/2022.
//

protocol GameProtocol
{
    // prevent an object from leaving the screen or detect that it has done so
    func CheckBounds()
    
    // Reset our GameObject offscreen
    func Reset()
    
    // Initialize properties of our Game Objects
    func Start()
    
    // Update will be called every Frame (60 times per second) = 16.666ms
    func Update()
}
