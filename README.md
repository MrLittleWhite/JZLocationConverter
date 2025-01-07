JZLocationConverter
===================
### <del>[Swift版本](https://github.com/JackZhouCn/JZLocationConverter-Swift)(使用边境线坐标，判断是否中国大陆)</del> ⚠️`Swift版本暂未修改`
### Quick start

JZLocationConverter 支持 [CocoaPods](http://cocoapods.org).  添加下面配置到你的 Podfile:

```ruby
pod 'JZLocationConverter' -> git => 'https://github.com/MrLittleWhite/JZLocationConverter.git'
```


WGS-84世界标准坐标、GCJ-02中国国测局(火星坐标)、BD-09百度坐标系转换
目前有:
## WGS-84  -> GCJ-02 
### <del>此接口当输入坐标为中国大陆以外时，仍旧返回WGS-84坐标</del> ⚠️`是否处在中国大陆，使用外部判断(使用边境线坐标不准确,例如台湾)`
    + (CLLocationCoordinate2D)wgs84ToGcj02:(CLLocationCoordinate2D)location;
## GCJ-02  -> WGS-84
### 此接口有1-2米左右的误差，需要精确的场景慎用
    + (CLLocationCoordinate2D)gcj02ToWgs84:(CLLocationCoordinate2D)location;
## WGS-84  -> BD-09
    + (CLLocationCoordinate2D)wgs84ToBd09:(CLLocationCoordinate2D)location;
## BD-09     -> WGS-84
    + (CLLocationCoordinate2D)bd09ToWgs84:(CLLocationCoordinate2D)location;
## GCJ-02   -> BD-09
    + (CLLocationCoordinate2D)gcj02ToBd09:(CLLocationCoordinate2D)location;
## BD-09     -> GCJ-02
### 此接口有1-2米左右的误差，需要精确的场景慎用
    + (CLLocationCoordinate2D)bd09ToGcj02:(CLLocationCoordinate2D)location;
