/*
 * Copyright (c) 2015 Adrián Moreno Peña
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Cocoa
import WebKit

class TranslateViewController: NSViewController {
    @IBOutlet var webView: WebView!
    @IBOutlet var popOverViewController: NSPopover!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        webView.customUserAgent = "Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25"
        webView.mainFrame.load(URLRequest(url: URL(string: "https://translate.google.com")!))
    }
}

// MARK: Actions

extension TranslateViewController {
    
    func dialogOKCancel(_ question: String, text: String) {
        let myPopup: NSAlert = NSAlert()
        myPopup.messageText = question
        myPopup.informativeText = text
        myPopup.alertStyle = .warning
        myPopup.addButton(withTitle: "Quit")
        myPopup.addButton(withTitle: "Cancel")
        
        let window = webView.window!
        
        myPopup.beginSheetModal(for: window) { (response) in
            if (response == NSAlertFirstButtonReturn){
                NSApplication.shared().terminate(self)
            }
        }
    }
    
    @IBAction func clickExit(_ sender: AnyObject) {
        dialogOKCancel("MenuTranslate", text: "Do you want to quit?")
    }
}
