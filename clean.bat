@echo off
REM 中間ファイルなどを削除するバッチファイル
REM
REM This code is provided under a CC0 Public Domain License.
REM http://creativecommons.org/publicdomain/zero/1.0/
REM
REM 2024年12月19日 佐藤恭一 kyoutan.jpn.org

REM 中間ファイルなどを削除
del *.xao
del *.lis
del *.gst
del *.map
del *.xlo
del *.inf
del *.xho

REM Cコンパイラが出力したアセンブラリストを削除
del tutorial_1.xas
