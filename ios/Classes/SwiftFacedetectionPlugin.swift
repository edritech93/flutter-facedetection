import Flutter
import UIKit
import MLKitFaceDetection
import MLKitVision

public class SwiftFacedetectionPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "facedetection", binaryMessenger: registrar.messenger())
        let instance = SwiftFacedetectionPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print("handle \(call.method)")
        guard let args = call.arguments as? Dictionary<String, Any> else {
            result(FlutterError.init(code: "bad args", message: nil, details: nil))
            return
        }
        guard let imagePath = args["path"] as? String else {
            result(FlutterError.init(code: "path null", message: "path is null", details: nil))
            return
        }
        handleDetection(imagePath: imagePath, result: result);
    }
    
    private func handleDetection(imagePath: String, result: @escaping FlutterResult) {
        let image =  UIImage(contentsOfFile: imagePath)
        let visionImage = VisionImage(image: image!)
        visionImage.orientation = image?.imageOrientation ?? .up
        
        let options = FaceDetectorOptions()
        options.performanceMode = .fast
        options.classificationMode = .none
        options.contourMode = .none
        options.landmarkMode = .none
        
        let faceDetector = FaceDetector.faceDetector(options: options)
        
        faceDetector.process(visionImage) { faces, error in
            print("faces => \(String(describing: faces?.count))")
            result(faces)
        }
    }
}
