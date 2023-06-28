# Chapter 3. Fundamental Programming Structures in Java

## 3.1 A Simple Java Program
```java
public class FirstSample
{
    public static void main(String[] args)
    {
        System.out.println("We will not use 'Hello, World!'");
    }
}
```

- Java区分大小写
- 关键字
    - public称为`访问修饰符`（access modifier）
    - class表明Java程序中的全部内容都包含在类中，Java应用程序中的`全部内容`都必须放置在类中
- 源代码文件名必须与公共类名称相同，并使用.java作为拓展名
- 使用{}划分程序的各个部分（通常称为`块`）
- 每个Java应用都必须有一个main方法，其声明格式如下：
    ```java
    public class ClassName
    {
        public static void main(String[] args)
        {
            program statements
        }
    }
    ```
- 句子必须使用英文分号结束
- 点号（.）用于调用方法，Java使用的通用语法是
    ```java
    object.method(parameters)
    ```
- 使用双引号界定字符串
- Java中的方法可以没有参数，也可以有一个或多个`参数`（有的程序员把参数叫做实参）。即使一个方法没有参数，也需要使用空括号

## 3.2 Comments
注释的方式有：
- // ：其注释内容从//开始到本行结尾
- /* 和 */ ： 不可以嵌套使用，下同
- /** 和 */ ：可以自动生成文档

## 3.3 Data Types
Java是一种强类型语言，必须为每一个变量声明一种类型

8种基本类型(primitive type),其中有4种整型、2种浮点类型、1种字符类型char(用于表示Unicode编码的代码单元，请参见介绍char类型的3.3.3节)和1种用于表示真值的boolean类型

### 3.3.1 Integer Types
类型|存储需求|取值范围
---|---|---
byte|1字节|-128 ~ 127
short|2字节|-32768 ~ 32767
int|4字节|-2147483648 ~ 2147483647(刚刚超过20亿)
Long|8字节|-9223372036854775808 ~ 9223372036854775807

- 在Java中，整型的范围与运行Java代码的机器无关。由于Java程序必须保证在所有机器上都能够得到相同的运行结果，以各种数据类型的取值范围必须固定。
- 长整型数值有一个后缀L或1（如4000000000L)。十六进制数值有一个前缀x或X（如0xCAFE)。八进制有一个前缀0，例如，010对应十进制中的8。很显然，八进制表示法比较容易混淆，所以建议最好不要使用八进制常数
- 从Java7开始，加上前缀b或B就可以写二进制数。例如，b1001就是9
- 从Java7开始，还可以为数字字面量加下划线，如用1_000_000（或0b1111_0100_0010_0100_0000)表示100万。这些下划线只是为了让人更易读。Java编译器会去除这些下划线。
- 注意，Java没有任何无符号(unsigned)形式的int、long、short或byte类型。已byte为例，需要调用Byte.toUnsignedInt(b)来得到一个0到255的int值

### 3.3.2 Floating-Point Types
类型|存储需求|取值范围
---|---|---
float|4字节|大约±3.40282347E+38F(有效位数为6~7位)
double|8字节|大约±1.79769313486231570E+308(有效位数为15位)

- double表示这种类型的数值精度是float类型的两倍（有人称之为双精度数值）
- f1oat类型的精度（6~7位有效数字)并不能满足需求。只有很少的情况适合使用float类型，例如，需要单精度数的库，或者需要存储大量数据时
- 科学计数法：例如，1.23x10^4在Java中可以写成1.23E4。在代码中，我们可以如下使用科学计数法：
    ```java
    // 科学计数法中的“E”或“e”后面必须跟着一个整数指数，否则会编译错误
    double d = 1.23e4; // 科学计数法表示1.23x10^4
    float f = 1.23E-4f; // 科学计数法表示1.23x10^-4
    ```
- 可以使用十六进制表示浮，点数值。例如，0.125=2<sup>-3</sup>可以表示成0x1.0p-3。例如，十进制数3.14可以使用以下16进制表示法来表示：
    ```java
    float x = 0x1.91eb86p1f; // 十六进制表示3.14，p1f表示指数为1，类型是float
    double y = 0x1.91eb851eb851fp0; // 十六进制表示3.14，p0表示指数为0，类型是double
    ```
