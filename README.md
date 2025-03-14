# singel-cpu-simulation
a homework for coding C simulation

# Single Cycle CPU Simulator

![C Language](https://img.shields.io/badge/Language-C-blue)
![License](https://img.shields.io/badge/License-MIT-green)

该项目使用 C 语言实现了一个单周期 CPU 模拟器，支持指令解析、寄存器操作、内存访问等核心功能，可用于计算机体系结构教学和硬件行为模拟。

## 目录结构
project_single_CPU/
├── bin/                 # 编译生成的可执行文件
├── source_code/         # 核心源代码
│   ├── Instruction.[ch]  # 指令解码与执行
│   ├── Registers.[ch]    # 通用寄存器管理
│   ├── f_register.[ch]   # 特殊功能寄存器（如PC、状态寄存器）
│   ├── mem.[ch]          # 内存读写模块
│   └── opcode_and_function.h  # 指令操作码定义
├── test/                # 测试用例
│   ├── test_mem.c       # 内存模块测试
│   ├── test_register.c  # 寄存器模块测试
│   └── test_program*.c  # 完整指令流测试
└── Makefile             # 构建脚本


## 功能特性
- **指令集模拟**  
  支持基础 R/I/J 型指令，包括算术运算、内存访问、分支跳转。
- **寄存器管理**  
  - 32 个通用寄存器（`Registers` 模块）
  - 程序计数器 PC、状态寄存器等（`f_register` 模块）
- **内存系统**  
  - 按字寻址的 4KB 内存空间（`mem` 模块）
  - 支持 `lw/sw` 指令模拟
- **日志输出**  
  提供调试模式，可打印指令执行流水状态。

## 快速开始

### 构建项目
```bash
# 编译所有模块
make

# 清理构建文件
make clean

# 运行内存模块测试
make test=test_mem && ./bin/test_mem

# 运行寄存器模块测试
make test=test_register && ./bin/test_register

# 运行完整指令流测试（示例）
make test=test_program && ./bin/test_program

#指令执行流程
取指：从内存中读取 PC 指向的指令
译码：解析操作码和操作数（Instruction 模块）
执行：ALU 运算/内存地址计算
访存：执行 lw/sw 操作（mem 模块）
写回：更新寄存器或 PC

