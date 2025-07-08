import pandas as pd
import argparse

# 归一化数据并保存到文件
def normalize_data(input_file, output_file):
    # 读取文件，跳过第一行（无效行），并指定第二行作为列名，第一列作为行名，使用空格作为分隔符
    df = pd.read_csv(input_file, skiprows=1, sep=' ', index_col=0)

    # 对每一行进行归一化：x / sum(x)
    df = df.div(df.sum(axis=1), axis=0)

    # 保存归一化后的数据，仍然使用空格作为分隔符
    df.to_csv(output_file, sep=' ')
    print(f"归一化后的数据已保存到 {output_file}")

# 设置命令行参数解析
def main():
    parser = argparse.ArgumentParser(description='对空格分隔的CSV文件进行归一化处理，使每行数据的和为1')
    parser.add_argument('input_file', type=str, help='输入CSV文件路径')
    parser.add_argument('output_file', type=str, help='输出CSV文件路径')

    args = parser.parse_args()

    # 调用归一化函数
    normalize_data(args.input_file, args.output_file)

if __name__ == "__main__":
    main()
