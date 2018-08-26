package com.pji.common.cms.model;

import com.pji.common.cms.common.enums.ActiveStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;

/**
 * @author Jeffry Christian
 * @since 13/03/2018
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Authority {

    private Long id;
    private AuthorityName authorityName;
    private ActiveStatus activeStatus;
    private String createdBy;
    private String updatedBy;
    private Date createdTime;
    private Date updatedTime;

}