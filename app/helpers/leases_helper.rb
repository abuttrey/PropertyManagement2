module LeasesHelper
  
  def renters_for_select
    User.find(:all, :order => 'username').collect {|f| [ f.username, f.id] }
  end
  
end
