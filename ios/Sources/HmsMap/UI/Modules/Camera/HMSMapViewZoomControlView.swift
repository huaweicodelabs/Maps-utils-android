/*
 Copyright 2021. Huawei Technologies Co., Ltd. All rights reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import UIKit

protocol HMSMapViewZoomControlViewDelegate: AnyObject {
    func zoomInButtonPressed()
    func zoomOutButtonPressed()
}

public final class HMSMapViewZoomControlView: UIView {

    weak var delegate: HMSMapViewZoomControlViewDelegate?

    /**
     * If not nil,  sets the zoom in Image.
     */
    public var zoomInButtonImage: UIImage? {
        didSet {
            if let image = zoomInButtonImage {
                zoomInButton.setImage(image, for: .normal)
            }
        }
    }

    /**
     * If not nil,  sets the zoom out Image.
     */
    public var zoomOutButtonImage: UIImage? {
        didSet {
            if let image = zoomOutButtonImage {
                zoomOutButton.setImage(image, for: .normal)
            }
        }
    }

    /**
     * Default zoom in button.
     */
    public lazy var zoomInButton: UIButton = {
        let zoomInButton = UIButton(type: .system)
        zoomInButton.frame = CGRect(x: 8, y: 8, width: 20, height: 20)
        zoomInButton.setImage(UIImage(systemName: "plus"), for: .normal)
        zoomInButton.addTarget(self, action: #selector(zoomInButtonPressed), for: .touchUpInside)
        return zoomInButton
    }()

    /**
     * Default zoom in button.
     */
    public lazy var zoomOutButton: UIButton = {
        let zoomOutButton = UIButton(type: .system)
        zoomOutButton.frame = CGRect(x: 8, y: 44, width: 20, height: 20)
        zoomOutButton.setImage(UIImage(systemName: "minus"), for: .normal)
        zoomOutButton.addTarget(self, action: #selector(zoomOutButtonPressed), for: .touchUpInside)
        return zoomOutButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addRound()
        self.addShadow()
        self.backgroundColor = .white

        self.addSubview(zoomInButton)
        self.addSubview(zoomOutButton)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func zoomInButtonPressed(sender: UIButton!) {
        delegate?.zoomInButtonPressed()
    }

    @objc
    private func zoomOutButtonPressed(sender: UIButton!) {
        delegate?.zoomOutButtonPressed()
    }

}
