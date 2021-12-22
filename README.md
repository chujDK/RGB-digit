## 红绿灯系统

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

#### 
