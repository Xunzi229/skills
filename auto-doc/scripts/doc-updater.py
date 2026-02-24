import datetime

def append_to_changelog(content, type="Added"):
    today = datetime.date.today().strftime("%Y-%m-%d")
    with open("CHANGELOG.md", "r+") as f:
        lines = f.readlines()
        # 寻找插入位置（通常在 [Unreleased] 下方）
        for i, line in enumerate(lines):
            if "## [Unreleased]" in line or "## [" in line:
                lines.insert(i + 1, f"- [{type}] {content} ({today})\n")
                break
        f.seek(0)
        f.writelines(lines)

# AI 会根据该脚本的逻辑进行文档定位
