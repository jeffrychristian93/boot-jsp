package com.pji.common.cms.service.impl;

import com.pji.common.cms.model.response.SidebarMenuResponse;
import com.pji.common.cms.service.HttpClient;
import com.pji.common.cms.service.SidebarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Jeffry Christian
 * @since 13/04/2018
 */
@Service
public class SidebarServiceImpl implements SidebarService {

    @Autowired
    private HttpClient httpClient;

    @Override
    public SidebarMenuResponse getSidebarMenus(String url, HttpServletRequest request) {
        ResponseEntity<SidebarMenuResponse> responseEntity = httpClient.get(request, url, SidebarMenuResponse.class);
        return responseEntity.getBody();
    }
}
