// File Name - MidTerm Test - Modify Mail Pilot
// Author's Name - Aishwarya Shrestha
// Student Id - 301138662
// Date - 05/03/2022


import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
   

    //label
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var LivesLabel: UILabel!
    
    @IBOutlet weak var StartLabel: UILabel!
    
    @IBOutlet weak var EndLabel: UILabel!
    
    //button
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var EndButton: UIButton!
    
    
    var currentScene: SKScene?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//
//                // Present the scene
//                view.presentScene(scene)
//            }
//
//            view.ignoresSiblingOrder = true
//
//
//        }
        
        //Initialize the lives and score
        LivesLabel.isHidden = true
        ScoreLabel.isHidden = true
        EndButton.isHidden = true
        EndLabel.isHidden = true
        
        CollisionManager.gameViewController = self
        
        SetScene(sceneName: "StartScene")
    
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    
    //LOADING the scene 
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            // store a reference in currentscene
            
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
        }
    }
    
    func PresentStartScene()
    {
        StartButton.isHidden = false
        StartLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }
    
    func PresentEndScene()
    {
        EndButton.isHidden = false
        EndLabel.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        
        StartButton.isHidden = true
        StartLabel.isHidden = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false

        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        
        SetScene(sceneName: "GameScene")
    }
    
    
    @IBAction func EndButton_Pressed(_ sender: UIButton) {
        EndButton.isHidden = true
        EndLabel.isHidden = true
        
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false

        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        SetScene(sceneName: "GameScene")
    }
}
