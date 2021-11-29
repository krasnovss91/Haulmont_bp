update sec_presentation set xml = replace(xml,'proc.name','proc.locName')^
update sec_user_setting set value = replace(value, 'proc.name', 'proc.locName')^
