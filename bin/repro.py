
from bs4 import BeautifulSoup, NavigableString, Tag
import re
from typing import Iterable

SKIP_TAGS = {"script", "style", "code", "pre", "kbd", "samp"}

def is_probably_sentence_text(s: str) -> bool:
    s2 = s.strip()
    if len(s2) < 25:
        return False
    if not re.search(r"[A-Za-z]", s2):
        return False
    letters = len(re.findall(r"[A-Za-z]", s2))
    if letters / max(1, len(s2)) < 0.2:
        return False
    return True

def iter_text_nodes(soup: BeautifulSoup) -> Iterable[NavigableString]:
    for node in soup.descendants:
        if isinstance(node, NavigableString):
            parent = node.parent
            if not isinstance(parent, Tag):
                continue
            if parent.name and parent.name.lower() in SKIP_TAGS:
                continue
            if node.string is None:
                continue
            yield node

html = """
<div>
    <p>This is a long enough sentence that should be caught by the filter.</p>
    <p>Short one.</p>
    <p>This is <i>italicized</i> and <b>bold</b> text.</p>
    <p>Another "quote" that might be short.</p>
</div>
"""

soup = BeautifulSoup(html, "lxml")
print("Nodes found and their 'is_probably_sentence_text' status:")
for node in iter_text_nodes(soup):
    original = str(node)
    status = is_probably_sentence_text(original)
    print(f"Text: {repr(original.strip())} | Status: {status} | Len: {len(original.strip())}")
