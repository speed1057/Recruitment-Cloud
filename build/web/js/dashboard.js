  $(function(){
                $('.wrapper-content .row .col-md-2 .nav li a').on('click', function(){
                    var $panel=$(this).closest('.wrapper-content .row');
                    $panel.find('li a.active').removeClass('active');
                    $(this).addClass('active');
                    //panel to be shown
                    var panelToShow=$(this).attr('rel');
                    
                    $panel.find('.col-lg-10 .tab-content .tab-pane.active').slideUp(300,function(){
                         $(this).removeClass('active');
                         $('#'+panelToShow).fadeIn(300,function (){
                         $(this).addClass('active');
                            });   
                          });
                });
            });
            
            $(window).on('load',function(){
                $('#panel1').addClass('active');
                
            });
