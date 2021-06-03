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
import MapKit

open class HMSMapView: UIView {

    /** HMSMapView delegate. */
    public weak var delegate: HMSMapViewDelegate?

    /**
     * If not nil, constrains the camera target so that gestures cannot cause it to leave the specified
     * bounds.
     */
    public var cameraTargetBounds: HMSCoordinateBounds? {
        didSet {
            constrainCameraTarget()
        }
    }

    /**
     * Controls the camera, which defines how the map is oriented. Modification of this property is
     * instantaneous.
     */
    public var camera: HMSCameraPosition! {
        didSet {
            setCamera(animated: false)
        }
    }

    /**
     * Controls the camera, which defines how the map is oriented. Modification of this property is
     * instantaneous.
     */
    private func setCamera(animated: Bool = true) {
        if callSetCamera {
            moveCamera(HMSCameraUpdate.setCamera(camera), animated: animated)
        }
    }

    /**
     * Controls the type of map tiles that should be displayed.  Defaults to HMSMapType.basic.
     */
    public var mapType: HMSMapType? = HMSMapType.basic {
        didSet {
            guard let type = mapType else { return }

            switch type {
            case .empty:
                mapView.mapType = .mutedStandard
            default:
                mapView.mapType = .standard
            }
        }
    }

    /**
     * Minimum zoom (the farthest the camera may be zoomed out). Defaults to minZoomLevel. Modified
     * with -setMinZoom:maxZoom:.
     */
    public private(set) var minZoom: Float = -1

    /**
     * Maximum zoom (the closest the camera may be to the Earth). Defaults to maxZoomLevel. Modified
     * with -setMinZoom:maxZoom:.
     */
    public private(set) var maxZoom: Float = -1

    /**
     * Controls whether the My Location dot and accuracy circle is enabled. Defaults to false.
     */
    public var isMyLocationEnabled = false {
        didSet {
            mapView.showsUserLocation = isMyLocationEnabled
        }
    }

    /**
     * If My Location is enabled, reveals where the user location dot is being drawn. If it is disabled,
     * or it is enabled but no location data is available, this will be nil.  This property is
     * observable using KVO.
     */
    public private(set) lazy var myLocation: CLLocation? = {
        return self.mapView.userLocation.location
    }()

    /**
     * Controls whether the My Location button is enabled. Defaults to false.
     */
    public var setMyLocationButtonEnabled = false {
        didSet {
            if setMyLocationButtonEnabled {
                mapView.addSubview(myLocationView)
            } else {
                myLocationView.removeFromSuperview()
            }
        }
    }

    /**
     * Indicates whether the zoom controls are enabled. The zoom controls are enabled by default.
     */
    public var zoomControlsEnabled = false {
        didSet {
            if zoomControlsEnabled {
                mapView.addSubview(zoomControlView)
            } else {
                zoomControlView.removeFromSuperview()
            }
        }
    }

    /**
     * Indicates whether the zoom function is enabled. The zoom function is enabled by default.
     */
    public var zoomGesturesEnabled = true {
        didSet {
            mapView.isZoomEnabled = zoomGesturesEnabled
        }
    }

    /**
     * Indicates whether the rotate gestures are enabled. The rotate gestures are enabled by default.
     */
    public var rotateGesturesEnabled = false {
        didSet {
            mapView.isRotateEnabled = rotateGesturesEnabled
        }
    }

