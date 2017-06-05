module WikisHelper
    
    def public_wiki?(wiki)
        ## will display on view only public wikis
        ## will check if a user is a standard, premium, or admin user or that the wiki's private value has been set to false
        
        (current_user.standard? || current_user.premium? || current_user.admin?) && (wiki.private == nil || wiki.private == false)
    end

    def private_wiki?(wiki)
        ## will display only private wikis 
        ## will check that the wiki's private value has been set to true
        
       (current_user.admin? || current_user.premium?) && wiki.private == true
    end

end
