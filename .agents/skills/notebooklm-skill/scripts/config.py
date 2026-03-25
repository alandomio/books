"""
Configuration for NotebookLM Skill
Centralizes constants, selectors, and paths
"""

from pathlib import Path

# Paths
SKILL_DIR = Path(__file__).parent.parent
DATA_DIR = SKILL_DIR / "data"
BROWSER_STATE_DIR = DATA_DIR / "browser_state"
BROWSER_PROFILE_DIR = BROWSER_STATE_DIR / "browser_profile"
STATE_FILE = BROWSER_STATE_DIR / "state.json"
AUTH_INFO_FILE = DATA_DIR / "auth_info.json"
LIBRARY_FILE = DATA_DIR / "library.json"

# NotebookLM Selectors
QUERY_INPUT_SELECTORS = [
    "textarea.query-box-input",  # Primary
    'textarea[aria-label="Feld für Anfragen"]',  # Fallback German
    'textarea[aria-label="Input for queries"]',  # Fallback English
]

RESPONSE_SELECTORS = [
    ".to-user-container .message-text-content",  # Primary
    "[data-message-author='bot']",
    "[data-message-author='assistant']",
]

# Browser Configuration
# Minimal extra args — just the anti-automation detection flag
BROWSER_ARGS = [
    '--disable-blink-features=AutomationControlled',
]

# Patchright default args to suppress because they break MDM/compliance:
# - --password-store=basic  → bypasses system credential store
# - --use-mock-keychain     → prevents MDM certificate access
# - --no-sandbox            → triggers security policy flags
# - --enable-automation     → marks browser as automated
IGNORE_DEFAULT_ARGS = [
    "--enable-automation",
    "--password-store=basic",
    "--use-mock-keychain",
    "--no-sandbox",
    "--disable-dev-shm-usage",
]

# No custom user agent — let Chrome use its real UA so MDM compliance passes
USER_AGENT = None

# Timeouts
LOGIN_TIMEOUT_MINUTES = 10
QUERY_TIMEOUT_SECONDS = 120
PAGE_LOAD_TIMEOUT = 30000
