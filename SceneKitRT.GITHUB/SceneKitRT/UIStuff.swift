//
//  UIStuff.swift
//  SceneKit RT
//
//  Created by Philipp Zay on 16.04.22.
//

import UIKit

extension GameViewController {
    
    func createUIElements() {
        
        DispatchQueue.main.async {
            
            // The View, that holds all Settings Components
            self.makeSettingsView()
            
            // Buttons
            self.makeCloseButton()
            self.makeSettingsButton()
            self.makeInfoLabel()
            
            // Segmented Control and Label
            self.makeSegmentedControl()
            self.labelSegmented = self.makeLabel(text: "LIGHT POSITION", alignment: .center)
            self.labelSegmented.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
            self.settingsView.addSubview(self.labelSegmented)
            
            
            // COUNTER LABELS
            self.labelSeconds                   = self.makeLabel(text: "SECONDS ELAPSED: ",   alignment: .left); self.settingsView.addSubview(self.labelSeconds)
            self.labelFrameRate                 = self.makeLabel(text: "FRAMES / SECOND: ",   alignment: .left); self.settingsView.addSubview(self.labelFrameRate)
            self.labelTotalFrames               = self.makeLabel(text: "FRAMES RENDERED: ",   alignment: .left); self.settingsView.addSubview(self.labelTotalFrames)
            self.labelRaysPerSecond             = self.makeLabel(text: "PRIMARY mRAYS/s: ",   alignment: .left); self.settingsView.addSubview(self.labelRaysPerSecond)
            self.labelSecondaryRaysPerSecond    = self.makeLabel(text: "SECONDARY mRAYS/s: ", alignment: .left); self.settingsView.addSubview(self.labelSecondaryRaysPerSecond)
            self.labelNumberTriangles           = self.makeLabel(text: "TRIANGLES COUNT: ",   alignment: .left); self.settingsView.addSubview(self.labelNumberTriangles)
            
            
            
            // SLIEDERS
            // RAY BOUNCES
            self.sliderRayBounces = self.makeSlider(min: 1.0, max: 15.0, setValue: Float(rayBounces))
            self.sliderRayBounces.addTarget(self, action: #selector(self.changeRayBounces(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderRayBounces)
            self.labelRayBounces  = self.makeLabel(text: "RAY BOUNCES / QUALITY", alignment: .left)
            self.settingsView.addSubview(self.labelRayBounces)
            
            // LIGHT SIZE / (SHADOW SHARPNESS)
            self.sliderShadowSharpness = self.makeSlider(min: 0.001, max: 4.0, setValue: Float(shadowSharpness))
            self.sliderShadowSharpness.addTarget(self, action: #selector(self.changeShadowSharpness(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderShadowSharpness)
            self.labelShadowSharpness  = self.makeLabel(text: "LIGHT SIZE", alignment: .left)
            self.settingsView.addSubview(self.labelShadowSharpness)
            
            // SCALE
            self.sliderScaleObject = self.makeSlider(min: 0.1, max: 2.0, setValue: objectScaleFactor)
            self.sliderScaleObject.addTarget(self, action: #selector(self.changeScaleObject(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderScaleObject)
            self.labelScaleObject  = self.makeLabel(text: "OBJECT SCALE", alignment: .left)
            self.settingsView.addSubview(self.labelScaleObject)
            
            // SHIFT Z
            self.sliderShiftZ = self.makeSlider(min: -1.0, max: +1.0, setValue: objectShiftZ)
            self.sliderShiftZ.addTarget(self, action: #selector(self.changeObjectShiftZ(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderShiftZ)
            self.labelShiftZ  = self.makeLabel(text: "OBJECT SHIFT Z", alignment: .left)
            self.settingsView.addSubview(self.labelShiftZ)
            
            // SHIFT Y
            self.sliderShiftY = self.makeSlider(min: -1.0, max: +1.0, setValue: objectShiftY)
            self.sliderShiftY.addTarget(self, action: #selector(self.changeObjectShiftY(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderShiftY)
            self.labelShiftY  = self.makeLabel(text: "OBJECT SHIFT Y", alignment: .left)
            self.settingsView.addSubview(self.labelShiftY)
            
            // SHIFT X
            self.sliderShiftX = self.makeSlider(min: -1.0, max: +1.0, setValue: objectShiftX)
            self.sliderShiftX.addTarget(self, action: #selector(self.changeObjectShiftX(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderShiftX)
            self.labelShiftX  = self.makeLabel(text: "OBJECT SHIFT X", alignment: .left)
            self.settingsView.addSubview(self.labelShiftX)
            
            // ROTATE Z
            self.sliderRotateZ = self.makeSlider(min: -180.0, max: +180.0, setValue: objectRotationZ)
            self.sliderRotateZ.addTarget(self, action: #selector(self.changeObjectRotationZ(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderRotateZ)
            self.labelRotateZ  = self.makeLabel(text: "OBJECT ROTATION Z", alignment: .left)
            self.settingsView.addSubview(self.labelRotateZ)
            
            // ROTATE Y
            self.sliderRotateY = self.makeSlider(min: -180.0, max: +180.0, setValue: objectRotationY)
            self.sliderRotateY.addTarget(self, action: #selector(self.changeObjectRotationY(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderRotateY)
            self.labelRotateY  = self.makeLabel(text: "OBJECT ROTATION Y", alignment: .left)
            self.settingsView.addSubview(self.labelRotateY)
            
            // ROTATE X
            self.sliderRotateX = self.makeSlider(min: -180.0, max: +180.0, setValue: objectRotationX)
            self.sliderRotateX.addTarget(self, action: #selector(self.changeObjectRotationX(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.sliderRotateX)
            self.labelRotateX  = self.makeLabel(text: "OBJECT ROTATION X", alignment: .left)
            self.settingsView.addSubview(self.labelRotateX)
            
            
            
            
            // MARK: SWITCHES
            // SWITCH COLORED OBJECT
            self.labelColorObject  = self.makeLabel(text: "GRAY OBJECT", alignment: .right)
            self.settingsView.addSubview(self.labelColorObject)
            self.switchColorObject = self.makeSwitch(setOn: isGrayObject)
            self.switchColorObject.addTarget(self, action: #selector(self.changeGrayObject(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.switchColorObject)
            
            // SWITCH COLORED BOX (Showroom)
            self.labelColorBox  = self.makeLabel(text: "COLORED BOX", alignment: .right)
            self.settingsView.addSubview(self.labelColorBox)
            self.switchColorBox = self.makeSwitch(setOn: isColoredBox)
            self.switchColorBox.addTarget(self, action: #selector(self.changeColoredBox(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.switchColorBox)
            
            // SWITCH DIFFUSE RAY TRACING for the Object
            self.labelDiffuse  = self.makeLabel(text: "REFLECTIVE OBJECT", alignment: .right)
            self.settingsView.addSubview(self.labelDiffuse)
            self.switchDiffuse = self.makeSwitch(setOn: isReflectiveObject)
            self.switchDiffuse.addTarget(self, action: #selector(self.changeReflectiveObject(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.switchDiffuse)
            
            // SWITCH DIFFUSE RAY TRACING for the Box
            self.labelDiffuseBox  = self.makeLabel(text: "REFLECTIVE BOX", alignment: .right)
            self.settingsView.addSubview(self.labelDiffuseBox)
            self.switchDiffuseBox = self.makeSwitch(setOn: isReflectiveBox)
            self.switchDiffuseBox.addTarget(self, action: #selector(self.changeReflectiveBox(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.switchDiffuseBox)
            
            // SWITCH SHOW OR HIDE LAMP
            self.labelVisibleLight  = self.makeLabel(text: "HIDE LIGHT", alignment: .right)
            self.settingsView.addSubview(self.labelVisibleLight)
            self.switchVisibleLight = self.makeSwitch(setOn: isNoVisibleLight)
            self.switchVisibleLight.addTarget(self, action: #selector(self.changeVisibleLight(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.switchVisibleLight)
            
            // SWITCH MASK LIGHT
            self.labelMaskLight  = self.makeLabel(text: "MASK LIGHT", alignment: .right)
            self.settingsView.addSubview(self.labelMaskLight)
            self.switchMaskLight = self.makeSwitch(setOn: isMaskLight)
            self.switchMaskLight.addTarget(self, action: #selector(self.changeMaskLight(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.switchMaskLight)
            
            // SWITCH DARK BOX (BLACK BOX)
            self.labelBlackBox  = self.makeLabel(text: "DARK BOX", alignment: .right)
            self.settingsView.addSubview(self.labelBlackBox)
            self.switchBlackBox = self.makeSwitch(setOn: isBlackBox)
            self.switchBlackBox.addTarget(self, action: #selector(self.changeBlackBox(_:)), for: .valueChanged) // the target func
            self.settingsView.addSubview(self.switchBlackBox)
            
            // Progress View
            self.labelProgress  = self.makeLabel(text: "RENDERING PROGRESS", alignment: .left)
            self.settingsView.addSubview(self.labelProgress)
            self.progressRayTracer = self.makeProgressView()
            self.settingsView.addSubview(self.progressRayTracer)
            
            
            
            
            // for Device Orientation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.switchDeviceOrientation()
            }
            
//            // Treat Visible Interfaces - depending on currentTexture
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.50) {
//                self.treatUIInterfaces()
//            }
            
            // Show Standard Buttons
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                self.showCloseButton()
                self.showSettingsButton()
                
            }
        }
    }
    
//    @objc func showHideSettings() {
//        
//        
//        isInSettingsMode = !isInSettingsMode
//        // impactFeedback(force: 1)
//        switch isInSettingsMode {
//        case true:
//            DispatchQueue.main.async {
//                self.showSettingsView()
//                GameViewController.displayLabelInfo(text: "CONTROLS")
//                // self.doubleTapGesture.isEnabled = false
//                self.panGesture.isEnabled       = false
//                
//            }
//        case false:
//            DispatchQueue.main.async {
//                self.hideSettingsView()
//                // self.doubleTapGesture.isEnabled = true
//                self.panGesture.isEnabled       = true
//            }
//        }
//    }
    
    // MARK: - Sliders and Switches with Label
    func makeLabel(text:String, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font                      = UIFont(name: mainUIFontName, size: 12.0)
        label.textColor                 = UIColor.lightGray
        label.textAlignment             = alignment
        label.backgroundColor           = UIColor.clear
        label.alpha                     = 1.0
        label.text                      = text
        return label
    }
    
    func makeSlider(min:Float, max:Float, setValue: Float) -> UISlider {
        
        let slider = UISlider()
        slider.minimumTrackTintColor    = GameViewController.mainColorization
        slider.maximumTrackTintColor    = UIColor.lightGray
        slider.thumbTintColor           = GameViewController.mainColorization
        slider.isEnabled                = true
        slider.alpha = 1.0
        slider.minimumValue = min
        slider.maximumValue = max
        slider.setValue(setValue, animated: false)
        return slider
    }
    
    func makeSwitch(setOn:Bool) -> UISwitch {
    
        let newSwitch = UISwitch()
        newSwitch.tintColor          = GameViewController.mainColorization
        newSwitch.onTintColor        = GameViewController.mainColorization
        newSwitch.backgroundColor    = UIColor.clear
        newSwitch.thumbTintColor     = GameViewController.mainColorization
        newSwitch.isEnabled          = true
        newSwitch.alpha              = 1.0
        newSwitch.setOn(setOn, animated: false)
        return newSwitch
    }
    
    func makeProgressView() -> UIProgressView {
    
        let progView = UIProgressView()
        progView.progressViewStyle = .bar
        progView.tintColor           = GameViewController.mainColorization
        progView.backgroundColor     = UIColor.clear
        progView.progressTintColor   = GameViewController.mainColorization
        progView.trackTintColor      = UIColor.lightGray
        progView.alpha               = 1.0
        progView.setProgress(0.0, animated: false)
        return progView
        
    }
    
    // MARK: Buttons
    @objc func pulseButton(_ sender: UIButton) { sender.pulsate() }
    @objc func pulseButtonDownUp(_ sender: UIButton) { sender.pulseDownUp() }
    
    func makeButtonCommon(_ button:inout UIButton, _ action:Selector, _ image:UIImage) {
        
        button.backgroundColor = UIColor.clear
        button.setImage(image, for: .disabled)
        button.setImage(image, for: .normal)
        button.setImage(image, for: .selected)
        button.setImage(image, for: .highlighted)
        button.addTarget(self, action: #selector(self.pulseButtonDownUp), for: .touchDown)
        button.addTarget(self, action: #selector(self.pulseButton), for: .touchUpInside)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.alpha = 0.0
        button.isEnabled = false
        self.view.addSubview(button)
        
    }
    
    
    // Close Button Show/Hide
    func showCloseButton() { DispatchQueue.main.async { self.closeButton.isEnabled     = true;  UIView.animate(withDuration: 1.0, animations: { self.closeButton.alpha = 1.0 }) }}
    func hideCloseButton() { DispatchQueue.main.async { self.closeButton.isEnabled     = false; UIView.animate(withDuration: 1.0, animations: { self.closeButton.alpha = 0.0 }) }}
    
    // Save Button Show/Hide
    func showSettingsButton()  { DispatchQueue.main.async { self.settingsButton.isEnabled  = true;  UIView.animate(withDuration: 1.0, animations: { self.settingsButton.alpha = 1.0 }) }}
    func hideSettingsButton()  { DispatchQueue.main.async { self.settingsButton.isEnabled  = false; UIView.animate(withDuration: 1.0, animations: { self.settingsButton.alpha = 0.0 }) }}
    
    // Make Buttons
    func makeCloseButton()      { makeButtonCommon(&closeButton, #selector(self.closeAction), uiImageClose!) }
    func makeSettingsButton()   { makeButtonCommon(&settingsButton,  #selector(self.showHideSettings), uiImageSettings!) }
    // MARK: - Display Label Info Function
    func makeInfoLabel() {
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:        GameViewController.trackingLabel.font = UIFont(name: mainUIFontName, size: 25.0)
        case .pad:          GameViewController.trackingLabel.font = UIFont(name: mainUIFontName, size: 50.0)
        case .unspecified:  break
        case .tv:           break
        case .carPlay:      break
        case .mac:          break
        @unknown default:   break
        }
        
        GameViewController.trackingLabel.textColor = GameViewController.mainColorization
        GameViewController.trackingLabel.textAlignment = .center
        GameViewController.trackingLabel.backgroundColor = UIColor.clear
        GameViewController.trackingLabel.alpha = 0.0
        
        self.view.addSubview(GameViewController.trackingLabel)
        
    }
    
    
    class func displayLabelInfo(text: String, _ color:UIColor = GameViewController.mainColorization) {
        DispatchQueue.main.async {
            self.trackingLabel.textColor = color
            self.trackingLabel.text      = text
            self.trackingLabel.alpha     = 1.0
            UIView.animate(withDuration: 5.0, animations: { self.trackingLabel.alpha = 0.0 })
        }
    }
    
    // UI Segmented Control for Movement Styles
    func makeSegmentedControl() {
        
        let items                                 = ["LEFT", "RIGHT", "TOP", "BOTTOM", "FRONT", "BACK"]
        segmentedControl                          = UISegmentedControl(items: items)
        
        var setPosition : Int!
        switch lightPosition {

        case .left:   setPosition = 0
        case .right:  setPosition = 1
        case .top:    setPosition = 2
        case .bottom: setPosition = 3
        case .front:  setPosition = 4
        case .back:   setPosition = 5
        }
        
        segmentedControl.selectedSegmentIndex     = setPosition
        
        // Style the Segmented Control
        segmentedControl.layer.cornerRadius       = 5.0  // Don't let background bleed
        segmentedControl.backgroundColor          = UIColor.clear
        segmentedControl.tintColor                = UIColor.lightGray
        segmentedControl.selectedSegmentTintColor = ViewController.mainColorization
        segmentedControl.isEnabled                = true
        segmentedControl.alpha                    = 1.0
        
        // Add target action method
        segmentedControl.addTarget(self, action: #selector(changeLightPosition(_:)), for: .valueChanged)
        
        // Set Font
        let normal:[NSAttributedString.Key : AnyObject] = [
            NSAttributedString.Key.foregroundColor : UIColor.lightGray,
            NSAttributedString.Key.font : UIFont(name: mainUIFontName, size: 12.0)!
        ]
        
        let selected:[NSAttributedString.Key : AnyObject] = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font : UIFont(name: mainUIFontName, size: 12.0)!
        ]
        
        segmentedControl.setTitleTextAttributes(normal,   for: .normal)
        segmentedControl.setTitleTextAttributes(normal,   for: .highlighted)
        segmentedControl.setTitleTextAttributes(selected, for: .selected)
        
        // Add this custom Segmented Control to our view
        self.settingsView.addSubview(self.segmentedControl)
        
    }
    
    // MARK: - Global Settings View
    
    func makeSettingsView() {
        settingsView.frame = view.frame
        settingsView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        settingsView.alpha = 0.0
        settingsView.isUserInteractionEnabled = false
        settingsView.isHidden = false
        view.addSubview(settingsView)
    }
    
    func showSettingsView() { DispatchQueue.main.async {
        self.settingsView.isUserInteractionEnabled = true
        UIView.animate(withDuration: 1.0, animations: { self.settingsView.alpha = 1.0 })
        self.switchDeviceOrientation()
    }}
    
    func hideSettingsView() { DispatchQueue.main.async {
            self.settingsView.isUserInteractionEnabled = false
            UIView.animate(withDuration: 1.0, animations: { self.settingsView.alpha = 0.0 })
    }}
    
    
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func createUIElements() {
        
        
        
        DispatchQueue.main.async {
            self.makeRayTraceButton()
            self.setupGeometryPicker()
            
            self.labelGeometryPicker  = self.makeLabel(text: "GEOMETRY", alignment: .center)
            self.labelGeometryPicker.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
            self.view.addSubview(self.labelGeometryPicker)
            
            // CHANGE COLOR
            self.sliderColor = self.makeSlider(min: 0.0, max: 1.0, setValue: 0.0) // for objectColor, but this is a UIColor - fix changeColor func
            self.sliderColor.addTarget(self, action: #selector(ViewController.changeColor(_:)), for: .valueChanged) // the target func
            self.view.addSubview(self.sliderColor)
            self.labelColor  = self.makeLabel(text: "ROTATE COLOR", alignment: .left)
            self.view.addSubview(self.labelColor)
            
            // DIFFUSE SWITCH
            self.labelDiffuse  = self.makeLabel(text: "REFLECTIVE", alignment: .right)
            self.view.addSubview(self.labelDiffuse)
            self.switchDiffuse = self.makeSwitch(setOn: self.isReflective)
            self.switchDiffuse.addTarget(self, action: #selector(self.changeDiffuseReflective(_:)), for: .valueChanged) // the target func
            self.view.addSubview(self.switchDiffuse)
            
            // for Device Orientation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.switchDeviceOrientation()
            }
        }
        
        
    }
    
    func makeRayTraceButton()   { makeButtonCommon(&rayTraceButton,#selector(self.loadRayTracer), uiImageRayTrace!) }
    
    // MARK: Buttons
    @objc func pulseButton(_ sender: UIButton) { sender.pulsate() }
    @objc func pulseButtonDownUp(_ sender: UIButton) { sender.pulseDownUp() }
    
    func makeButtonCommon(_ button:inout UIButton, _ action:Selector, _ image:UIImage) {
        
        button.backgroundColor = UIColor.clear
        button.setImage(image, for: .disabled)
        button.setImage(image, for: .normal)
        button.setImage(image, for: .selected)
        button.setImage(image, for: .highlighted)
        button.addTarget(self, action: #selector(self.pulseButtonDownUp), for: .touchDown)
        button.addTarget(self, action: #selector(self.pulseButton), for: .touchUpInside)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.alpha                    = 1.0
        button.isEnabled                = true
        self.view.addSubview(button)
        
    }
    
    func makeLabel(text:String, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font                      = UIFont(name: mainUIFontName, size: 12.0)
        label.textColor                 = UIColor.lightGray
        label.textAlignment             = alignment
        label.backgroundColor           = UIColor.clear
        label.alpha                     = 1.0
        label.text                      = text
        return label
    }
    
    func makeSlider(min:Float, max:Float, setValue: Float) -> UISlider {
        
        let slider = UISlider()
        slider.minimumTrackTintColor    = ViewController.mainColorization
        slider.maximumTrackTintColor    = UIColor.lightGray
        slider.thumbTintColor           = ViewController.mainColorization
        slider.isContinuous             = true
        slider.isEnabled                = true
        slider.alpha                    = 1.0
        slider.minimumValue             = min
        slider.maximumValue             = max
        slider.setValue(setValue, animated: false)
        return slider
    }
    
    func makeSwitch(setOn:Bool) -> UISwitch {
    
        let newSwitch = UISwitch()
        newSwitch.tintColor             = ViewController.mainColorization
        newSwitch.onTintColor           = ViewController.mainColorization
        newSwitch.backgroundColor       = UIColor.clear
        newSwitch.thumbTintColor        = ViewController.mainColorization
        newSwitch.isEnabled             = true
        newSwitch.alpha                 = 1.0
        newSwitch.setOn(setOn, animated: false)
        return newSwitch
    }
    
    
    
    @objc func changeColor(_ sender: UISlider) {
        let color = UIColor(hue: CGFloat(sender.value), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        objectNode.geometry?.firstMaterial?.diffuse.contents = color
        globalObjectColor = simd_float3(color.redValue, color.greenValue, color.blueValue)
    }
    
    
    
    @objc func changeDiffuseReflective(_ sender: UISwitch) {
        isReflective = sender.isOn
        
        if isReflective {
            objectNode.geometry?.firstMaterial?.roughness.contents = 0.1 // 0.1
        } else {
            objectNode.geometry?.firstMaterial?.roughness.contents = 0.9
        }
    }
    
    // MARK: Setup Picker
    // What to do
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentGeometry = row
        placeContent()
    }
    
    
    func setupGeometryPicker() {
        
        // Primitives
        geometryData = [
            "Sphere",
            "Box",
            "Torus",
            "Cylinder",
            "Pyramid",
            "Ico Sphere",
            "Spiky Ball",
            "Strange Object",
            "Virus",
            "Explosion",
            "Zombie",
            "Brillant",
            "Monkey",
            "Teapot",
            "SceneKit RT",
        ]
        
        geometryPickerView.isHidden = false
        geometryPickerView.alpha = 1.0
        geometryPickerView.dataSource = self
        geometryPickerView.delegate = self
        geometryPickerView.backgroundColor = UIColor.clear
        geometryPickerView.layer.borderWidth = 0
        geometryPickerView.selectRow(currentGeometry, inComponent: 0, animated: true)
        geometryPickerView.isUserInteractionEnabled = true
        geometryPickerView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        self.view.addSubview(geometryPickerView)
    }
    
//    func showSkyBoxPicker() { DispatchQueue.main.async { self.skyboxPickerView.isUserInteractionEnabled = true; UIView.animate(withDuration: 1.0, animations: { self.skyboxPickerView.alpha = 1.0 }) }}
//    func hideSkyBoxPicker() { DispatchQueue.main.async { self.skyboxPickerView.isUserInteractionEnabled = false; UIView.animate(withDuration: 1.0, animations: { self.skyboxPickerView.alpha = 0.0 }) }}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var dataCount : Int?
        
        dataCount = geometryData.count
        
        return dataCount! // pickerData.count
    }
    
    // titleForRow
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var dataName : String?
        dataName = geometryData[row]
        
        return dataName // pickerData[row] // pickerData.count
        
    }
    
   
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: mainUIFontName, size: 25.0)
            pickerLabel?.textAlignment = .left
            
        }
        
        pickerLabel?.text = geometryData[row]
        
        // pickerLabel?.text = pickerData[row]
        pickerLabel?.textColor = ViewController.mainColorization
        
        // pickerView.subviews[0].isHidden = true
        pickerView.subviews[1].isHidden = true
        
        return pickerLabel!
    }
    
}

