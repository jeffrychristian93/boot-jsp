package com.alpha.pos.cms.ui.model.response;

import com.alpha.pos.cms.ui.model.AuthorityName;
import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class UserResponse {

    private String username;
    private String fullName;
    private String email;
    private List<AuthorityName> roles;
    private Date lastPasswordResetDate;
    private List<MenuAccessResponse> menuAccess;
}