- 所有的浮点数值计算都遵循IEEE754规范
- 用于表示溢出和出错情况的三个特殊的浮点数值：
    - 正无穷大：Double.POSITIVE_INFINITY  
    - 负无穷大：Double.NEGATIVE_INFINITY
    - NaN(不是一个数字)：Double.NaN
- 不能如下检测一个特定值是否等于Double,NaN:
    ```java
    if (x==Double.NaN)// is never true
    ```
    ```java
    // 可以使用以下检测
    if (Double.isNaN(x))// check whether x is "not a number"
    ```
- 浮点数值采用二进制系统表示，而在二进制系统中无法精确地表示小数，在无法接受舍入误差时请勿使用

### 3.3.3 The char Type
- char类型原本用于表示单个字符。如今，有些Unicode字符可以用一个char值描述，另外一些Unicode字符则需要两个char值
- char类型的字面量值要用单引号括起来。例如：'A'是编码值为65的字符常量
- char类型的值可以表示为十六进制值，其范围从\u0000到\uFFFF
- 转义序列\u还可以出现在加引号的字符常量或字符串之外（而其他所有转义序列不可以）
    ```java
    public static void main(String\u005B\u005D args)
    // \u005B is [
    // \u005D is ]
    ```
- 除了转义序列\u之外，还有一些用于表示特殊字符的转义序列：

    转义序列|名称|Unicode值
    ---|---|---
    \b|退格|\u0008
    \t|制表|\u0009
    \n|换行|\u000a
    \r|回车|\u000d
    \f|换页|\u000c
    \\"|双引号|\u0022
    \\'|单引号|\u0027
    _\\\\_|反斜杠|\u005c
    \s|空格。可以保留文本行末的空格|\u0020
    
- Unicode转义序列会在解析代码之前得到处理
    - 定要当心注释中的u。注释
        ```java
        // \u000A is a newline
        // \u000A会被替换成一个换行符，导致注释失效

        // look inside c:\users
        // \u后面没有跟随4个十六进制数
        ```

### 3.3.4 Unicode and the char Type
在Unicode之前的各种编码（美国的ASCII、西欧语言中的ISO 8859-1、俄罗斯的KOI-8、中国的GB 18030和BIG-5等）有两个主要问题：
1. 对于任意给定的代码值，在不同的编码方案下有可能对应不同的字母
2. 采用大字符集的语言其编码长度有可能不同。例如，有些常用的字符采用单字节编码，而另一些字符则需要两个或多个字节

在1991年发布了Unicode1.0，使用两个字节进行编码，当时仅占用65536个代码值中不到一半的部分。在设计Java时决定采用16位的Unicode字符集。

十分遗憾的是，经过一段时间后，不可避免的事情发生了。Unicode字符超过了65536个，其主要原因是增加了大量的汉语、日语和韩语中的表意文字。现在，16位的char类型已经不能满足描述所有Unicode字符的需要了。

Java5开始解决这个问题：
- 码点(code point)是指与一个编码表中的某个字符对应的代码值。在Unicode标准中，码点采用十六进制书写，并加上前缀U+，例如U+0041就是拉丁字母A的码点。
- Unicode的码点可以分成17个代码平面(code plane)。第一个代码平面称为基本多语言平面（basic multilingual plane)，包括码点从U+0000到U+FFFF的“经典”Unicode代码；其余的16个平面的码点为从U+10000到U+10FFFF，表示辅助字符(supplementary character)。
- UTF-16编码采用不同长度的编码表示所有Unicode码点。在基本多语言平面中，每个字符用16位表示，通常称为代码单元(code unit)；而辅助字符编码为一对连续的代码单元。辅助字符编码使用`基本多语言平面中未用的2048个值`，通常称为替代区域（surrogate area）**(U+D800~U+DBFF用于第一个代码单元，U+DC00~U+DFFF用于第二个代码单元)**。这样设计十分巧妙，我们可以从中迅速知道一个代码单元是一个字符的编码，还是一个辅助字符的第一或第二部分。例如，O是八元数集（http:/math.ucr.edu/home/baez/octonions）的一个数学符号，码点为U+1D546,编码为两个代码单元U+D835和U+DD46。
- 在Java中，char类型描述了UTF-16编码中的一个代码单元
- 我们强烈建议不要在程序中使用char类型，除非确实需要处理UTF-16代码单元。最好将字符串作为抽象数据类型处理

