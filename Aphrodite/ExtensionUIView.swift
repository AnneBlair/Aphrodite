//
//  ExtensionUIView.swift
//  Aphrodite
//
//  Created by AnneBlair on 2017/9/9.
//  Copyright © 2017年 blog.aiyinyu.com. All rights reserved.
//

import Foundation

public extension View {
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable public var shadowColor: UIColor? {
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable public var zPosition: CGFloat {
        get {
            return layer.zPosition
        }
        
        set {
            layer.zPosition = newValue
        }
    }
}

//MARK:            ________________Extension AKLineView________________
#if os(iOS)
    extension PinchGesture {
        final var aScale: CGFloat {
            get {
                return scale
            }
            set {
                scale = newValue
            }
        }
    }
    
    extension RotationGesture {
        final var aRotation: CGFloat {
            get {
                return rotation
            }
            set {
                rotation = newValue
            }
        }
    }
    
    extension View {
        /// GestureRecognizers
        var aGestures: [Gesture]? {
            return self.gestureRecognizers
        }
    }
    
    extension ScrollView {
        
        var aIsScrollEnabled: Bool {
            get {
                return isScrollEnabled
            }
            
            set {
                isScrollEnabled = newValue
            }
        }
    }
    
    extension Screen {
        
        final var aScale: CGFloat {
            return self.scale
        }
    }
    
    //MARK:            ________________Graphics________________
    
    /// UIGraphicsGetCurrentContext
    /// Returns the current graphics context.
    /// - Returns: UIGraphicsGetCurrentContext
    func AGraphicsContext() -> CGContext? {
        return UIGraphicsGetCurrentContext()
    }
    
    /// UIGraphicsGetImageFromCurrentImageContext
    /// Returns an image based on the contents of the current bitmap-based graphics context.
    /// - Returns: UIGraphicsGetImageFromCurrentImageContext()
    func AGraphicsImageContext() -> Image! {
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// UIGraphicsPushContext
    /// Makes the specified graphics context the current context.
    /// - Parameter context: CGContext
    func AGraphicsPushContext(_ context: CGContext) {
        UIGraphicsPushContext(context)
    }
    
    /// UIGraphicsPopContext
    /// Removes the current graphics context from the top of the stack, restoring the previous context.
    func AGraphicsPopContext() {
        UIGraphicsPopContext()
    }
    
    /// UIGraphicsEndImageContext
    /// Removes the current bitmap-based graphics context from the top of the stack.
    func AGraphicsEndImageContext() {
        UIGraphicsEndImageContext()
    }
    
    /// Returns the data for the specified image in PNG format
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    ///
    /// - Parameter image: The original image data.
    
    /// - Returns: A data object containing the PNG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func AImagePNGRepresentation(_ image: Image) -> Data? {
        return UIImagePNGRepresentation(image)
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    ///
    /// - Parameters:
    ///   - image: The original image data.
    ///   - quality: The quality of the resulting JPEG image,
    /// - Returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func AImageJPEGRepresentation(_ image: Image, _ quality: CGFloat = 0.8) -> Data? {
        return UIImageJPEGRepresentation(image, quality)
    }
    
    /// eturns the screen object representing the device’s screen.
    ///
    /// - Returns: The screen object for the device Screen.main
    func AMain() -> Screen? {
        return Screen.main
    }
    
    /// Creates a bitmap-based graphics context with the specified options.
    ///
    /// - Parameters:
    ///   - size: The size (measured in points) of the new bitmap context
    ///   - opaque: A Boolean flag indicating whether the bitmap is opaque. If you know the bitmap is fully opaque, specify true to ignore the alpha channel and optimize the bitmap’s storage.
    ///   - scale: The scale factor to apply to the bitmap. If you specify a value of 0.0, the scale factor is set to the scale factor of the device’s main screen.
    func AGraphicsBeginImageContextWithOptions(_ size: CGSize, _ opaque: Bool, _ scale: CGFloat) {
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    }
#endif
