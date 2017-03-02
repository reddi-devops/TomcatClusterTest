jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
	//    $.backstretch(contextPath+"/assets/imgs/backgrounds/login.jpg");
    
    /*
     * 初始化 notification-logger
     */
    //logger.init()
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    console.debug($('.login-form'));
    console.debug("js 成功调用");
 
});