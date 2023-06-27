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