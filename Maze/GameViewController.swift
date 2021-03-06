//
//  GameViewController.swift
//  Maze
//
//  Created by Toma Alexandru on 14/08/2016.
//  Copyright (c) 2016 bart games. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var currentScene: SKScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        chenageViewToMenuScene()
    }

    func chenageViewToGameScene(_ configuration: MazeConfiguration) {
        let skView = self.view as! SKView
        
        currentScene = GameScene(size: skView.bounds.size)
        currentScene.scaleMode = .aspectFill
        let scene = self.currentScene as! GameScene
        scene.gvc = self
        scene.gameConfiguration =
            MazeConfiguration(rows: 40, columns: 40,
                                    blockSize: MazeConfiguration.defaultConfig.blockSize,
                                    wallThickness: MazeConfiguration.defaultConfig.wallThickness,
                                    playerStartTile: MazeConfiguration.defaultConfig.playerStartTile,
                                    exitTile: Tile(row: 40, column: 40))
        
        skView.presentScene(currentScene)
    }
    
    func chenageViewToMenuScene() {
        let skView = self.view as! SKView
        
        currentScene = MenuScene(size: skView.bounds.size)
        currentScene.scaleMode = .aspectFill
        let scene = self.currentScene as! MenuScene
        scene.gvc = self
        
        skView.presentScene(currentScene)
    }
    
    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
