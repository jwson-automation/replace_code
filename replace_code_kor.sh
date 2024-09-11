#!/bin/bash

# 프로젝트 경로
PROJECT_DIR="/Users/sonjungwoo/AndroidStudioProjects/jungwoo"

# 바꾸고 싶은 코드 (여러 줄)
TARGET_CODE=$(cat << 'END_HEREDOC'
        observeLiveData()
        binding.editTextAmount.focusAndShowKeyboard()
END_HEREDOC
)

# 교체할 코드
REPLACEMENT_CODE=$(cat << 'END_HEREDOC'
        変わりました！
END_HEREDOC
)

# 파일 확장자 (예: *.kt)
FILE_PATTERN="*.kt"

# 파일 경로 확인을 위해 출력 추가
# 検索されたファイルパスの確認用出力
find "$PROJECT_DIR" -type f -name "$FILE_PATTERN" -print

# 파일을 검색하고 여러 줄 패턴을 치환합니다 (perl 사용)
find "$PROJECT_DIR" -type f -name "$FILE_PATTERN" -exec perl -0777 -pi -e "s|\Q$TARGET_CODE\E|$REPLACEMENT_CODE|g" {} +

# 확인 메세지 출력!
echo "모든 $TARGET_CODE를 $REPLACEMENT_CODE로 변경 완료!"