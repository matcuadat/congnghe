#!/bin/bash

TITLE="$*"

if [ -z "$TITLE" ]; then
    echo "❌ Vui lòng nhập tiêu đề"
    exit 1
fi

# Tạo slug (không dấu)
SLUG=$(echo "$TITLE" | sed 's/[áàảãạăắằẳẵặâấầẩẫậ]/a/g; s/[éèẻẽẹêếềểễệ]/e/g; s/[íìỉĩị]/i/g; s/[óòỏõọôốồổỗộơớờởỡợ]/o/g; s/[úùủũụưứừửữự]/u/g; s/[ýỳỷỹỵ]/y/g; s/[đ]/d/g; s/[ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ]/A/g; s/[ÉÈẺẼẸÊẾỀỂỄỆ]/E/g; s/[ÍÌỈĨỊ]/I/g; s/[ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ]/O/g; s/[ÚÙỦŨỤƯỨỪỬỮỰ]/U/g; s/[ÝỲỶỸỴ]/Y/g; s/[Đ]/D/g' | tr '[:upper:]' '[:lower:]' | sed -r 's/[^a-z0-9]+/-/g' | sed -r 's/^-+|-+$//g')

# Tạo thư mục và file
mkdir -p "content/posts/${SLUG}"
cat > "content/posts/${SLUG}/index.md" << EOF
+++
title = '${TITLE}'
date = '$(date -Iseconds)'
draft = true
tags = []
categories = []
+++

EOF

echo "✅ Đã tạo: content/posts/${SLUG}/index.md"
echo "📝 Tiêu đề: ${TITLE}"