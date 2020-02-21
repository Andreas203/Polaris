class Company < ApplicationRecord
    searchable do
        string :companyName
    
        string :companySymbol
        json :past
        json :pred
        
    end
end
