//
//  JZLocationConverter.swift
//  Pods-JZLocationConverter
//
//  Created by yunzhi.liu-a2105 on 2025/1/21.
//

import Foundation
import CoreLocation

public extension JZLocationConverter {
    
    /**
     *    @brief    判断WGS-84坐标是否在台湾
     *
     *    @param     location     世界标准地理坐标（WGS-84）
     *    
     *    台湾所处坐标范围 WGS-84坐标系
     *
     *    台湾岛
     *
     *    北纬 25.312839377631335
     *
     *    南纬 21.88064442633305
     *
     *    东经 122.07678177800152
     *
     *    西经 120.01822860298347
     *
     *    台湾澎湖县
     *
     *    北纬 23.809750919537784
     *
     *    南纬 21.88064442633305  (与台湾岛连接，直接使用台湾岛的纬度)
     *
     *    东经 122.07678177800152 (与台湾岛连接，直接使用台湾岛的经度)
     *
     *    西经 119.31026231360003
     *
     *    @return    是否在台湾
     */
    @objc
    static func isInTaiWan(_ location: CLLocationCoordinate2D) -> Bool {
        
        if location.latitude > 21.88064442633305
            && location.latitude < 25.312839377631335
            && location.longitude > 120.01822860298347
            && location.longitude < 122.07678177800152 {
            return true
        }
        
        if location.latitude > 21.88064442633305
            && location.latitude < 23.809750919537784
            && location.longitude > 119.31026231360003
            && location.longitude < 122.07678177800152 {
            return true
        }
        
        return false
    }
    

    /**
     *    @brief    判断WGS-84坐标是否在香港
     *
     *    @param     location     世界标准地理坐标（WGS-84）
     *
     *    香港所处坐标范围 WGS-84坐标系
     *
     *    根据1997年7月1日颁布的国务院令第221号，
     *    http://www.reformdata.org/1997/0701/227.shtml
     *
     *    @return    是否在香港
     */
    @objc
    static func isInHongKong(_ location: CLLocationCoordinate2D) -> Bool {
        let polygon: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2D(latitude: 22.543669, longitude: 114.226347),
            CLLocationCoordinate2D(latitude: 22.545950, longitude: 114.225667),
            CLLocationCoordinate2D(latitude: 22.547850, longitude: 114.226919),
            CLLocationCoordinate2D(latitude: 22.548008, longitude: 114.226906),
            CLLocationCoordinate2D(latitude: 22.556525, longitude: 114.206736),
            CLLocationCoordinate2D(latitude: 22.510064, longitude: 113.995056),
            CLLocationCoordinate2D(latitude: 22.472358, longitude: 113.947806),
            CLLocationCoordinate2D(latitude: 22.428806, longitude: 113.869111),
            CLLocationCoordinate2D(latitude: 22.333333, longitude: 113.869111),
            CLLocationCoordinate2D(latitude: 22.273111, longitude: 113.847239),
            CLLocationCoordinate2D(latitude: 22.267722, longitude: 113.839000),
            CLLocationCoordinate2D(latitude: 22.239278, longitude: 113.826389),
            CLLocationCoordinate2D(latitude: 22.217056, longitude: 113.817111),
            CLLocationCoordinate2D(latitude: 22.183861, longitude: 113.832389),
            CLLocationCoordinate2D(latitude: 22.142528, longitude: 113.896556),
            CLLocationCoordinate2D(latitude: 22.136722, longitude: 113.922389),
            CLLocationCoordinate2D(latitude: 22.148472, longitude: 113.939556),
            CLLocationCoordinate2D(latitude: 22.148472, longitude: 114.236000),
            CLLocationCoordinate2D(latitude: 22.138556, longitude: 114.255167),
            CLLocationCoordinate2D(latitude: 22.148472, longitude: 114.284000),
            CLLocationCoordinate2D(latitude: 22.148472, longitude: 114.502444),
            CLLocationCoordinate2D(latitude: 22.365139, longitude: 114.502444),
            CLLocationCoordinate2D(latitude: 22.468722, longitude: 114.454889),
            CLLocationCoordinate2D(latitude: 22.544972, longitude: 114.455139),
            CLLocationCoordinate2D(latitude: 22.562000, longitude: 114.433972),
            CLLocationCoordinate2D(latitude: 22.568333, longitude: 114.332972),
            CLLocationCoordinate2D(latitude: 22.566667, longitude: 114.309083),
            CLLocationCoordinate2D(latitude: 22.565500, longitude: 114.276028),
            CLLocationCoordinate2D(latitude: 22.555722, longitude: 114.248667),
            CLLocationCoordinate2D(latitude: 22.550722, longitude: 114.237056),
            CLLocationCoordinate2D(latitude: 22.543667, longitude: 114.233639)
        ]
        
