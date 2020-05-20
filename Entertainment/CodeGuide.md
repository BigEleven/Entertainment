```
                                        _ooOoo_
                                       o8888888o
                                       88" . "88
                                       (| -_- |)
                                        O\ = /O
                                    ____/'---'\____
                                  .'    \\| |//    '.
                                   / \\||| : |||// \
                                 / _||||| -:- |||||- \
                                   | | \\\ - /// | |
                                 | \_| ''\---/'' |_/ |
                                  \ .-\__ '-' ___/-. /
                               ___'. .' /--.--\ '. .' ___
                            ."" '< '.___\_<|>_/___.' >' "".
                            | | : '- \'..'\ _ /'..'/ - ' : | |
                             \ \ '-. \_ __\ /__ _/ .-' / /
                     ======'-.____'-.___\_____/___.-'____.-'======
                                        '=---='

                     .............................................
                              佛祖保佑             永无BUG
```
github 地址: 
# 代码规范

编辑: Eleven
> - 开发语言 swift
> - 工程中尽量不使用 object-c 的架包, 三方框架
> - 如果是必要的, 在 RealtyNavi-Swift-Bridging-Header.h 桥接文件中添加, 并附上注释和添加人, 方便维护

***

## 命名

- **小驼峰命名**: lowerCamelCase (属性, 对象, 全局变量命名)
- **大驼峰命名**: UpperCamelCase (常量, 文件夹, 类文件命名)
    
### 1. 参数命名 (小驼峰命名)

Preferred:

```
    var titleLabel : String?
    var submitButton : UIButton?
    let nameStr = "name"
```

**语法糖**

Preferred:

```
    var deviceModels: [String]
    var employees: [Int:String]
```

No Preferred:

```
    var deviceModels: Array<String>
    var employees: Dictionary<Int, String>
```


### 2.类/父文件命名 (大驼峰命名)

Preferred:

``` 
    HomeViewController,
    FootView,
    ShopCarModel
```

### 3, 函数命名, 方法命名
对于函数和初始化方法，建议给所有参数命名，除非上下文非常清晰，如果结合外部参数命名可以让函数调用更易读，要结合起来

```        
    func dateFromString(_ dateString: String) -> NSDate
    func convertPointAt(column column:Int, row:Int) > CGPoint
    func timedAction(afterDelay delay: NSTime Interval,performaction: SKAction) ->SKAction!
```

调用上述函数时如下：

```
    dateFromString("2014-03-14")
    convertPointAt(column: 42, row: 13)
    timedAction(afterDelay: 1.0, perform: someOtherAction)
```
## 目录结构

```
     |-- Config/     (项目中的各种全局的配置文件, UI规范颜色, 系统参数等)
     |-- SDK.swift            (SDK - appkey, appid)
             |-- Systems/            (系统的日志打印, 版本号, 文件夹)
             |-- Sprcification/      (UI 规范, 文件夹)
     |-- Helpers/    (系统类的功能扩展)
     |-- Features/   (项目的各个功能模块（页面主体）)
     |       |
     |       |-- 各功能模块目录/
     |              |-- controller/      (主视图控制器, 文件夹)
     |              |-- model/           (模型, 文件夹)
     |              |-- subviews/        (自定义 View/Cell, 文件夹)
     |       |-- Exhibitions(展示类页面)/
     |-- Services/   (服务, 网络请求的加密解密, 内置加密解密算法)
     |-- Resources/  (资源文件, 图片视频等)
     |-- Components/ (通用组件)
```              
        
## 代码组织结构性

协议一致性: 当一个对象要实现协议一致性时，推荐使用 **extension** 隔离协议中的方法集，这样让相关方法和协议集中显示在一起，也简化了类支持一个协议和实现相关方法的流程。

Preferred:

```
    class MyViewcontroller: UIViewController {
    
    }
          
    extension MyViewcontroller: UITableViewDataSource {
        // UITableViewDataSource 方法
    }
                
    extension MyViewcontroller: UIScrollViewDelegate {
        // UIScrollViewDelegate 方法
    }
```

No Preferred:

```
    class MyViewcontroller: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
       // 所有的方法
    }
```

## 注释以及无用代码

1, 注释, 使用 xcode 提供的 "command" + "option" + "/" 对自定义函数以及变量添加注释, 示例

```
    /// 设置图形数据
    ///
    /// - Parameters:
    ///   - xArray: 横轴数据数组
    ///   - dataArray: 图形数据数组
    ///   - animation: 制图动画
    func setup(xArray: [String], dataArray: [String], animation: Bool = true) {

    }
```
2, 无用代码, 类, 资源, 一律删除, 每次迭代需要删除废弃的各种资源, 避免压缩包越来越大

## 代码演示

`1, UIView下控件属性配置`
```
// 链式属性配置, 启用原生不带返回值的点语法
private lazy var button: Button = {
    let button = Button()
    return button.text("button").textFont(.text).textColor(.random)
}()

Button, Label等颜色, 字号, 间距需要赋值的, 必须使用Sprcification中的规范, 禁止具体的数值出现在属性赋值中

// 富文本 这里的 + 是自定义运算符, 跟String的 + 同理
// newline是换行符, 我不希望在字符串中带有"\n"的字符出现, 纯属为了好看
let att =
    "红色".attributed(color: .red, font: .title).newline
    +
    "黄色".attributed(color: .yellow, font: .title).newline
    +
    "蓝色".attributed(color: .blue, font: .title).newline
button.attributedText(att)
```

`2, 通知Notofication`
```
// NotificationManager 自动管理观察者的生命周期, 每次在使用通知的时候还要写remove方法很麻烦, 有时候会忘记, 这做一个自动管理
// 并且把通知name做了统一管理, 不允name后面的参数为具体的字符串, 必须在NotificationName中配置"
NotificationManager(self, selector: #selector(setup), name: .demoName)
```

`3, 面向协议`
```
// 声明
extension ClientTool where Self: BaseViewController {}
// 配置
extension BaseViewController: ClientTool {}
// 调用
BaseViewController.request(path: <#T##ClientPath#>) { (<#JSON#>, <#Error?#>) in
    <#code#>
}
Swift与Oc最大的不同, 简单, 实用, 方便, 代码简洁, 尽可能的使用面向协议
```

`4, 延迟操作闭包`
```
delay(time: 1) {
    
}
```

`5, 基类继承`
```
所有的视图控制器继承BaseViewController, 我们在基类中给视图控制器添加协议, 或者添加一个公用的方法
所有的涉及H5页面的全部继承组件库中的WebViewController, 这里已经创建好了WebView的基础控件
启用原生的UIViews控件, 工程中重写了Views等控件
let label = Label()
let button = Button()
let imageView = ImageView()
let textField = TextField()
```

`5, 列表控件初始化`
```
// 所有的列表都赋予了Reusable协议, 方便初始化时注册cell
/// CollectionView
private lazy var collectionView: CollectionView = {
    let flowLayout = CollectionViewFlowLayout(scrollDirection: .vertical,
                                              estimatedItemSize: CGSize(width: UIScreen.width,
                                                                        height: 45))
    
    let view = CollectionView(register: CollectionViewCell.self,
                              target: self,
                              collectionViewLayout: flowLayout)
    return view
}()

/// TableView
private lazy var tableView: TableView = {
    let table = TableView(register: TableViewCell.self, target: self, .plain)
    return table
}()
```
