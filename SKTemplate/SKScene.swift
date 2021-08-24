//
//  GameLevel.swift
//
//  Part 1 of the SceneKit Tutorial Series 'From Zero to Hero' at:
//  https://rogerboesch.github.io/
//
//  Created by Roger Boesch on 12/07/16.
//  Copyright © 2016 Roger Boesch. All rights reserved.
//

import UIKit
import SceneKit

// -----------------------------------------------------------------------------

class SKScene: SCNScene, SCNSceneRendererDelegate, SCNPhysicsContactDelegate {
    
    private var _baseNode: BaseNode?
 
    // -------------------------------------------------------------------------
    // MARK: - Initialisation
    
    func create() {

        addBaseNode()
    }
    
    // -------------------------------------------------------------------------
    // MARK: - Place objects

    private func addBaseNode() {
        _baseNode = BaseNode()
        _baseNode!.position = SCNVector3(0, 0, 0)
        self.rootNode.addChildNode(_baseNode!)
        
       // let moveAction = SCNAction.moveBy(x: 0, y: 0, z: 2, duration: 50)
       // _baseNode!.runAction(moveAction)

        dumpSCNNode(node: self.rootNode)
    }

    // -------------------------------------------------------------------------
    
    override init() {
        super.init()
    }
    
    // -------------------------------------------------------------------------
    
    required init(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
    // -------------------------------------------------------------------------
    
    private func dumpSCNNode ( node: SCNNode ) {
        
        print("Node: ", node)
        if let nom = node.name {
            print("Name: " + nom)
        }
        else {
            print("Unnamed")
        }
 
        let bbox = node.boundingBox
        print("bbox: ", bbox.min.x, bbox.min.y, bbox.max.x, bbox.max.y )
        
        let count = node.childNodes.count
        for i in 0..<count {
            print("i: " , i )
            dumpSCNNode(node: node.childNodes[i])
        }
    }
    
}