        return isCoordinateInsidePolygon(point: location, polygon: polygon)
    }
    

    /**
     *    @brief    判断WGS-84坐标是否在澳门
     *
     *    @param     location     世界标准地理坐标（WGS-84）
     *
     *    澳门所处坐标范围
     *
     *    根据2015年12月20日中华人民共和国国务院令第665号
     *    https://www.gov.cn/gongbao/content/2016/content_2979708.htm
     *
     *    @return    是否在澳门
     */
    @objc
    static func isInMacao(_ location: CLLocationCoordinate2D) -> Bool {
        let polygon: [CLLocationCoordinate2D] = [
            // 陆地部分 - 关闸澳门边检大楼段
            CLLocationCoordinate2D(latitude: 22.215425, longitude: 113.550925),
            CLLocationCoordinate2D(latitude: 22.215522, longitude: 113.550778),
            CLLocationCoordinate2D(latitude: 22.215664, longitude: 113.550722),
            CLLocationCoordinate2D(latitude: 22.217036, longitude: 113.550847),
            CLLocationCoordinate2D(latitude: 22.216933, longitude: 113.550003),
            CLLocationCoordinate2D(latitude: 22.216733, longitude: 113.549653),
            CLLocationCoordinate2D(latitude: 22.216614, longitude: 113.549200),
            CLLocationCoordinate2D(latitude: 22.216617, longitude: 113.548753),
            CLLocationCoordinate2D(latitude: 22.216733, longitude: 113.548336),
            CLLocationCoordinate2D(latitude: 22.216658, longitude: 113.547716),
            CLLocationCoordinate2D(latitude: 22.216558, longitude: 113.547628),
            // 陆地部分 - 鸭涌河段
            CLLocationCoordinate2D(latitude: 22.216781, longitude: 113.547039),
            CLLocationCoordinate2D(latitude: 22.216783, longitude: 113.546567),
            CLLocationCoordinate2D(latitude: 22.216797, longitude: 113.546506),
            CLLocationCoordinate2D(latitude: 22.216811, longitude: 113.545478),
            CLLocationCoordinate2D(latitude: 22.216922, longitude: 113.545189),
            CLLocationCoordinate2D(latitude: 22.217031, longitude: 113.544356),
            CLLocationCoordinate2D(latitude: 22.216314, longitude: 113.543391),
            CLLocationCoordinate2D(latitude: 22.214433, longitude: 113.543019),
            CLLocationCoordinate2D(latitude: 22.214286, longitude: 113.542964),
            CLLocationCoordinate2D(latitude: 22.213694, longitude: 113.542569),
            CLLocationCoordinate2D(latitude: 22.213672, longitude: 113.542511),
            CLLocationCoordinate2D(latitude: 22.213233, longitude: 113.542295),
            CLLocationCoordinate2D(latitude: 22.213325, longitude: 113.542090),
            CLLocationCoordinate2D(latitude: 22.213086, longitude: 113.541998),
            CLLocationCoordinate2D(latitude: 22.213022, longitude: 113.541736),
            CLLocationCoordinate2D(latitude: 22.213036, longitude: 113.541456),
            CLLocationCoordinate2D(latitude: 22.213642, longitude: 113.539258),
            CLLocationCoordinate2D(latitude: 22.213636, longitude: 113.536333),
            CLLocationCoordinate2D(latitude: 22.213558, longitude: 113.535706),
            CLLocationCoordinate2D(latitude: 22.213475, longitude: 113.535439),
            CLLocationCoordinate2D(latitude: 22.213492, longitude: 113.535292),
            CLLocationCoordinate2D(latitude: 22.213525, longitude: 113.535167),
            CLLocationCoordinate2D(latitude: 22.212306, longitude: 113.533083),
            CLLocationCoordinate2D(latitude: 22.209644, longitude: 113.533969),
            CLLocationCoordinate2D(latitude: 22.207367, longitude: 113.534653),
            // 海上部分 - 内港段
            CLLocationCoordinate2D(latitude: 22.206694, longitude: 113.535389),
            CLLocationCoordinate2D(latitude: 22.202306, longitude: 113.535639),
            CLLocationCoordinate2D(latitude: 22.194500, longitude: 113.533611),
            CLLocationCoordinate2D(latitude: 22.188528, longitude: 113.529222),
            CLLocationCoordinate2D(latitude: 22.188139, longitude: 113.530194),
            CLLocationCoordinate2D(latitude: 22.186556, longitude: 113.529167),
            CLLocationCoordinate2D(latitude: 22.184500, longitude: 113.528361),
            CLLocationCoordinate2D(latitude: 22.182167, longitude: 113.528167),
            CLLocationCoordinate2D(latitude: 22.177000, longitude: 113.529417),
            CLLocationCoordinate2D(latitude: 22.175444, longitude: 113.530583),
            // 海上部分 - 路氹航道段
            CLLocationCoordinate2D(latitude: 22.173306, longitude: 113.531972),
            CLLocationCoordinate2D(latitude: 22.172139, longitude: 113.532139),
            CLLocationCoordinate2D(latitude: 22.157000, longitude: 113.539528),
            CLLocationCoordinate2D(latitude: 22.150778, longitude: 113.545250),
            CLLocationCoordinate2D(latitude: 22.145361, longitude: 113.549556),
            CLLocationCoordinate2D(latitude: 22.115583, longitude: 113.548306),
            CLLocationCoordinate2D(latitude: 22.108861, longitude: 113.549639),
            CLLocationCoordinate2D(latitude: 22.098833, longitude: 113.570972),
            // 海上部分 - 澳门南部海域段
            CLLocationCoordinate2D(latitude: 22.076667, longitude: 113.570972),
            CLLocationCoordinate2D(latitude: 22.076667, longitude: 113.610222),
            // 海上部分 - 澳门东部海域段
            CLLocationCoordinate2D(latitude: 22.115583, longitude: 113.630139),
            CLLocationCoordinate2D(latitude: 22.165639, longitude: 113.630139),
            CLLocationCoordinate2D(latitude: 22.204111, longitude: 113.604722),
            // 海上部分 - 人工岛段
            CLLocationCoordinate2D(latitude: 22.203958, longitude: 113.570944),
            // 海上部分 - 澳门北部海域段
            CLLocationCoordinate2D(latitude: 22.209083, longitude: 113.568972),
            CLLocationCoordinate2D(latitude: 22.212222, longitude: 113.562278),
            CLLocationCoordinate2D(latitude: 22.215999, longitude: 113.552028)
        ]
        
        return isCoordinateInsidePolygon(point: location, polygon: polygon)
    }
    
    
    /// 判断一个地理坐标点是否在多边形范围内
    /// - Parameters:
    ///   - point: 要检查的点（`CLLocationCoordinate2D`）。
    ///   - polygon: 多边形的顶点数组，按顺序排列（`[CLLocationCoordinate2D]`）。
    /// - Returns: 如果点在多边形内，返回 `true`，否则返回 `false`。
    private static func isCoordinateInsidePolygon(point: CLLocationCoordinate2D, polygon: [CLLocationCoordinate2D]) -> Bool {
        
        guard polygon.count >= 3 else {
            // 多边形至少需要 3 个点
            return false
        }

        var isInside = false
        let count = polygon.count
        var j = count - 1 // 上一个顶点索引
        
        for i in 0..<count {
            let vertex1 = polygon[i]
            let vertex2 = polygon[j]
            
            // 检查点是否在边的上下范围内，并判断是否在边的左侧
            if ((vertex1.latitude > point.latitude) != (vertex2.latitude > point.latitude)) &&
                (point.longitude < (vertex2.longitude - vertex1.longitude) *
                 (point.latitude - vertex1.latitude) / (vertex2.latitude - vertex1.latitude) + vertex1.longitude) {
                isInside.toggle()
            }
            j = i // 当前顶点变成下一个边的上一个顶点
        }
        
        return isInside
    }
}
