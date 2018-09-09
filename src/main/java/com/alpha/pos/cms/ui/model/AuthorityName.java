package com.alpha.pos.cms.ui.model;

public enum AuthorityName {
    ROLE_ADMIN("ADMIN"), ROLE_USER("USER"), ROLE_GUEST("GUEST");

    private String roleName;

    AuthorityName( String roleName ){
        this.roleName = roleName;
    }

    public String getRoleName(){
        return roleName;
    }
}
