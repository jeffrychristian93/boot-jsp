package com.pji.common.cms.model.response;

import com.pji.common.cms.common.enums.PrivilegeName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import netscape.security.Privilege;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Jeffry Christian
 * @since 03/04/2018
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class SidebarMenuResponse extends StatusResponse implements Serializable {

    private static final long serialVersionUID = 5587547364200346166L;
    private SidebarMenu body;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SidebarMenu implements Serializable {
        private static final long serialVersionUID = -4264068966600860999L;
        private List<SidebarMenuBodyResponse> menus;
    }

}
