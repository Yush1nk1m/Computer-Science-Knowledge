use cspractice;

-- 외래 키 제약 조건을 일시적으로 비활성화
SET FOREIGN_KEY_CHECKS = 0;

-- 모든 테이블 이름을 가져와 드랍 쿼리 생성
SET @tables = NULL;
SELECT GROUP_CONCAT('`', table_name, '`') INTO @tables
FROM information_schema.tables
WHERE table_schema = (SELECT DATABASE());

-- 드랍 쿼리 실행
SET @tables = IFNULL(@tables, 'dummy_table');
SET @sql = CONCAT('DROP TABLE IF EXISTS ', @tables);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 외래 키 제약 조건을 다시 활성화
SET FOREIGN_KEY_CHECKS = 1;
