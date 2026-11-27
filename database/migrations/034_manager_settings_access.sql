-- =====================================================================
-- 034_manager_settings_access.sql  —  Managers may change Site settings (also shows them the website traffic panel). Safe to re-run.
-- =====================================================================
INSERT IGNORE INTO `RolePermissions` (`RoleId`, `PermissionId`)
SELECT r.RoleId, p.PermissionId FROM Roles r JOIN Permissions p
WHERE r.NormalizedName = 'MANAGER' AND p.Code = 'settings.manage';

INSERT INTO `__schema_migrations` (`script_name`)
SELECT '034_manager_settings_access.sql'
WHERE NOT EXISTS (SELECT 1 FROM `__schema_migrations` WHERE `script_name` = '034_manager_settings_access.sql');
