# Chapter 2. The Java Programming Environment

## 2.1 Installing the Java Development Kit
### 2.1.1 Downloading the JDK
术语名|缩写|解释
---|---|---
Java Development Kit(Java开发工具包)|JDK|编写Java程序的程序员使用的软件
Java Runtime Environment（Java运行时环境)|JRE|运行Java程序的用户使用的软件
Standard Edition(标准版)|SE|用于桌面或简单服务器应用的Java平台
Micro Edition(微型版)|ME|用于小型设备的Java平台
OpenJDK|--|Java SE的一个免费开源实现
OpenJ9|--|BM开发了一个针对Java虚拟机的“即时（just in time）”编译器，名为“J9”
Long Term Support|LTS|长期支持版本，相对于每6个月发布一次、中间版本不稳定的版本，LTS版本提供更长时间的支持和维护，通常会持续多年

具体安装步骤，略。linux可以参照[Readme](../Readme.md#编译器安装与选择)中的内容操作。

### 2.1.2 Setting up the JDK
具体设置步骤，略。

主要是设置环境变量是你的cmd可以找到javac、java的位置。

### 2.1.3 Installing Source Files and Documentation

1. 确保JDK已安装，并可以是使用`java --version`执行
2. 在JDK主目录创建一个目录javasrc
3. 在jdk/lib中找到文件src.zip
4. 将src.zip文件解压缩到javasrc目录

src.zip文件中包含了所有公共类库的源代码。要想获得更多的源代码（例如编译器、虚拟机、原生方法以及私有辅助类)，请访问网站[openjdk](http://openjdk.java.net)


## 2.2 Using the Command-Line Tools
从命令行编译并运行Java程序：
1. 打开一个终端窗口
2. 进入 [corejava/vlch02/Welcome](corejava/v1ch02/Welcome/) 目录（corejava是安装本书示例源代码的目录）
3. 键入下面的命令：
```shell
javac Welcome.java
java Welcome
```

- 编译器需要一个文件名(Welcome.java),而运行程序时，只需要指定类名(Welcome),不要带扩展名.java或.class
- 在DKI1中，单个源文件不再需要javac命令。这个特性是为了支持以“shebang”(#!)行(#！/path/to/java)开头的shell脚本

1. 打开一个终端窗口
2. 切换到目录 [corejava/vlch02/ImageViewer](corejava/v1ch02/ImageViewer/)
3. 输人以下命令：
```shell
javac ImageViewer.java
java ImageViewer
```

## 2.3 Using an Integrated Development Environment
- IntelliJ IDEA
- Eclipse
- NetBeans

操作略，使用是最好的熟悉方式。

## 2.4 JShell
Java9引入了另一种使用Java的方法。JShell程序提供了一个“读取-计算-打印循环”(Read-Evaluate-Print Loop,REPL)。键入一个Java表达式；JShell会评估你的输人，打印结果，等待你的下一个输入。

```shell
jshell
```

```shell
"Core Java".length()

$1 ==> 9

5 * $1 - 3

$2 ==> 42
```