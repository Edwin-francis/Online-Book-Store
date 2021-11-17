                        <!-- Footer Start-->
                        <div id="admin-footer">
                            <?php
                            $db = new Database();
                            $db->select('options','footer_text',null,null,null,null);
                            $result = $db->getResult();

                            if(count($result) > 0){ ?>
                                <span>Created By SIT</span>
                            <?php }else{ ?>
                                <span>Created By sit</span>
                            <?php }
                            ?>
                            
                        </div>
                        <!-- Footer End-->
              
        
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/admin_actions.js" type="text/javascript"></script>
        <script src="js/jquery-te-1.4.0.min.js" type="text/javascript"></script>   
        <!-- https://jqueryte.com/ -->
        <script>
            $('.product_description').jqte({
                link: false,
                unlink: false,
                color: false,
                source: false,
            });
        </script>
    </body>
</html>
