## PA1

先去onenote把之前的笔记cv过来

typora记笔记 注意 图片保存位置（TODO：图床 || 博客）

### 表达式求值

- 注意括号

  (4 + 3) * (2 - 1)如果不管讲义中出现的(4 + 3) * (2 - 1)
  测试的时候((100) * (7))会被解析成100) * (7，直接g

- 注意运算符：我的解决办法是 从左往右遍历， pri_old<=pri_new 就换op_index，有的博客是用栈去实现的，我觉得没必要

  > 当有多个运算符的优先级都是最低时, 根据结合性, 最后被结合的运算符才是主运算符. 一个例子是1 + 2 + 3, 它的主运算符应该是**右**边的+

- 负号问题

  > "1 + -1"
  > "--1"    /* 我们不实现自减运算, 这里应该解释成 -(-1) = 1 */

  `-`的前面只要不是`)`或者`-`的后面是`-`

- 错误处理

  > eval 上述框架中并没有进行错误处理, 在求值过程中发现表达式不合法的时候, 应该给上层函数返回一个表示出错的标识, 告诉上层函数"求值的结果是无效的". 