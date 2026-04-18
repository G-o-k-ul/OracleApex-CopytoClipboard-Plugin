# 📋 Copy to Clipboard – Oracle APEX Dynamic Action Plugin

> **Plugin Type:** Dynamic Action  
> **Internal Name:** `COM.ORACLE.ACE.COPY.CLIPBOARD`  
> **APEX Version:** 22.1+  
> **Author:** GOKUL – Oracle ACE Apprentice  
> **Version:** 1.0.0  

---

## 📌 Overview

**Copy to Clipboard** is a Dynamic Action plugin for Oracle APEX that allows users to copy text to their clipboard with a single click. It supports copying from:

- **A page item** (text field, display-only field, hidden item)
- **A static string** (hardcoded or substituted value)

When the copy succeeds, the triggering button briefly changes its label and color to give instant visual feedback — then resets automatically.

---

## ✨ Features

| Feature | Details |
|---|---|
| **Two Source Modes** | Page Item value or Static/substituted text |
| **Visual Feedback** | Button turns green + changes label on success |
| **Auto Reset** | Button returns to original state after configurable delay |
| **Error Handling** | Shows APEX inline error if source item is empty |
| **HTTPS Safe** | Uses the modern `navigator.clipboard` API |
| **Accessible** | Works with keyboard-triggered buttons |

---

## 📁 File Structure

```
plugin-3-copy-to-clipboard/
├── src/
│   ├── dynamic_action_plugin_com_oracle_ace_copy_clipboard.sql  ← Plugin definition
│   └── ace_copy_to_clipboard_pkg.sql                            ← PL/SQL Package
├── dist/
│   └── install.sql
└── README.md
```

---

## 🚀 Installation

### Step 1 – Install PL/SQL Package
```sql
@src/ace_copy_to_clipboard_pkg.sql
```

### Step 2 – Import Plugin into APEX
1. **Shared Components → Plug-ins → Import**
2. Upload: `src/dynamic_action_plugin_com_oracle_ace_copy_clipboard.sql`
3. Click **Next → Install Plugin**

---

## ⚙️ Plugin Attributes

| Attribute | Type | Default | Description |
|---|---|---|---|
| **Source Type** | Select List | `item` | `item` = read from page item; `static` = use literal text |
| **Source Item Name** | Text | *(blank)* | Page item ID to copy from (e.g. `P1_EMAIL`) |
| **Static Text** | Text | *(blank)* | Text to copy when Source Type = `static` |
| **Success Label** | Text | `Copied!` | Button label shown after successful copy |
| **Reset Delay (ms)** | Number | `2000` | How long before button label resets |

---

## 🔧 Usage Example

**Scenario:** Copy a generated OTP/token displayed in `P5_TOKEN` when user clicks "Copy Token" button.

1. Create button: **Copy Token** (Static ID: `BTN_COPY_TOKEN`)
2. Create Dynamic Action → Event: `Click` → Selection Type: `Button` → Button: `BTN_COPY_TOKEN`
3. True Action → **Copy to Clipboard [ACE]**
   - Source Type: `item`
   - Source Item Name: `P5_TOKEN`
   - Success Label: `✔ Copied!`
   - Reset Delay: `2500`

---

## ⚠️ Browser Requirement

The `navigator.clipboard.writeText()` API requires a **secure context (HTTPS)**. This plugin will not work on `http://` URLs (except `localhost`).

---

## 💡 Use Cases

- 🔑 Copy API keys, tokens, or one-time passwords
- 📧 Copy pre-filled email addresses or invite links
- 📦 Copy tracking numbers or order IDs
- 🔗 Copy shareable report URLs

---

## 📄 License

MIT License – free to use, modify, and distribute. Attribution appreciated.

---


## 👤 Author

**GOKUL**  
Oracle ACE Apprentice  
GitHub: https://github.com/G-o-k-ul
Blog: https://codewithgokul.blogspot.com/
LinkedIn: https://www.linkedin.com/in/gokul-b-ab86a6229/