//
//  MemojiInputView.swift
//  clust
//
//  Created by João Madruga on 31/03/23.
//

import Foundation
import SwiftUI
import UIKit

struct MemojiInputView: UIViewControllerRepresentable {
    @State private var memojiText: String = ""
    @State var imageBase64String: String
    
    var updateHandler: (String) -> Void
    
    init(_ initialImageString: String,
         handler: @escaping (String) -> Void = {_ in }) {
        self.imageBase64String = initialImageString
        self.updateHandler = handler
    }

    func makeUIViewController(context: Context) -> MemojiInputViewController {
        return MemojiInputViewController(
            coordinator: makeCoordinator()
        )
    }

    func updateUIViewController(
        _ controller: MemojiInputViewController,
        context: Context
    ) {
        controller.textView.text = memojiText
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(memojiInputView: self,
                           imageBase64String: $imageBase64String,
                           handler: updateHandler)
    }

    var textInputMode: UITextInputMode? {
            for mode in UITextInputMode.activeInputModes {
                if mode.primaryLanguage == "emoji" {
                    return mode
                }
            }
            return nil
    }


    class Coordinator: NSObject, UITextViewDelegate {
        var memojiInputView: MemojiInputView
        @Binding var imageBase64String: String
        var updateHandler: (String) -> Void

        init(memojiInputView: MemojiInputView,
             imageBase64String: Binding<String>,
             handler: @escaping (String) -> Void) {
            self.memojiInputView = memojiInputView
            self._imageBase64String = imageBase64String
            self.updateHandler = handler
        }


        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange,
                      replacementText text: String) -> Bool {
            // Check if the pasteboard contains an image
            if let image = UIPasteboard.general.image {

                // Convert the image to a base64-encoded string and set it as the memoji text
                let imageData = image.pngData()!
                let base64String = imageData.base64EncodedString()

                // Set the imageBase64String variable to the base64-encoded string of the image
                self.imageBase64String = base64String
                self.updateHandler(base64String)
            }

            // Return false to dont the string to be pasted into the text field
            return false
        }
    }
}

class MemojiInputViewController: UIViewController {
    var textView = EmojiTextField()
    var coordinator: MemojiInputView.Coordinator
    let memojiSelectorView: UIView

    init(textView: EmojiTextField = EmojiTextField(), coordinator: MemojiInputView.Coordinator) {
        self.textView = textView
        self.coordinator = coordinator
        self.memojiSelectorView = UIHostingController(
            rootView: ProfileCircle(
                bindingImage: coordinator.$imageBase64String,
                isBase64: true
            )).view!

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonaction(button: UIButton) {
        if textView.isFirstResponder {
            textView.resignFirstResponder()
        } else {
            textView.becomeFirstResponder()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textView)
        textView.addSubview(memojiSelectorView)

        memojiSelectorView.translatesAutoresizingMaskIntoConstraints = false
        memojiSelectorView.centerXAnchor.constraint(
            equalTo: textView.centerXAnchor
        ).isActive = true
        memojiSelectorView.centerYAnchor.constraint(
            equalTo: textView.centerYAnchor
        ).isActive = true
        memojiSelectorView.widthAnchor.constraint(
            equalToConstant: textView.frame.width
        ).isActive = true
        memojiSelectorView.heightAnchor.constraint(
            equalToConstant: textView.frame.height
        ).isActive = true
        memojiSelectorView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonaction)))

        //Setting Cursor color to none
        textView.tintColor = UIColor.clear
        textView.allowsEditingTextAttributes = true
        textView.delegate = coordinator
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        textView.centerYAnchor.constraint(
            equalTo: view.centerYAnchor
        ).isActive = true
        textView.widthAnchor.constraint(
            equalToConstant: view.frame.width
        ).isActive = true
        textView.heightAnchor.constraint(
            equalToConstant: view.frame.height
        ).isActive = true
    }
}

class EmojiTextField: UITextView {
    // required for iOS 13
    override var textInputContextIdentifier: String? { "" } // return non-nil to show the Emoji keyboard ¯\_(ツ)_/¯

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}

struct MemojiInput_Previews: PreviewProvider {
    @State static var image: String = "profile"

    static var previews: some View {
        MemojiInputView(image)
    }
}
