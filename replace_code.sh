#!/bin/bash

# 프로젝트 경로
# プロジェクトディレクトリのパス
PROJECT_DIR="/Users/sonjungwoo/AndroidStudioProjects/jungwoo"

# 바꾸고 싶은 코드 (여러 줄)
# 置換したいコード（複数行）
TARGET_CODE=$(cat << 'END_HEREDOC'
        observeLiveData()
        binding.editTextAmount.focusAndShowKeyboard()
END_HEREDOC
)

# 교체할 코드
# 置換後のコード
REPLACEMENT_CODE=$(cat << 'END_HEREDOC'
        // 새로운 코드로 교체
        // 新しいコードに置き換える
        newFunctionCall()
END_HEREDOC
)

# 파일 확장자 (예: *.kt)
# ファイル拡張子（例：*.kt）
FILE_PATTERN="*.kt"

# 파일 경로 확인을 위해 출력 추가
# 検索されたファイルパスの確認用出力
find "$PROJECT_DIR" -type f -name "$FILE_PATTERN" -print

# 파일을 검색하고 여러 줄 패턴을 치환합니다 (perl 사용)
# ファイルを検索し、複数行のパターンを置換します（perl使用）
find "$PROJECT_DIR" -type f -name "$FILE_PATTERN" -exec perl -0777 -pi -e "s|\Q$TARGET_CODE\E|$REPLACEMENT_CODE|g" {} +

# 확인 메세지 출력!
# 完了メッセージを表示！
echo "모든 $TARGET_CODE를 $REPLACEMENT_CODE로 변경 완료!"
# すべての $TARGET_CODE を $REPLACEMENT_CODE に変更しました！
