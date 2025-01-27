@echo off
REM XCC-Vでプロジェクトをビルドするバッチファイル
REM
REM This code is provided under a CC0 Public Domain License.
REM http://creativecommons.org/publicdomain/zero/1.0/
REM
REM 2024年12月19日 佐藤恭一 kyoutan.jpn.org

REM 最適化の ON/OFF
SET OPTIMIZE=OFF

REM XCCVをインストールしたフォルダを指定
SET XCC_PATH=C:\akiz80\

REM 環境変数をセット
REM （バッチファイル内でセットした環境変数は、バッチファイルの処理が終了すると破棄される）
SET PATH=%PATH%;%XCC_PATH%bin\
SET XCC_DEFINE=%XCC_PATH%GEN\CXGZE1.XCO
SET XCC_INCLUDE=%XCC_PATH%INCLUDE\
SET XAS_DEFINE=%XCC_PATH%GEN\VXGZE1.XGO
SET XAS_ERRMSG=%XCC_PATH%BIN\XASMSG.SJIS
SET XAS_LIB=%XCC_PATH%LIB\z80\
SET XAS_CODE=sjis
SET XAS_MPUNAME=z80

REM コンパイル
IF "%OPTIMIZE%"=="ON" (
xccv test.c -d -O o -w -LW1 -LE2 -ks
xccv cpmstdio.c -d -O o -w -LW1 -LE2 -ks
) ELSE (
xccv test.c -d -w -LW1 -LE2 -ks
xccv cpmstdio.c -d -w -LW1 -LE2 -ks
)

REM アセンブル
xassv startup.xas -da -a -r
xassv test.xas -da -a -r
xassv cpm.xas -da -a -r
xassv cpmstdio.xas -da -a -r

REM リンク（リンク情報は .xlsファイルに記述する）
xlnkv test.xls -l -m -d -s -o -p

REM 出力オブジェクトをインテルHEX形式に変換
xoutv test.xlo -d -t obj1,sym1 -l 

REM インテルHEXを MSX-DOS / CP/M の COMファイルに変換
python hex2com.py test.xho
