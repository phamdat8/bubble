module ApplicationHelper
    def vn input
        case input
        when true
            return "Đúng"
        when false
            return "Sai"
        else
           return input 
        end
    end
end