### 3.3.5 The boolean Type
- true
- false

整型值和布尔值之间不能进行相互转换

## 3.4 Variables and Constants
### 3.4.1 Declaring Variables
在Java中，每个变量都有一个类型（type)。在声明变量时，先指定变量的类型，然后是变量名。
```java
double salary;
int vacationDays;
long earthPopulation;
boolean done;
```
变量名中所有的字符都是有意义的，并且大小写敏感。变量名的长度基本上没有限制。

提示：尽管$是一个合法的Java字符，但不要在你自己的代码中使用这个字符。它只用在Java编译器或其他工具生成的名字中。

### 3.4.2 Initializing Variables
声明一个变量之后，必须用赋值语句对变量进行显式初始化，千万不要使用未初始化的变量的值。例如，Java编译器认为下面的语句序列是错误的：
```java
int vacationDays;
System.out.println(vacationDays);// ERROR -- variable not initialized
```

```java
int vacationDays;
vacationDays = 12; // true
// OR
int vacationDays = 12; // true
```

从Java10开始，对于局部变量，如果可以从变量的初始值推断出它的类型，就不再需要声明类型。只需要使用关键字vr而无须指定类型：
```java
var vacationDays 12;// vacationDays is an int
var greeting = "Hello";// greeting is a String
```

### 3.4.3 Constants
在Java中，利用关键字final指示常量。关键字final表示这个变量只能被赋值一次。一旦被赋值之后，就不能够再更改了。习惯上，常量名使用全大写。
```java
final double CM_PER_INCH = 2.54;

CM_PER_INCH = 2.5; // ERROR
```

在Java中，经常希望某个常量可以在一个类的多个方法中使用，通常将这些常量称为类常量(class constant)。可以使用关键字static final设置一个类常量。下面是使用类常量的示例：
```java
public static final double CM_PER_INCH = 2.54;
```

### 3.4.4 Enumerated Types
变量的取值只在一个有限的集合内时，可以自定义`枚举类型`
```java
enum Size { SMALL, MEDIUM, LARGE, EXTRA, LARGE }

Size s = Size.MEDIUM;
```
Size类型的变量只能存储这个类型声明中给定的某个枚举值，或者特殊值null，null表示这个变量没有设置任何值。

## 3.5 Operators
### 3.5.1 Arithmetic Operators
- + 加
- - 减
- * 乘
- / 除。整数被0除将会产生一个异常，而浮点数被0除将会得到无穷大或NaN结果
- % 取余

对于浮点数的算术运算，实现可移植性是相当困难的。double类型使用64位存储一个数值，而有些处理器则使用80位浮，点寄存器。这些寄存器增加了中间过程的计算精度。例如，以下运算：
```java
double w = x * y / z;
```
很多Intel处理器计算x*y,并且将结果存储在80位的寄存器中，再除以z并将结果截断为64位。这样可以得到一个更加精确的计算结果，并且还能够避免产生指数溢出。但是，这个结果可能与始终使用64位计算的结果不一样。

Java程序设计语言承认了最优性能与理想的可再生性之间存在的冲突，并给予了改进。在默认情况下，现在虚拟机设计者允许对中间计算结果采用扩展的精度。但是，对于使用**strictfp**关键字标记的方法必须使用严格的浮点计算来生成可再生的结果。例如，可以把main方法标记为
```java
public static strictfp void main(String[] args)
```
那么，main方法中的所有指令都将使用严格的浮点计算。如果将一个类标记为strictfp，这个类中的所有方法都要使用严格的浮，点计算。

### 3.5.2 Mathematical Functions and Constants
平方根
```java
double x = 4;
double y = Math.sqrt(x);
System.out.println(y); // prints 2.0
```

幂运算
```java
double y = Math.pow(x, a);
```

三角函数
幂运算
```java
Math.sin
Math.cos
Math.tan
Math.atan
Math.atan2
```

指数
```java
Math.exp
Math.log
Math.log10
```

近似值
```java
Math.PI
Math.E
```

如果要求在各平台上计算结果的一直，请使用**StrictMath**类。它实现了“可自由分发的数学库(Freely Distributable Math Library,FDLIBM)”的算法(ww.netlib.org/fdlibm)，确保在所有平台上得到相同的结果。

