////
////  ViewController.swift
////  MAgicPaper
////
////  Created by carlos andrade guzman on 7/22/20.
////  Copyright © 2020 carlos andrade guzman. All rights reserved.
////
//
//import UIKit
//import SceneKit
//import ARKit
//
//class ViewController: UIViewController, ARSCNViewDelegate {
//
//    @IBOutlet var sceneView: ARSCNView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set the view's delegate
//        sceneView.delegate = self
//
//        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Create a session configuration
//        let configuration = ARImageTrackingConfiguration()
//        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "NewsPaperImages", bundle: Bundle.main)
//        {
//            configuration.trackingImages = trackedImages
//            configuration.maximumNumberOfTrackedImages = 1
////            print("Images Found")
//        }
//
//
//        // Run the view's session
//        sceneView.session.run(configuration)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Pause the view's session
//        sceneView.session.pause()
//    }
//
//    // MARK: - ARSCNViewDelegate
//
////    CODIGO PRINCIPAL ************************************************************************************************************************
//
//    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
//        let node = SCNNode()
//        if let imageAnchor = anchor as? ARImageAnchor{
//
//            let videoNode = SKVideoNode(fileNamed: "harrypotter.mp4")
////            let videoNode = SKVideoNode(fileNamed: "\().mp4")
////            snape2
//            videoNode.play()
//            let videoScene = SKScene(size: CGSize(width: 480, height: 360))
//            videoNode.position = CGPoint(x: videoScene.size.width/2, y: videoScene.size.height/2)
//            videoNode.yScale = -1.0
//
//            videoScene.addChild(videoNode)
//            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
//            let planeNode = SCNNode(geometry: plane)
//            planeNode.eulerAngles.x = -.pi/2
//            node.addChildNode(planeNode)
//
//        }
//        return node
//    }
//
//
//
//}
//********************************************************************************************************************************

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()

        if let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "NewsPaperImages", bundle: Bundle.main) {
            
            configuration.trackingImages = trackedImages
            
            configuration.maximumNumberOfTrackedImages = 2
            
            
        }
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        //anchor is the image that it found
        //renderer function is a delegate method so it gets called automatically
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {

            if imageAnchor.referenceImage.name == "harrypotter" {
                //add sk video
                let videoNode = SKVideoNode(fileNamed: "harrypotter.mp4")
                
                videoNode.play()
                
                let videoScene = SKScene(size: CGSize(width: 480, height: 360))
                
                videoScene.addChild(videoNode)
                
                videoNode.position = CGPoint(
                    x: videoScene.size.width / 2,
                    y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                //creating a plan overlay on top of the found image
                let plane = SCNPlane(
                    width: imageAnchor.referenceImage.physicalSize.width,
                    height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = videoScene
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                node.addChildNode(planeNode)
            }
            
            
            
            if imageAnchor.referenceImage.name == "snape2" {
                
                //add sk video
                let videoNode = SKVideoNode(fileNamed: "snape2_.mp4")
                
                videoNode.play()
                
                let videoScene = SKScene(size: CGSize(width: 846, height: 1018))
                
                videoScene.addChild(videoNode)
                
                videoNode.position = CGPoint(
                    x: videoScene.size.width / 2,
                    y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                //creating a plan overlay on top of the found image
                let plane = SCNPlane(
                    width: imageAnchor.referenceImage.physicalSize.width,
                    height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = videoScene
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                node.addChildNode(planeNode)
                
                
            }
            
            
            if imageAnchor.referenceImage.name == "dumbledore_2" {
                  
                  //add sk video
                  let videoNode = SKVideoNode(fileNamed: "dumbledore.mp4")
                  
                  videoNode.play()
                  
                  let videoScene = SKScene(size: CGSize(width: 1754, height: 1296))
                  
                  videoScene.addChild(videoNode)
                  
                  videoNode.position = CGPoint(
                      x: videoScene.size.width / 2,
                      y: videoScene.size.height / 2)
                  
                  videoNode.yScale = -1.0
                  
                  //creating a plan overlay on top of the found image
                  let plane = SCNPlane(
                      width: imageAnchor.referenceImage.physicalSize.width,
                      height: imageAnchor.referenceImage.physicalSize.height)
                  
                  plane.firstMaterial?.diffuse.contents = videoScene
                  
                  let planeNode = SCNNode(geometry: plane)
                  
                  planeNode.eulerAngles.x = -.pi / 2
                  
                  node.addChildNode(planeNode)
                  
                  
              }
            
        }
            
        return node
    }
    
    
}








//*********************************************************************************************************************************
////Codigo cuando los cuadros son iguales para todos.
//import UIKit
//import SceneKit
//import ARKit
//
//class ViewController: UIViewController, ARSCNViewDelegate {
//
//    @IBOutlet var sceneView: ARSCNView!
//
//    //Global videoNodes to for future pause() & resume() options
//    //let videoNode = SKVideoNode(fileNamed: "video1.mp4")
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        sceneView.delegate = self
//    }
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        let configuration = ARImageTrackingConfiguration()
//
//        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "NewsPaperImages", bundle: Bundle.main) {
//
//            configuration.trackingImages = referenceImages
//            configuration.maximumNumberOfTrackedImages = 2
//        }
//
//        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
//    }
//
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        sceneView.session.pause()
//    }
//
//
//    // MARK: - ARSCNViewDelegate
//    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
//
//        let node = SCNNode()
//
//        if let imageAnchor = anchor as? ARImageAnchor {
//
//            let planeNode = createPlaneNode(with: imageAnchor)
//
//            if let imageName = imageAnchor.referenceImage.name {
//
//                createVideoScene(with: imageName, at: planeNode)
//            }
//
//            node.addChildNode(planeNode)
//        }
//
//        return node
//    }
//
//
//    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//        sceneView.session.remove(anchor: anchor)
//    }
//
//    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
//    }
//
//
//    //MARK: - Creates an invisible plane node on tracked image
//    func createPlaneNode(with imageAnchor: ARImageAnchor) -> SCNNode {
//
//        let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
//
//        //Invisible plane this time
//        //plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
//
//        let planeNode = SCNNode(geometry: plane)
//        planeNode.eulerAngles.x = -.pi/2
//
//        return planeNode
//    }
//
//
//    //MARK: - Creates a video scene on plane node
//    func createVideoScene(with imageName: String, at planeNode: SCNNode) {
//
//        let videoNode = SKVideoNode(fileNamed: "\(imageName).mp4")
//
//        let videoScene = SKScene(size: CGSize(width: 640, height: 360))
//        videoNode.play()
//
//        videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
//        videoNode.yScale = -1.0
//
//        videoScene.addChild(videoNode)
//        planeNode.geometry?.firstMaterial?.diffuse.contents = videoScene
//    }
//
//}


//********************************************************************************************************************************************
