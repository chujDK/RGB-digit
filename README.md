## 红绿灯系统

### 快速上手指南

只对源代码进行版本控制。每次拉取新的源码后可能需要手动将文件添加到工程中。

#### 第一次使用

在 vivado 中新建工程 RGB，完成基本配置。

使用 GitHub desktop 可以避免学习 git 操作的痛苦，[在此下载](https://desktop.github.com/)

打开 GitHub desktop 通过快捷键 `crtl + shift + o` clone 仓库 `RGB-digit`。clone 后手动将 src 文件夹中的源码添加到工程中

#### commit

完成修改后，在 GitHub desktop 中的左下角填写 commit 信息后点击 commit to master，然后 push 到远端仓库即可。

如果完成了新的模块，记得在模块 API 中修改对应的完成情况。比如，完成 m74LS191 后，修改标题为

#### module m74LS191 | DONE

或

#### module m74LS191 | DONE | to be test

### 模块 API

#### module RGB

```
@input Duration[3:0] 每一种颜色的持续时间
@input Color[1:0]    当前设置的是哪种颜色 00: red; 01: green; 11: yellow; 10: unused;
@input SET           0->1: 进行设置
@input EN            整个系统的工作与否 1: 工作 0: 不工作
```

#### module m74LS191

```
@input LD_
@input CT_
@input UD
@input CP
@input D[3:0]
@output Q[3:0]
```

 ![image-20211222192112626](figure/image-20211222192112626.png)

#### module clock

```
@input EN	使能
@output CP	一秒一次的脉冲
```

#### module inBottom

执行按键的消抖

```
@input IN
@output OUT
```

#### module top

```
@input Duration[3:0] 每一种颜色的持续时间
@input Color[1:0]    当前设置的是哪种颜色 00: red; 01: green; 11: yellow; 10: unused;
@input SET           0->1: 进行设置
@input EN            整个系统的工作与否 1: 工作 0: 不工作
```

通过消抖模块向 `RGB` 模块传参。

#### module lightCTL

```
@input RedDuration[3:0]
@input GreenDuration[3:0]
@input YellowDuration[3:0]
@input EN				使能
@input CP
@output Red
@output Green
@output Yellow
@output CountDown[3:0]
```

通过调用 `m74LS191` 来对灯进行控制

#### module numberDisplay

控制数码管

```
@input EN
@input Number[3:0]
@output AN[7:0]		位选
@output DP[7:0]		段选
```

从左至右输出，即 TB1 为高位，TB0 为低位。

#### module freshClock

```
@input EN	使能
@output CP	/* 未定周期的 */脉冲
```
