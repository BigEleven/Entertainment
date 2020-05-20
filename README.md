# Entertainment

#### 介绍
开发工具
Entertainment 是一个基于Swift的开发工具, 适用于新手从0-1开发或是一些懒汉的工具箱, 
作者的初心就是为了在实际开发时减少代码行数, 写的不好的地方欢迎喷
作者会持续更新该工程以便大家参考


#### 软件架构
1, 安装cocoapods
2, 使用之前读一下 CodeGuide.md文件 (算是说明书吧)


#### 安装教程

1.  xxxx
2.  xxxx
3.  xxxx

#### 使用说明

##### 重要语法说明

1, UIView子类的初始化, Swift弃用了所有的NS, 作者在这里弃用了所有的UI
并在属性配置上做到了链式, 其实原理很简单, 就是每次配置属性之后将self返回
```
private lazy var button: Button = {
    let button = Button()
    return button.text("button").textFont(.text).textColor(.random)
}()
```
2,  富文本 这里的 + 是自定义运算符, 跟String的 + 同理
newline是换行符, 我不希望在字符串中带有"\n"的字符出现, 纯属为了好看
在使用到富文本的时候作者尽可能的减少了配置代码
```
let att =
    "红色".attributed(color: .red, font: .title).newline
    +
    "黄色".attributed(color: .yellow, font: .title).newline
    +
    "蓝色".attributed(color: .blue, font: .title).newline
``` 
3, NotificationManager 自动管理观察者的生命周期, 每次在使用通知的时候还要写remove方法很麻烦, 有时候会忘记, 这做一个自动管理
并且把通知name做了统一管理, 不允name后面的参数为具体的字符串, 必须在NotificationName中配置"
```
NotificationManager(self, selector: #selector(setup), name: .demoName)
```

4, TableView, CollectionView的初始化
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
#### 参与贡献


#### GitHub Feature
