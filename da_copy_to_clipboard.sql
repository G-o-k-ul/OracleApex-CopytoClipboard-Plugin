prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>100001
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'MRDEV'
);
end;
/
 
prompt APPLICATION 100 - AparX
--
-- Application Export:
--   Application:     100
--   Name:            AparX
--   Date and Time:   11:41 Monday April 20, 2026
--   Exported By:     GOKUL
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 15915324851255582
--   Manifest End
--   Version:         24.2.0
--   Instance ID:     2114711391975929
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/field_highlighter_ace
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(15915324851255582)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'FIELD_HIGHLIGHTER_ACE'
,p_display_name=>'Field Highlighter [ACE]'
,p_category=>'COMPONENT'
,p_api_version=>1
,p_render_function=>'ace_field_highlighter.render'
,p_standard_attributes=>'ONLOAD:STOP_EXECUTION_ON_ERROR'
,p_substitute_attributes=>true
,p_version_scn=>31992015
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15915745770564046)
,p_plugin_id=>wwv_flow_imp.id(15915324851255582)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Items to Highlight'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15916069706567535)
,p_plugin_id=>wwv_flow_imp.id(15915324851255582)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'highlight'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15916328468568632)
,p_plugin_attribute_id=>wwv_flow_imp.id(15916069706567535)
,p_display_sequence=>10
,p_display_value=>'Highlight'
,p_return_value=>'highlight'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15916752803569620)
,p_plugin_attribute_id=>wwv_flow_imp.id(15916069706567535)
,p_display_sequence=>20
,p_display_value=>'Clear'
,p_return_value=>'clear'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15917158756570443)
,p_plugin_attribute_id=>wwv_flow_imp.id(15916069706567535)
,p_display_sequence=>30
,p_display_value=>'Toggle'
,p_return_value=>'toggle'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15917610212579806)
,p_plugin_id=>wwv_flow_imp.id(15915324851255582)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'warning'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15917979544580546)
,p_plugin_attribute_id=>wwv_flow_imp.id(15917610212579806)
,p_display_sequence=>10
,p_display_value=>'Error'
,p_return_value=>'error'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15918379919581517)
,p_plugin_attribute_id=>wwv_flow_imp.id(15917610212579806)
,p_display_sequence=>20
,p_display_value=>'Warning'
,p_return_value=>'warning'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15918793199582382)
,p_plugin_attribute_id=>wwv_flow_imp.id(15917610212579806)
,p_display_sequence=>30
,p_display_value=>'Success'
,p_return_value=>'success'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15919124430583023)
,p_plugin_attribute_id=>wwv_flow_imp.id(15917610212579806)
,p_display_sequence=>40
,p_display_value=>'Info'
,p_return_value=>'info'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15919550220584984)
,p_plugin_attribute_id=>wwv_flow_imp.id(15917610212579806)
,p_display_sequence=>50
,p_display_value=>'Custom'
,p_return_value=>'custom'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15920039564590189)
,p_plugin_id=>wwv_flow_imp.id(15915324851255582)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Pulse Animation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'Y'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15920336926590829)
,p_plugin_attribute_id=>wwv_flow_imp.id(15920039564590189)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'Y'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15920701532591434)
,p_plugin_attribute_id=>wwv_flow_imp.id(15920039564590189)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'N'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15921279376596778)
,p_plugin_id=>wwv_flow_imp.id(15915324851255582)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Auto-Clear on Change'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'Y'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15921519836597487)
,p_plugin_attribute_id=>wwv_flow_imp.id(15921279376596778)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'Y'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(15921973554598154)
,p_plugin_attribute_id=>wwv_flow_imp.id(15921279376596778)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'N'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15922431354608389)
,p_plugin_id=>wwv_flow_imp.id(15915324851255582)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Custom Background Color'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'#fffbcc'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(15917610212579806)
,p_depending_on_has_to_exist=>false
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(15922818180615698)
,p_plugin_id=>wwv_flow_imp.id(15915324851255582)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Custom Border Color'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'#f0c040'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(15917610212579806)
,p_depending_on_has_to_exist=>false
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
