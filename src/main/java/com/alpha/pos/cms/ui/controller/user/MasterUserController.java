package com.alpha.pos.cms.ui.controller.user;//package com.alpha.pos.admin.cms.ui.controller.user;
//
//import com.alpha.pos.admin.cms.ui.model.request.UserRequest;
//import com.alpha.pos.admin.cms.ui.model.response.UserResponse;
//import com.alpha.pos.admin.cms.ui.service.UserService;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.servlet.ModelAndView;
//
//@RestController
//@RequestMapping("user")
//public class MasterUserController {
//
//    @Autowired
//    private UserService userService;
//
//    @GetMapping
//    public ModelAndView manageUsers(HttpServletRequest request , HttpServletResponse response){
//        ModelAndView mv = new ModelAndView("user/master/main");
//        mv.addObject("users" , userService.getAll(request).getBody());
//        return mv;
//    }
//
//    @GetMapping("/add")
//    public ModelAndView add(HttpServletRequest request , HttpServletResponse response){
//        ModelAndView mv = new ModelAndView("user/master/formAdd");
//        mv.addObject("user" , new UserRequest());
//        return mv;
//    }
//
//    @PostMapping("/save")
//    public ModelAndView save(
//        HttpServletRequest request , HttpServletResponse response , @ModelAttribute("user") UserRequest user){
//        ModelAndView mv = new ModelAndView();
//        UserResponse userResponse = userService.save(user, request);
//        mv.addObject("saveStatus" , userResponse.getStatus().getCode().equals("0") ? "SUCCESS" : "FAILED");
//        return mv;
//    }
//
//    @GetMapping("/edit/{id}")
//    public ModelAndView edit(
//        HttpServletRequest request , HttpServletResponse response , @PathVariable("id") Long id){
//        ModelAndView mv = new ModelAndView();
//        return mv;
//    }
//
//    @PostMapping("/update")
//    public ModelAndView update(HttpServletRequest request , HttpServletResponse response){
//        ModelAndView mv = new ModelAndView();
//        return mv;
//    }
//}
