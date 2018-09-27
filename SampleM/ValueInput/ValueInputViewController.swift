//
//  ValueInputViewController.swift
//  SampleMicroView
//
//  Created by 朴 成基 on 2018/09/14.
//  Copyright © 2018年 朴 成基. All rights reserved.
//

import UIKit
import Mew

final class ValueInputViewController: UIViewController, Instantiatable, Interactable {

    /*
     associatedtype Input
     
     associatedtype Environment
     
     public var environment: Self.Environment { get }
     
     public init(with input: Self.Input, environment: Self.Environment)
     
     associatedtype Output
     
     public func output(_ handler: ((Self.Output) -> Swift.Void)?)
     */
    
    enum PresentedStyle {
        case push
        case modal
    }
    
    struct Input {
        var presentedStyle: PresentedStyle
    }
    
    struct Model {
        var presentedStyle: PresentedStyle
    }
    
    
    
    var model: Model {
        didSet {
            
        }
    }
    
    typealias Output = Int
    typealias Environment = EnvironmentMock
    
    var environment: EnvironmentMock
    
    var handler:((Int) -> Void)?
    
    @IBOutlet weak var textfield: UITextField!
    
    init(with input: Input, environment: Environment) {
        self.model = Model(presentedStyle: input.presentedStyle)
        self.environment = environment
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func output(_ handler: ((Int) -> Void)?) {
        self.handler = handler
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let output = Int(textfield.text ?? "0") ?? 0
        switch model.presentedStyle {
        case .push:
            navigationController?.popViewController(animated: true)
            handler?(output)
        case .modal:
            dismiss(animated: true) {
                self.handler?(output)
            }
        }
    }
    
}
