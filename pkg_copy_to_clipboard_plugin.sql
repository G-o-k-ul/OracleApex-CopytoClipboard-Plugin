CREATE PACKAGE ace_copy_to_clipboard AS
-- =============================================================================
-- Package: ACE_COPY_TO_CLIPBOARD
-- Plugin Type: Dynamic Action Plugin
-- Internal Name: COM.ORACLE.ACE.COPY.CLIPBOARD
-- Description: Copies text from an APEX page item or a static string to the
--              clipboard when triggered. Shows a visual confirmation on the
--              trigger element (e.g., a button).
-- Author: [Your Name] - Oracle ACE Apprentice
-- Version: 1.0.0
-- Compatible: Oracle APEX 22.1+  |  Requires HTTPS (Clipboard API requirement)
-- =============================================================================

  FUNCTION render (
    p_dynamic_action IN apex_plugin.t_dynamic_action,
    p_plugin         IN apex_plugin.t_plugin
  ) RETURN apex_plugin.t_dynamic_action_render_result;

END ace_copy_to_clipboard;
/

CREATE PACKAGE BODY ace_copy_to_clipboard AS

  -- ---------------------------------------------------------------------------
  -- FUNCTION: render
  -- Renders JS to copy item value or static text to clipboard.
  -- ---------------------------------------------------------------------------
  FUNCTION render (
    p_dynamic_action IN apex_plugin.t_dynamic_action,
    p_plugin         IN apex_plugin.t_plugin
  ) RETURN apex_plugin.t_dynamic_action_render_result AS

    l_result              apex_plugin.t_dynamic_action_render_result;

    -- Attribute 1: Source Type  (item | static)
    l_source_type         VARCHAR2(10)   := NVL(p_dynamic_action.attribute_01, 'item');
    -- Attribute 2: Page Item Name (used when source_type = 'item')
    l_source_item         VARCHAR2(255)  := p_dynamic_action.attribute_02;
    -- Attribute 3: Static Text (used when source_type = 'static')
    l_static_text         VARCHAR2(4000) := NVL(p_dynamic_action.attribute_03, '');
    -- Attribute 4: Success Label override
    l_success_label       VARCHAR2(100)  := NVL(p_dynamic_action.attribute_04, 'Copied!');
    -- Attribute 5: Reset delay (ms)
    l_reset_delay         NUMBER         := NVL(TO_NUMBER(p_dynamic_action.attribute_05), 2000);

    l_escaped_static      VARCHAR2(4000);

  BEGIN

    -- Escape static text for safe JS embedding
    l_escaped_static := apex_escape.js_literal(l_static_text);

    -- Inject once-per-page CSS for the "copied" feedback animation
    apex_css.add(
      p_css =>
        '.ace-copy-btn-feedback {' ||
          'transition: all 0.2s ease;' ||
        '}' ||
        '.ace-copy-btn-feedback.ace-copied {' ||
          'background-color: #28a745 !important;' ||
          'border-color:     #28a745 !important;' ||
          'color:            #fff    !important;' ||
        '}',
      p_key => 'ace-copy-clipboard-css'
    );

    -- Build the JavaScript function
    IF l_source_type = 'item' THEN
      -- Copy from a page item value
      l_result.javascript_function :=
        'function() {' ||
        '  var triggerEl  = this.triggeringElement;' ||
        '  var itemEl     = document.getElementById(' || apex_javascript.add_value(l_source_item) || ');' ||
        '  var textToCopy = itemEl ? itemEl.value : "";' ||
        '  if (!textToCopy) {' ||
        '    apex.message.showErrors([{type:"error",location:"page",' ||
        '      message:"No value to copy from ' || apex_escape.js_literal(l_source_item) || '"}]);' ||
        '    return;' ||
        '  }' ||
        '  navigator.clipboard.writeText(textToCopy).then(function() {' ||
        '    var origText = triggerEl.textContent;' ||
        '    triggerEl.textContent = ' || apex_javascript.add_value(l_success_label) || ';' ||
        '    triggerEl.classList.add("ace-copy-btn-feedback","ace-copied");' ||
        '    setTimeout(function() {' ||
        '      triggerEl.textContent = origText;' ||
        '      triggerEl.classList.remove("ace-copied");' ||
        '    }, ' || l_reset_delay || ');' ||
        '  }).catch(function(err) {' ||
        '    apex.debug.error("ACE Copy Plugin: Clipboard write failed", err);' ||
        '  });' ||
        '}';

    ELSE
      -- Copy static text (with APEX substitution already resolved server-side)
      l_result.javascript_function :=
        'function() {' ||
        '  var triggerEl  = this.triggeringElement;' ||
        '  var textToCopy = ' || l_escaped_static || ';' ||
        '  navigator.clipboard.writeText(textToCopy).then(function() {' ||
        '    var origText = triggerEl.textContent;' ||
        '    triggerEl.textContent = ' || apex_javascript.add_value(l_success_label) || ';' ||
        '    triggerEl.classList.add("ace-copy-btn-feedback","ace-copied");' ||
        '    setTimeout(function() {' ||
        '      triggerEl.textContent = origText;' ||
        '      triggerEl.classList.remove("ace-copied");' ||
        '    }, ' || l_reset_delay || ');' ||
        '  }).catch(function(err) {' ||
        '    apex.debug.error("Copy Plugin: Clipboard write failed", err);' ||
        '  });' ||
        '}';
    END IF;

    RETURN l_result;

  EXCEPTION
    WHEN OTHERS THEN
      apex_debug.error('Copy to Clipboard Plugin Error: %s', SQLERRM);
      RAISE;
  END render;

END ace_copy_to_clipboard;
/