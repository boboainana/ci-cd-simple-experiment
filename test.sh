#!/bin/bash
echo "==============================="
echo "🧪 开始运行自动化测试"
echo "==============================="
echo ""

echo "1. 检查必要文件..."
required_files=("README.md" "index.html" "package.json")
all_exist=true

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "   ✅ $file 存在"
    else
        echo "   ❌ $file 缺失"
        all_exist=false
    fi
done

echo ""
echo "2. 运行npm测试..."
if npm test 2>/dev/null; then
    echo "   ✅ npm test 通过"
else
    echo "   ❌ npm test 失败"
    all_exist=false
fi

echo ""
echo "==============================="
echo "测试结果"
echo "==============================="

if $all_exist; then
    echo "🎉 所有测试通过！"
    echo "CI/CD流水线将继续进行"
    exit 0  # 0表示成功
else
    echo "❌ 测试失败"
    echo "请检查缺失的文件"
    exit 1  # 1表示失败
fi
