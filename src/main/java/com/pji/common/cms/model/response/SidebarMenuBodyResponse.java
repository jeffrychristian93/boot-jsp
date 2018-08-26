package com.pji.common.cms.model.response;

import com.pji.common.cms.common.enums.PrivilegeName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Jeffry Christian
 * @since 03/04/2018
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SidebarMenuBodyResponse {

    private Long id;
    private String menuCode;
    private String title;
    private String url;
    private Integer orderNo;
    private List<PrivilegeName> privileges;
    private List<SidebarSubMenuBodyResponse> subMenus;
}
