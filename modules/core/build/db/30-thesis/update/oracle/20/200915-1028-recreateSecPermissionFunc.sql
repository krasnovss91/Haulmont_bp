CREATE OR REPLACE FUNCTION create_or_update_sec_permissi( -- renamed create_or_update_sec_permission
    r_name   IN varchar2,  -- sec_role.name
    p_target IN varchar2,  -- sec_permission.target
    p_type   IN integer,   -- sec_permission.type
    p_value  IN integer    -- sec_permission.value
)
RETURN varchar2 IS
    p_id varchar2(32 char);
    PRAGMA AUTONOMOUS_TRANSACTION;  -- start anonymous transaction
BEGIN
    p_id := NULL;
    select p.id into p_id   -- return p_id;
    from SEC_PERMISSION p
    join SEC_ROLE r
    on r.id = p.role_id
    where r.name = r_name and p.target = p_target
    and ROWNUM = 1;

    IF p_id is not null THEN
        update SEC_PERMISSION p set p.PERMISSION_TYPE = p_type, p.value_ = p_value where p.id = p_id;
        COMMIT;     -- commit anonymous transaction
        RETURN 'SEC_PERMISSION record was updated';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND
    THEN insert into SEC_PERMISSION (
          id,
          create_ts,
          created_by,
          VERSION,
          PERMISSION_TYPE,
          TARGET,
          value_,
          role_id
        ) values (
          newid(),
          CURRENT_TIMESTAMP,
          USER,
          1,
          p_type,
          p_target,
          p_value,
          (select id from sec_role where name = r_name)
        );
        COMMIT;     -- commit anonymous transaction
        RETURN 'SEC_PERMISSION record was created';
END create_or_update_sec_permissi;^