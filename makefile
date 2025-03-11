CC = gcc
CFLAGS = -Isource_code -O2

# 目录定义
SRC_DIR = source_code
TEST_DIR = test

# 核心源文件（不包含 main 的文件）
CORE_SRCS = $(wildcard $(SRC_DIR)/*.c)

# 可执行文件输出路径
TARGET_DIR = bin

# 默认测试文件（可通过 make test=xxx 覆盖）
TEST ?= test_program# 默认使用 test/test1.c
TARGET = $(TARGET_DIR)/$(TEST)

# 检查测试文件是否存在
TEST_EXISTS = $(wildcard $(TEST_DIR)/$(TEST).c)
ifneq ($(TEST_EXISTS),)
    SRCS = $(CORE_SRCS) $(TEST_DIR)/$(TEST).c
else
    $(error 测试文件 "$(TEST).c" 不存在于 $(TEST_DIR)/)
endif

all: $(TARGET)

# 编译可执行文件
$(TARGET): $(SRCS)
	@mkdir -p $(TARGET_DIR)
	$(CC) $(CFLAGS) -o $@ $^

# 清理
clean:
	rm -rf $(TARGET_DIR)/*

.PHONY: all clean

