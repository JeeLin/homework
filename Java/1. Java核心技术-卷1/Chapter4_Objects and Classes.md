# Chapter 4. Objects and Classes

## 4.1 Introduction to Object-Oriented Programming
面向对象程序设计（object-oriented programming,OOP）是当今主流的程序设计范型，它取代了20世纪70年代的“结构化”或过程式编程技术。

面向对象的程序是由对象组成的，每个对象包含对用户公开的特定功能部分和隐藏的实现部分。

### 4.1.1 Classes
类（class）是构造对象的模板或蓝图。由类构造（construct）对象的过程称为创建类的实例（instance）。

封装（encapsulation,有时称为数据隐藏）是处理对象的一个重要概念。从形式上看，封装就是将数据和行为组合在一个包中，并对对象的使用者隐藏具体的实现方式。对象中的数据称为实例字段（instance field）,操作数据的过程称为方法（method）。作为一个类的实例，特定对象都有一组特定的实例字段值。这些值的集合就是这个对象的当前状态（state）。无论何时，只要在对象上调用一个方法，它的状态就有可能发生改变。

实现封装的关键在于，绝对不能让类中的方法直接访问其他类的实例字段。程序**只能**通过对象的方法与对象数据进行交互。封装给对象赋予了“黑盒”特征，这是提高重用性和可靠性的关键。这意味着一个类可以完全改变存储数据的方式，只要仍旧使用同样的方法操作数据，其他对象就不会知道也不用关心这个类所发生的变化。

OOP允许通过**拓展**其他类来构建新类，这个过程称为继承（inheritance）。

### 4.1.2 Objects
对象的三个主要特性：
- 行为(behavior)：可以对对象完成哪些操作，或者可以对对象应用哪些方法？同一个类的所有实例，支持相同的行为。对象的行为是用可调用方法来定义的。
- 状态(state)：当调用那些方法时，对象会如何响应？每个对象保存着当前状况的信息，就是对象的状态。
- 标识(identity)：如何区分具有相同行为与状态的不同对象？每个对象都应该有唯一的标识。

### 4.1.3 Identifying Classes
识别类的一个简单经验是在分析问题的过程中寻找名词，而方法对应着动词。

例如，在订单处理系统中，有这样一些名词：
- 商品(Item)
- 订单(Order)
- 送货地址(Shipping address)
- 付款(Payment)
- 账户(Account)

从这些名词就可以得到类Item、Order等。接下来查看动词。商品被添加到订单中，订单会发货或取消，另外可以对订单完成付款。对于每一个动词，如“添加”“发货”“取消”以及“完成付款”，都要识别出负责完成相应动作的对象。例如，当一个新的商品添加到订单中时，那个订单对象就是负责的对象，因为它知道如何存储商品以及如何对商品进行排序。

### 4.1.4 Relationships between Classes
在类之间，最常见的关系有
- 依赖（dependence, “uses-a”）：应尽可能地将互相依赖的类减到最少，以此减少类之间的耦合。
- 聚合（aggregation, “has-a”）
- 继承（inheritance, “is-a”）

[类的依赖、关联、聚合、组合关系](https://zhuanlan.zhihu.com/p/643513586)
[UML](https://zhuanlan.zhihu.com/p/109655171)

## 4.2 Using Predefined Classes

### 4.2.1 Objects and Object Variables
使用构造器（constructor, 或称构造函数）构造新实例。

### 4.2.2 The LocalDate Class of the Java Library
```Java
LocalDate.now();
LocalDate newYearsEve = LocalDate.of(1999, 12, 31);
int year = newYearsEve.getYear(); // 1999
int month = newYearsEve.getMonthValue(); // 12
int day = newYearsEve.getDayOfMonth(); // 31

LocalDate aThousandDaysLater = newYearsEve.plusDays(1000);
year = aThousandDaysLater.getYear(); // 2002
month = aThousandDaysLater.getMonthValue(); // 09
day = aThousandDaysLater.getDayOfMonth(); // 26
```

### 4.2.3 Mutator and Accessor Methods