    /**
     * You can use the HuaweiMap.setPadding(int left, int top, int right, int bottom) method to set the padding between the map camera area bounds and map controls. Input parameters of the method are as follows:
     * left: incremental distance from the map controls to the left edge of the map, in pixels.
     * top: incremental distance from the map controls to the top edge of the map, in pixels.
     * right: incremental distance from the map controls to the right edge of the map, in pixels.
     * bottom: incremental distance from the map controls to the bottom edge of the map, in pixels.
     */
    public var padding = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 20) {
        didSet {
            mapView.layoutMargins = padding
        }
    }

    /**
     * Clears all markup that has been added to the map, including markers, polylines and ground
     * overlays.  This will not clear the visible location dot or reset the current mapType.
     */
    public func clear() {
        mapView.removeAnnotations(mapView.annotations)
    }

    /**
     * Sets |minZoom| and |maxZoom|. This method expects the minimum to be less than or equal to the
     * maximum, and will throw an exception with name NSRangeException otherwise.
     */
    public func setMinZoom(_ minZoom: Float, maxZoom: Float, completion: @escaping (Result<Bool, Error>) -> Void) {
        if minZoom > maxZoom {
            completion(.failure(HmsMapError.minZoomCorrupted as NSError))
        }
        self.minZoom = minZoom
        self.maxZoom = maxZoom
        completion(.success(true))
        mapView.setCameraZoomRange(MKMapView.CameraZoomRange(minCenterCoordinateDistance: getDistance(from: maxZoom), maxCenterCoordinateDistance: getDistance(from: minZoom)), animated: false)
    }

    /**
     * Changes the camera according to |update|. The camera change is instantaneous (with no animation).
     */
    public func moveCamera(_ update: HMSCameraUpdate, animated: Bool = false) {
        if let camera = update.camera {
            let mapCamera = MKMapCamera(lookingAtCenter: camera.target ?? self.camera.target!, fromDistance: getDistance(from: camera.zoom ?? self.camera.zoom!), pitch: camera.bearing ?? 0, heading: camera.viewingAngle ?? 0)
            mapView.setCamera(mapCamera, animated: animated)
        }
    }

    /**
     * Check whether the given camera positions would practically cause the camera to be rendered the
     * same, taking into account the level of precision and transformations used internally.
     */
    public func areEqual(forRenderingPosition position: HMSCameraPosition, otherPosition: HMSCameraPosition) -> Bool {
        return position.isEqual(otherPosition)
    }

    /**
     * Annotations are models used to annotate coordinates on the map.
     * Implement mapView:viewForAnnotation: on MKMapViewDelegate to return the annotation view for each annotation.
     */
    internal func addAnnotation(_ annotation: MKAnnotation) {
        mapView.addAnnotation(annotation)
    }

    internal func removeAnnotation(_ annotation: MKAnnotation) {
        mapView.removeAnnotation(annotation)
    }

    /// Builds and returns a HMSMapView, with a frame and camera target.
    /// - Parameters:
    ///   - frame: CGRect instance.
    ///   - camera: HMSCameraPosition instance.
    required public init(frame: CGRect, camera: HMSCameraPosition? = nil) {
        if let camera = camera {
            self.camera = camera
            self.minZoom = camera.minZoomValue
            self.maxZoom = camera.maxZoomValue
        }
        super.init(frame: frame)
        drawMapView()
        addGestureRecognizers()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views

    /**
     * mapView created by MKMapView.
     */
    public lazy var mapView: MKMapView = {
        let view = MKMapView(frame: self.frame)
        view.delegate = self
        return view
    }()

    /**
     * HMSMapViewZoomControlView contains zoom controls.
     */
    private lazy var zoomControlView: HMSMapViewZoomControlView = {
        let zoomControlViewWidth: CGFloat = 36
        let zoomControlViewHeight: CGFloat = 72
        let zoomControlViewX = mapView.frame.width - zoomControlViewWidth - padding.right
        let zoomControlViewY = mapView.frame.height - zoomControlViewHeight - padding.bottom - 56

        let zoomControlView = HMSMapViewZoomControlView(frame: CGRect(x: zoomControlViewX, y: zoomControlViewY, width: zoomControlViewWidth, height: zoomControlViewHeight))
        zoomControlView.delegate = self
        return zoomControlView
    }()

    /**
     * HMSMapViewMyLocationView contains my location button.
     */
    private lazy var myLocationView: HMSMapViewMyLocationView = {
        let containerViewWidth: CGFloat = 36
        let containerViewHeight: CGFloat = 36
        let containerViewX = mapView.frame.width - containerViewWidth - padding.right
        let containerViewY = mapView.frame.height - containerViewHeight - padding.bottom

        return HMSMapViewMyLocationView(frame: CGRect(x: containerViewX, y: containerViewY, width: containerViewWidth, height: containerViewHeight), mapView: mapView)
    }()

    /** Altitude rise value used to increase or decrease altitude exponentially with each step. */
    private let altitudeRise: Float = 300

    /** To prevent infinite loops. */
    private var callSetCamera = true

    /** Get distance from zoom. Between 3 and 20. 3 is the largest value. */
    private func getDistance(from zoom: Float) -> Double {
        if let camera = camera, zoom >= camera.minZoomValue && zoom <= camera.maxZoomValue {
            return Double(pow(2, camera.maxZoomValue - zoom) * altitudeRise)
        }
        return Double(zoom)
    }

    /** Get zoom from distance. */
    private func getZoom(from distance: Double) -> Float {
        if let maxZoomValue = camera?.maxZoomValue {
            return maxZoomValue - log2(Float(distance) / altitudeRise)
        }
        return 0
    }

    /**
     * Constrains the camera target so that gestures cannot cause it to leave the specified
     * bounds.
     */
    func constrainCameraTarget() {
        if let cameraTargetBounds = cameraTargetBounds, let coordinate1 = cameraTargetBounds.northEast, let coordinate2 = cameraTargetBounds.southWest {
            let latitudeDelta = abs(coordinate1.latitude - coordinate2.latitude)
            let longitudeDelta = abs(coordinate1.longitude - coordinate2.longitude)
            let latitude = min(coordinate1.latitude, coordinate2.latitude) + latitudeDelta / 2
            let longitude = min(coordinate1.longitude, coordinate2.longitude) + longitudeDelta / 2
            mapView.cameraBoundary = MKMapView.CameraBoundary(coordinateRegion: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)))
        } else {
            mapView.cameraBoundary = nil
        }
    }

}

