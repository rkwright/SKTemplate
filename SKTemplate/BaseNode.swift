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
    private let cameraPosition = SCNVector3(x: 0, y: 0, z: 20)

    private var _cameraNode: SCNNode?
    private var _node:       SCNNode?
    
    // -------------------------------------------------------------------------
    // MARK: - Initialisation
    
    override init() {
        super.init()
        
        // Create player node
        let cubeGeometry = SCNBox(width: 2.5, height: 2.5, length: 2.5, chamferRadius: 0.0)
        _node = SCNNode(geometry: cubeGeometry)
        _node?.isHidden = false // true
        addChildNode(_node!)

        let colorMaterial = SCNMaterial()
        cubeGeometry.materials = [colorMaterial]
                
        // Camera Node
        _cameraNode = SCNNode()
        _cameraNode!.camera = SCNCamera()
        _cameraNode!.position = cameraPosition
        _cameraNode!.camera!.zNear = 0.1
        _cameraNode!.camera!.zFar = 200
        self.addChildNode(_cameraNode!)

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
        
        // Create a spotlight at the player
        let light = SCNLight()
        light.type = SCNLight.LightType.directional
        light.color = UIColor.yellow
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.0, y: 5.0, z: -2.0)
        self.addChildNode(lightNode)
        
        // Create additional omni light
        let omniNode = SCNNode()
        omniNode.light = SCNLight()
        omniNode.light!.type = SCNLight.LightType.omni
        omniNode.light!.color = UIColor.white
        //omniNode.light?.intensity = 0.5
        omniNode.position = SCNVector3(x: 0, y: 10.00, z: -2)
        self.addChildNode(omniNode)
        
        drawAxes()
    }
    
    // -------------------------------------------------------------------------
    
    required init(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
    var        X_AXIS = 0;
    var        Y_AXIS = 1;
    var        Z_AXIS = 2;

    func drawAxis ( axis : Int, axisColor: UIColor, axisHeight: Float ) {
        var        AXIS_RADIUS : Float   =    axisHeight/200.0
        let        AXIS_HEIGHT   =    axisHeight
        let        AXIS_STEP     =    axisHeight/20.0
        let        NUM_STEPS : Int     =  Int(AXIS_HEIGHT/AXIS_STEP)
       // var        AXIS_SEGMENTS = 32
       // var        AXIS_GRAY     = UIColor.gray
       // var        AXIS_WHITE    = UIColor.white
        var         curColor : UIColor

            //console.log("drawAxis " + axis + " ht: " +  AXIS_HEIGHT + ", " + AXIS_STEP + " color: " + axisColor);
        
        for i in 0...NUM_STEPS {
            
                //console.log("loop " +  i);
                
            var pos = -AXIS_HEIGHT / 2 + Float(i) * AXIS_STEP;
        
            if i & 1 == 0 {
                    curColor = axisColor
            }
            else if pos < 0 {
                curColor = UIColor.gray
            }
            else {
                curColor = UIColor.white
            }
                
                //console.log(i + " pos: " + pos + " color: " + curColor);
                
            //var shapeNode : SCNNode
            //var geomNode  : SCNGeometry
        
            //ShapeType.cylinder:
            let cylinder = SCNCylinder(radius: 0.3, height: CGFloat(AXIS_STEP))
            let node = SCNNode(geometry: cylinder)
            
            cylinder.materials.first?.diffuse.contents = curColor

            /*
                var geometry = new THREE.CylinderGeometry( AXIS_RADIUS, AXIS_RADIUS, AXIS_STEP, AXIS_SEGMENTS );
                var material = new THREE.MeshLambertMaterial( { color: curColor } );
                var cylinder = new THREE.Mesh( geometry, material );
              */
            
                pos += AXIS_STEP/2.0;
                if (axis == X_AXIS)
                {
                    node.position.x = pos
                    node.eulerAngles.z = Float.pi/2
                }
                else if (axis == Y_AXIS)
                {
                    node.position.y = pos
                   // node.rotation.y = Float.pi/2
                }
                else
                {
                    node.position.z = pos
                    node.eulerAngles.x = Float.pi/2
                }
                
                addChildNode( node)
            }
        }

    func drawAxes () {
        
        let height: Float = 10.0
        drawAxis(axis: X_AXIS, axisColor: UIColor.blue, axisHeight:  height);
        drawAxis(axis: Y_AXIS, axisColor: UIColor.green, axisHeight:  height);
        drawAxis(axis: Z_AXIS, axisColor: UIColor.red, axisHeight:  height);
    }
    // -------------------------------------------------------------------------    

}
