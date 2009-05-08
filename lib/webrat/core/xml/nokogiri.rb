require "webrat/core_extensions/meta_class"

module Webrat

  def self.nokogiri_document(stringlike) 
    return stringlike.dom if stringlike.respond_to?(:dom)

    if Nokogiri::HTML::Document === stringlike
      stringlike
    elsif Nokogiri::XML::NodeSet === stringlike
      stringlike
    elsif StringIO === stringlike
      Nokogiri::HTML(stringlike.string)
    elsif stringlike.respond_to?(:body)
      Nokogiri::HTML(stringlike.body.to_s)
    else
      Nokogiri::HTML(stringlike.to_s)
    end
  end

  def self.html_nokogiri_document(stringlike) 
    return stringlike.dom if stringlike.respond_to?(:dom)

    if Nokogiri::HTML::Document === stringlike
      stringlike
    elsif Nokogiri::XML::NodeSet === stringlike
      stringlike
    elsif StringIO === stringlike
      Nokogiri::HTML(stringlike.string)
    elsif stringlike.respond_to?(:body)
      Nokogiri::HTML(stringlike.body.to_s)
    else
      Nokogiri::HTML(stringlike.to_s)
    end
  end

  def self.xml_nokogiri_document(stringlike) 
    return stringlike.dom if stringlike.respond_to?(:dom)

    if Nokogiri::HTML::Document === stringlike
      stringlike
    elsif Nokogiri::XML::NodeSet === stringlike
      stringlike
    elsif StringIO === stringlike
      Nokogiri::XML(stringlike.string)
    elsif stringlike.respond_to?(:body)
      Nokogiri::XML(stringlike.body.to_s)
    else
      Nokogiri::XML(stringlike.to_s)
    end
  end

  def self.define_dom_method(object, dom) 
    object.meta_class.send(:define_method, :dom) do
      dom
    end
  end

end


module Nokogiri 
  module CSS 
    class XPathVisitor 

      def visit_pseudo_class_text(node) 
        "@type='text'"
      end

      def visit_pseudo_class_password(node) 
        "@type='password'"
      end

    end
  end
end
