# TabBarController + NavigationController正確用法

### 說明
TabBar切換頁面是以平移的方式，你可以想像test1 test2 test3 test4四個頁面是平行的如下圖

![](https://i.imgur.com/LewpSgu.gif)

而Navigation的Push是將目前頁面往下推，新的頁面疊上去，如下圖

![](https://i.imgur.com/mW6NEQf.gif)

### 接下來會跟各位分享TabBarController正確使用、錯誤使用

- 錯誤的做法

> 錯誤的寫法可能導致產生以下狀況：

**1. 雙層NavigationBar**

![](https://i.imgur.com/KR4YIOH.png)

出現這種雙層NavigationBar的詭異畫面，是因為你在創建TabbarController時上面疊了NavigationController，如下圖

![](https://i.imgur.com/dVfjFVR.png)

然後在TabBar創建分頁時，又將每個頁面上面疊了NavigationController

![](https://i.imgur.com/uCmwf27.png)


**2. 當跳轉至下一頁時，TabBar被擋住**

![](https://i.imgur.com/FUZNAFf.gif)

如果在TabBarController頁面上撰寫跳至下一頁的程式碼
如：
```
[self.navigationController pushViewController:view animated:YES];
```
這樣的寫法相當於以下畫面：

![](https://i.imgur.com/y6UjVjw.gif)

---

> 當然也有方法可以克服這些困難

**1. 解決雙層NavigationBar**

在TabBarController.m寫以下程式碼

![](https://i.imgur.com/C6McUIL.png)

在進入該TabBarController前，隱藏NavigationBar
在離開TabBarController前，顯示NavigationBar

**Demo:**
未加上面程式碼之前：

![](https://i.imgur.com/zWnLfym.gif)

修改程式碼後：

![](https://i.imgur.com/6TnQDzn.gif)

不過這裡還存在一個問題，那就是
第二頁的NavigationBar實際上是TabBarController的，而非ViewController，也就是我們接下來要處理的第二個問題。

**2. 修改NavigationBar正常顯示且TabBar不被覆蓋**
為何TabBar會被覆蓋呢？
原因是這裡的NavigationBar實際上是TabBarController的而非ViewController的！



因為我們在TabBarController創建時上面疊了NavigationController，
並且又在TabBarController上撰寫rightBarButtonItem的點擊事件
![](https://i.imgur.com/hU5p8bj.png)
所以這裡的跳轉是，TabBarController上面的NavigationController，
而不是ViewController01上面的NavigationController
![](https://i.imgur.com/y6UjVjw.gif)

**當然也有解法：**
那就是直接在ViewController1寫上rightBarButton的點擊事件，就能解決ToolBar被覆蓋的問題。

**看成果：**

![](https://i.imgur.com/3uHj9kH.gif)

將點擊事件寫在ViewController1.m上

![](https://i.imgur.com/n38hoz6.png)
此時的NavigationController的push跳轉方法是用ViewController1的NavigationController。

---

- 正確做法
設定每個頁面的title、backgroundColor、甚至是navigationBarButton
都應該要在那一頁上撰寫程式碼，而非在TabbarController頁面上完成

不要在TabBar上面加上NavigationController
並且我在每個頁面該做的事情上，都撰寫在該頁面上，什麼意思？看下圖就知道

休蛋幾咧～
**我們先來看看成果：**
![](https://i.imgur.com/aNhraOw.gif)
可以看到能正常顯示，且跳至下一頁，TabBar也不會被覆蓋

**好了，可以來看程式碼了：**
***SceneDelegate.m***

![](https://i.imgur.com/Q6cXphw.png)

切記不要寫成

![](https://i.imgur.com/MFm4Pmc.png)


***TabBarViewController.m***

![](https://i.imgur.com/FkOSqXu.png)

![](https://i.imgur.com/uQrglvK.png)

以下四個頁面都大同小異
***RedViewController.m***
> 我應該要再ViewController上執行的程式碼有:
> 1. 設定NavigationBar的title
> 2. backgroundColor
> 3. rightBarButton

![](https://i.imgur.com/iAClE63.png)

***GreenViewController.m***

![](https://i.imgur.com/AKx3Xlp.png)

***YellowViewController.m***

![](https://i.imgur.com/JuhOuj6.png)

***BlueViewController.m***

![](https://i.imgur.com/wcE1DUm.png)

---
### 小小的坑
如果你眼睛夠好的話，你也許會注意到我在設置NavigationBar上的title時，
不是用
```
self.title
```
而是用
```
self.navigationItem.title
```

為什麼不能用self.title去做修改呢？
來，停頓30秒，你自己改改看就知道了。



你會發現當你使用"self.title"時，會連同下面tabBarItem的title一起更改

看下面這張圖就明瞭了

![](https://i.imgur.com/DXUPPDJ.png)

原來如此⋯⋯
tabBarItem與NavigationItem之間，毫無關聯。
但是他們倆著都包在self.title底下，
也就是說，當你改變self.title時會連同裡面兩個一起改變，
但只改變裡面其中一項，例如改變self.tabbarItem.title，
是不會影響到self.navigationItem.title及self.title的。


---

### 那如果我要跳轉之後隱藏TabBar該怎麼寫

在觸發跳轉的方法裡 使用"hidesBottomBarWhenPushed"

![](https://i.imgur.com/a8Ch87D.png)

完整程式碼：

![](https://i.imgur.com/IRreEJ2.png)

如果是寫在跳轉後的這頁裡，是不會有任何反應的，可以自己試試看。

![](https://i.imgur.com/F29N7BG.png)

https://jiunyijan.medium.com/tabbarcontroller-navigationcontroller%E6%AD%A3%E7%A2%BA%E7%94%A8%E6%B3%95-e7c6c2702cfb
###### tags: `Objective-C`
