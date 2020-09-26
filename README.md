# yacc
该仓库用于存放和记录笔者进行LEX和YACC的学习记录，所有的程序代码以及踩坑的记录都会在这里详细给出

## 如何运行
克隆工程到本地，然后建立`build`目录用于存放编译后的产出物，在`build`目录中运行`cmake`指令产生makefile，随后再进行编译。

```Shell
yh-swjtudeMacBook-Pro:build yh_swjtu$ cmake ..
-- The C compiler identification is AppleClang 9.0.0.9000039
-- The CXX compiler identification is AppleClang 9.0.0.9000039
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /Library/Developer/CommandLineTools/usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /Library/Developer/CommandLineTools/usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /Users/yh_swjtu/Desktop/yacc/build
yh-swjtudeMacBook-Pro:build yh_swjtu$ make
Scanning dependencies of target yacc
[ 50%] Building CXX object CMakeFiles/yacc.dir/src/main.cpp.o
[100%] Linking CXX executable yacc
[100%] Built target yacc
```