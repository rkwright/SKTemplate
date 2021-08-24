//
//  GameViewController.swift
//
//  Part 1 of the SceneKit Tutorial Series 'From Zero to Hero' at:
//  https://rogerboesch.github.io/
//
//  Created by Roger Boesch on 12/07/16.
//  Copyright © 2016 Roger Boesch. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    private var _sceneView: SCNView!
    private var _scene: SKScene!
    var spawnTime   : TimeInterval = 0

    // -------------------------------------------------------------------------
    // MARK: - ViewController life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _scene = SKScene()
        _scene.create()
        
        _sceneView = SCNView()
        _sceneView.scene = _scene
        _sceneView.delegate = self
        _sceneView.allowsCameraControl = true
        _sceneView.showsStatistics = true
        _sceneView.backgroundColor = UIColor.black
        //_sceneView!.debugOptions = .showWireframe
        _sceneView.isPlaying = true
        _sceneView.isHidden = false
        self.view = _sceneView
    }

    // -------------------------------------------------------------------------

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // -------------------------------------------------------------------------

}

//
// Extension protocol so we can handle the render loop calls
//
extension ViewController: SCNSceneRendererDelegate {

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {

        if time > spawnTime {
                    
            spawnTime = time //+ TimeInterval(Float.random(min: 0.2, max: 1.5))
        }
    }
}


