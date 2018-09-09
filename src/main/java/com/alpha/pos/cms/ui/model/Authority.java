package com.alpha.pos.cms.ui.model;
import com.alpha.pos.cms.ui.common.enums.ActiveStatus;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
