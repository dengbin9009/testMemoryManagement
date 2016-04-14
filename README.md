# testMemoryManagement

功能：

1、测试多个分类重名时，方法的调用顺序  
　　编译器在编译时已经所有方法的指向，可参考博文：http://blog.csdn.net/dengbin9009/article/details/51151115

2、在64位处理器和32位处理器下由于Tagged Pointer导致的区别  
　　此问题可参考博文：http://blog.devtang.com/2014/03/21/weak_object_lifecycle_and_tagged_pointer/

3、测试copy在系统对象上的效果  
　　结论：被copy的新数组中的简单对象（NSString）被改变时不影响原数组中的对象  
　　　　　复杂对象被改变时会影响原数组中的对象  
　　原因：简单对象存的是内容，而复杂对象存的是指针

4、测试copy在自定义对象上的效果（效果为深复制）  
　　结论：可在DBObject重写copy或者在类DBObject中实现NSCopying协议

5、如何才能取到没有在.h文件中声明，但在.m文件中实现的方法  
　　使用方法performSelector可以获取到此种情况的方法。

6、如何才能获取类的变量  
　　始终指针获取  
