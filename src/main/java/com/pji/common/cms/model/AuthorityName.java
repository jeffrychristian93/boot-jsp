package com.pji.common.cms.model;

/**
 * @author Jeffry Christian
 * @since 13/03/2018
 */
public enum AuthorityName {
    ROLE_ADMIN("ADMIN"), ROLE_BUYER("BUYER"), ROLE_SELLER("SELLER");

    private String roleName;

    AuthorityName( String roleName ){
        this.roleName = roleName;
    }

    public String getRoleName(){
        return roleName;
    }
}