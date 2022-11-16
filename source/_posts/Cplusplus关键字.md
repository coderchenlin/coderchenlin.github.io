---
date: 2022-11-15 23:09:50  
title: C++关键字总结  
tags:  
- interview
- c/c++
---

### mutable 与 const 
mutable的中文意思是“可变的，易变的”，跟constant（既C++中的const）是反义词。

1、const所修饰的函数中，要有编译器负责保护类中的成员函数不被修改；而相对地，mutable则是用来修饰类的成员变量的，让该变量在const修饰的常成员函数中可以被修改

2、const修饰的函数只能是类的成员函数(保护this指针不被恶意修改)；mutable修饰的变量只能是类的成员变量。

3、在C++中，mutable也是为了突破const的限制而设置的。被mutable修饰的变量，将永远处于可变的状态，即使在一个const修饰的常成员函数中。

### private
 private可以保护不被类的成员不被外界调用，析构函数通常情况是public的，这样外部调用的时候可以用于
 释放内存，如果一个析构函数被private修饰，那么会出现编译报错，因为编译器不能调用被private保护的析构函数。  


### 引用
[1] https://blog.csdn.net/weixin_42067873/article/details/96107750