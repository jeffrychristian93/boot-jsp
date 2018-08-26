package com.pji.common.cms.service;

import com.pji.common.cms.model.response.SidebarMenuResponse;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Jeffry Christian
 * @since 13/04/2018
 */
public interface SidebarService {

    SidebarMenuResponse getSidebarMenus(String url, HttpServletRequest request);
    
}
