date: 2022-11-09 23:09:50

title: Q&A

tags:

- interview
- c/c++
- LLVM
---

# Interview 问题收集

###### memcopy 与 memmove谁更安全？

memmove 更安全，memove 可以正确处理地址重叠的部分。

###### const 与 define 在定义常量的区别？

const 申明的常量会进行类型检查，define只是替换，不做类型检查。

###### static 关键字的作用？

static申明的类变量属于类，不属于某个对象，是所有类共享。

###### Cache和主存内存一致性

1. write-through 写操作是数据写入cache又写入内存。
2. write-back 写操作只是在数据被踢出cache时才写入内存。

###### 指令调度的基本流程

1. 构建DAG图，对DAG图进行处理
2. 初始化，包括调度策略，DAG图，调度器队列；
3. 选取节点进行调度，pickNode方法在自定义调度策略中被重写，GenericScheduler::pickNode（）获取RegionPolicy中设置的次序>进行遍历，pickNode方法返回一个SUnit（Scheduling unit），这是调度图中的一个节点表示，包含节点的一系列属性和状态，譬如isPending，isAvailable，isScheduled等用于记录节点状态的信息；调试时可以通过SUnit.getInstr()->dump()打印出节点中指令的信息。
4. scheduleMI，移动指令和更新寄存器压力信息
5. 更新调度状态，将SU->isScheduled 设为 true。

###### std::cout 与 std::cerr 的区别?

​	std::cerr不需要被发送缓冲区，可以直接显示输出，std::cout 为了减少刷屏的次数，设置了缓冲区，这样在遇到std::endl 或者"\n">时会调用os.flush把缓冲区内容输出到显示器上进行显示。