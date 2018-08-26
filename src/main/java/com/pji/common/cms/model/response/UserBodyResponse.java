package com.pji.common.cms.model.response;

import com.pji.common.cms.model.Authority;
import com.pji.common.cms.model.AuthorityName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Jeffry Christian
 * @since 27/03/2018
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserBodyResponse implements Serializable {
    private static final long serialVersionUID = 3047735082874099719L;

    private Long id;
    private String userName;
    private String firstName;
    private String lastName;
    private String email;
    private Boolean enabled;
    private Date lastPasswordResetDate;
    private String createdBy;
    private Date createdTime;
    private String updatedBy;
    private Date updatedTime;
    private String activeStatus;
    private Long authorityId;
    private AuthorityName authorityName;
}
