class MicroMackController
  include Mack::Controller
  
  layout false
  
  def favicon
    render(:text, "")
  end
  
  protected
  def text(value, options = {})
    render(:text, value, options)
  end
  
  def inline(value, options = {})
    render(:inline, value, options)
  end
end

Mack::Routes.build {|r| r.connect "/favicon.ico", :controller => :micro_mack, :action => :favicon}