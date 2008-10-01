ActionController::Routing::Routes.draw do |map|

  map.connect '*components', :controller => "main", :action => 'index'

end