### 3.5.3 Conversions between Numeric Types
![数值类型之间的合法转换](images/%E6%95%B0%E7%B1%BB%E5%9E%8B%E7%9A%84%E8%BD%AC%E6%8D%A2.png)

当用一个二元运算符连接两个值时（例如n+f,n是整数，f是浮点数），先要将两个操作数转换为同一种类型，然后再进行计算。
- 如果两个操作数中有一个是double类型，另一个操作数就会转换为double类型。
- 否则，如果其中一个操作数是float类型，另一个操作数将会转换为float类型。
- 否则，如果其中一个操作数是long类型，另一个操作数将会转换为long类型。
- 否则，两个操作数都将被转换为int类型。

### 3.5.4 Casts（强制类型转换）
```java
double x = 9.997;
int nx = (int) x; // 9
```

如果试图将一个数值从一种类型强制转换为另一种类型，而又超出了目标类型的表示范围，结果就会截断成一个完全不同的值。例如，(byte)300的实际值为44。

如果想对浮点数进行舍入运算，以便得到最接近的整数，那就需要使用Math.round方法：
```java
double x = 9.997;
int nx = (int) Math.round(x); // 10
```

### 3.5.5 Assignment
```java
X += 4;
// 等价于
X = X + 4;
```
如果运算符得到一个值，其类型与左侧操作数的类型不同，就会发生强制类型转换。例如，如果x是一个int，
```java
X += 3.5;
// 等价于
X = (int)(x + 3.5);
```

### 3.5.6 Increment and Decrement Operators
```java
int m = 7;
int n = 7;
int a =2 * ++m; // now a is 16,m is 8
int b=2 * n++; // now b is 14,n is 8
```

### 3.5.7 Relational and boolean Operators
```java
3 == 7 // false
3 != 7 // true
```
还有<（小于）、>（大于）、<=（小于等于）和>=（大于等于）运算符，使用&&表示逻辑“与”运算符，使用||表示逻辑“或”运算符
```java
// expression1 && expression2
x != 0 && 1 / x > x + y // no division by 0

// && 和 || 是短路运算符，当前面的表达式可以得出最终的bool时，后面的命令不会执行
```

### 3.5.8 The Conditional Operator（三元运算符）
```java
// condition ? expression1 : expression2
x < y ? x : y // gives the smaller of x and y
```

### 3.5.9 Switch Expressions
Java14
```java
String seasonName = switch (seasonCode)
    {
        case 0 -> "Spring";
        case 1 -> "Summer";
        case 2 -> "Fall";
        case 3 -> "Winter";
        default -> "???";
    };

int numLetters = switch (seasonName)
    {
        case "Spring", "Summer", "Winter" -> 6;
        case "Fall" -> 4;
        default -> -1;
    };

// switch value. For example:
enum Size { SMALL, MEDIUM, LARGE, EXTRA_LARGE };
Size itemSize = ...; // Size中的值
String label = switch (itemSize)
    {
        case SMALL -> "S"; // no need to use Size.SMALL
        case MEDIUM -> "M";
        case LARGE -> "L";
        case EXTRA_LARGE -> "XL";
    };
```

### 3.5.10 Bitwise Operators
- & (“and”)
- | (“or”)
- ^ (“xor”)
- ~ (“not”)
```java
int fourthBitFromRight = (n & 0b1000) / 0b1000;
```

- >> 按位左移（符号位补充高位）
- << 按位右移（符号位补充高位）
- >>> 按位左移（0补充高位）
```java
int fourthBitFromRight = (n & (1 << 3)) >> 3;
```

### 3.5.11 Parentheses and Operator Hierarchy
运算符|结合性
---|---
[] . ()(方法调用)|从左向右
! ~ ++ -- +（一元运算） -（一元运算） ()（强制类型转换）new|从右向左
_* / %_|从左向右
_+ -_|从左向右
<< >> >>>|从左向右
< <= > >= instanceof|从左向右
== !=|从左向右
&|从左向右
^|从左向右
\||从左向右
&&|从左向右
\|\||从左向右
?:|从右向左
= += -= *= /= %= &= \|= ^= <<= >>= >>>=|从右向左

## 3.6 Strings 


