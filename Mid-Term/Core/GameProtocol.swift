// File Name - MidTerm Test - Modify Mail Pilot
// Author's Name - Aishwarya Shrestha
// Student Id - 301138662
// Date - 05/03/2022

protocol GameProtocol
{
    // prevent an object from leaving the screen or detect that it has done so
    //check the boundaries
    func CheckBounds()
    
    // Reset our GameObject offscreen
    //reset the objects
    func Reset()
    
    // Initialize properties of our Game Objects
    func Start()
    
    // Update will be called every Frame (60 times per second) = 16.666ms
    func Update()
}
