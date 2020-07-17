//
//  CLocation.swift
//  Entertainment
//
//  Created by 吕君 on 2020/6/23.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import UIKit

protocol CLoactionDelegate: NSObjectProtocol {
    
    /// 获取用户定位信息
    /// - Parameter placemark: 位置对象
    func getPlacemark(_ placemark: Placemark)
    
    /// 定位失败错误返回值
    /// - Parameter error:
    func didFailWithError(_ error: Error?)
}

class CLoaction: NSObject {
    
    weak var delegate: CLoactionDelegate?
    
    private lazy var locationManager: CLLocationManager = {
        let location = CLLocationManager()
        return location
    }()
    
    override init() {
        super.init()
    }
    
    func startLocation() {
        if CLLocationManager.authorizationStatus() != .denied {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
        } else {
            let alert = UIAlertController(title: "温馨提示", message: "请前往系统打开定位", preferredStyle: .alert)
            let open = UIAlertAction(title: "去设置", style: .default) { (_) in
                // 打开应用系统设置页面
                UserAuthorization.userAuthorization()
            }
            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            alert.addAction(open)
            alert.addAction(cancel)
            UIViewController.current?.present(alert)
        }
    }
}

extension CLoaction: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.delegate?.didFailWithError(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last ?? CLLocation()
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(currentLocation) { [weak self] (array, error) in
            guard (array?.count ?? 0) > 0 else {
                self?.delegate?.didFailWithError(error)
                return
            }
            
            guard let placemark = array?.first else {
                return
            }
            self?.delegate?.getPlacemark(
                Placemark(administrativeArea: placemark.administrativeArea ?? "",
                                    locality: placemark.locality ?? "",
                                    subLocality: placemark.subLocality ?? "",
                                    thoroughfare: placemark.thoroughfare ?? "")
            )
            self?.locationManager.delegate = nil
        }
    }
}