extension HMSMapView {

    fileprivate func drawMapView() {
        addSubview(mapView)
    }

    fileprivate func addGestureRecognizers() {
        let doubleTapGestureRecognizer = UITapGestureRecognizer()
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        mapView.addGestureRecognizer(doubleTapGestureRecognizer)

        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer))
        mapView.addGestureRecognizer(singleTapGestureRecognizer)
        singleTapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)

        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGestureRecognizer))
        mapView.addGestureRecognizer(longPressGestureRecognizer)
    }

    @objc
    func handleTapGestureRecognizer(sender: UITapGestureRecognizer) {
        let coordinate = mapView.convert(sender.location(in: mapView), toCoordinateFrom: mapView)
        delegate?.mapView(self, didTapAt: coordinate)
    }

    @objc
    func handleLongPressGestureRecognizer(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.ended {
            let coordinate = mapView.convert(sender.location(in: mapView), toCoordinateFrom: mapView)
            delegate?.mapView(self, didLongPressAt: coordinate)
        }
    }

}

extension HMSMapView: MKMapViewDelegate {

    public func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        delegate?.mapView(willMove: self)
    }

    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        callSetCamera = false
        camera = HMSCameraPosition(latitude: mapView.camera.centerCoordinate.latitude, longitude: mapView.camera.centerCoordinate.longitude, zoom: getZoom(from: mapView.camera.altitude), bearing: mapView.camera.pitch, viewingAngle: mapView.camera.heading)
        callSetCamera = true

        delegate?.mapView(didMove: self)
    }

    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            let marker = HMSMarker(annotation: annotation, map: self)

            delegate?.mapView(self, didTap: marker)
        }
    }

    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation {
            let marker = HMSMarker(annotation: annotation, map: self)

            delegate?.mapView(self, didTapInfoWindowOf: marker)
        }
    }

}

// Delegate: HMSMapViewZoomControlViewDelegate
extension HMSMapView: HMSMapViewZoomControlViewDelegate {

    /** This method called when the users press zoom in button.  */
    func zoomInButtonPressed() {
        camera?.setZoom((camera?.zoom)!+1)
        setCamera()
    }

    /** This method called when the users press zoom out button.  */
    func zoomOutButtonPressed() {
        camera?.setZoom((camera?.zoom)!-1)
        setCamera()
    }

}
