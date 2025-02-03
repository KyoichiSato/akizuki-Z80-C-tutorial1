/*
秋月電子で売っている Z80用 Cコンパイラ XCC-Vの使い方 1

windows11で使用するとIDEが不安定で、
プロジェクトの保存やプロジェクトからファイルの除外を行うと
IDEが異常終了したり、プロジェクトに登録してあるファイルが消えたりするので、
IDEを使わずにコマンドラインから使うと良い。

This code is provided under a CC0 Public Domain License.
http://creativecommons.org/publicdomain/zero/1.0/

2025年1月27日 佐藤恭一 kyoutan.jpn.org

*/

int func1(int a, int b)
{
    return a + b;
}

int main()
{
    int a, b;

    a = 123;
    b = 456;
    
    a = func1(a, b);
}
