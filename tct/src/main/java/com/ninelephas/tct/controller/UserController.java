package com.ninelephas.tct.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * 
 * @ClassName: UserController
 * @Description: User的mvc控制器
 * @author 徐泽宇
 * @date 2016年12月28日 下午6:24:05
 *
 */
@Controller("com.ninelephas.tct.controller.UserController")
@RequestMapping(value = "/user")
public class UserController {

    /**
     * Logger for this class
     */
    private static final Logger logger = LogManager.getLogger(UserController.class.getName());


    /**
     * 
     * login
     * 
     * @Auther 徐泽宇
     * @Date 2016年12月28日 下午6:26:57
     * @Title: login
     * @Description: 用户登录
     * @param userName
     * @param oPasswd
     * @return
     * @throws ControllerException
     */
    @RequestMapping(value = "/login", produces = "application/json;charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView login(String userName, String oPasswd)  {
        if (logger.isDebugEnabled()) {
            logger.debug("login(String userName={}, String oPasswd={}) - start", userName, oPasswd); //$NON-NLS-1$
        }

        if (logger.isDebugEnabled()) {
            logger.debug("login(String userName={}, String oPasswd={}) - end", userName, oPasswd); //$NON-NLS-1$
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/user/logout");
        return mv;
    }
}
