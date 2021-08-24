//
//  Player.swift
//
//  Part 1 of the SceneKit Tutorial Series 'From Zero to Hero' at:
//  https://rogerboesch.github.io/
//
//  Created by Roger Boesch on 12/07/16.
//  Copyright © 2016 Roger Boesch. All rights reserved.
//

import SceneKit

// -----------------------------------------------------------------------------

class BaseNode : SCNNode {
 //   private let cameraPosition = SCNVector3(x: 0.8, y: 5, z: -0.5)
    //private let cameraPosition = SCNVector3(x: 0, y: 0, z: 20)

    //private var _cameraNode: SCNNode?
    //private var _node:       SCNNode?
    
    // -------------------------------------------------------------------------
    // MARK: - Initialisation
    
    override init() {
        super.init()
        
        // Create player node
        let cubeGeometry = SCNBox(width: 2.5, height: 2.5, length: 2.5, chamferRadius: 0.0)
        let colorMaterial = SCNMaterial()
        cubeGeometry.materials = [colorMaterial]
        let cubeNode = SCNNode(geometry: cubeGeometry)
        self.addChildNode(cubeNode)
    }
    
    // -------------------------------------------------------------------------
    
    required init(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
    

}
