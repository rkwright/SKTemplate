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

                
        // Camera Node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 20)
        cameraNode.camera!.zNear = 0.1
        cameraNode.camera!.zFar = 200
        self.addChildNode(cameraNode)

        /*
        // Create a spotlight at the player
        let spotLight = SCNLight()
        spotLight.type = SCNLight.LightType.spot
        spotLight.spotInnerAngle = 40.0
        spotLight.spotOuterAngle = 80.0
        spotLight.castsShadow = true
        spotLight.color = UIColor.white
        let spotLightNode = SCNNode()
        spotLightNode.light = spotLight
        spotLightNode.position = SCNVector3(x: 1.0, y: 5.0, z: -2.0)
        self.addChildNode(spotLightNode)
         */
        
        // Create a directional light at the player
        let light = SCNLight()
        light.type = SCNLight.LightType.directional
        light.color = UIColor.white
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.0, y: 5.0, z: -2.0)
        self.addChildNode(lightNode)
        
        // Create additional omni light
        let omniNode = SCNNode()
        omniNode.light = SCNLight()
        omniNode.light!.type = SCNLight.LightType.omni
        omniNode.light!.color = UIColor.white
        omniNode.position = SCNVector3(x: 0, y: 10.00, z: -2)
        self.addChildNode(omniNode)
        
        drawAxes(height: 10.0)
    }
    
    // -------------------------------------------------------------------------
    
    required init(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
    //--------------------------------------------------------------------
    let     X_AXIS = 0;
    let     Y_AXIS = 1;
    let     Z_AXIS = 2;
    let     HALF_PI = Float.pi / 2.0
    let     TWO_PI  = Float.pi * 2.0
    
    func drawAxis ( axis : Int, axisColor: UIColor, axisHeight: Float ) {
        
        let     axisRadius : Float   = axisHeight / 100.0
        let     axisStep   : Float   = axisHeight / 20.0
        let     numSteps   : Int     = 20
        var     curColor   : UIColor

        for i in 0...numSteps {
                            
            var pos = -axisHeight / 2 + Float(i) * axisStep;
        
            curColor = (i & 1 == 0) ? axisColor : (pos < 0) ? UIColor.gray : UIColor.white
                
            let cylinder = SCNCylinder(radius: CGFloat(axisRadius), height: CGFloat(axisStep))
            let cylNode = SCNNode(geometry: cylinder)
            
            cylinder.materials.first?.diffuse.contents = curColor

                pos += axisStep / 2.0;
                if (axis == X_AXIS)
                {
                    cylNode.position.x = pos
                    cylNode.eulerAngles.z = HALF_PI
                }
                else if (axis == Y_AXIS)
                {
                    cylNode.position.y = pos
                    cylNode.rotation.y = HALF_PI
                }
                else
                {
                    cylNode.position.z = pos
                    cylNode.eulerAngles.x = HALF_PI
                }
                
                addChildNode(cylNode)
            }
        }

    func drawAxes ( height: Float ) {
        
        drawAxis(axis: X_AXIS, axisColor: UIColor.blue, axisHeight:  height);
        drawAxis(axis: Y_AXIS, axisColor: UIColor.green, axisHeight:  height);
        drawAxis(axis: Z_AXIS, axisColor: UIColor.red, axisHeight:  height);
    }
    // -------------------------------------------------------------------------    

}
