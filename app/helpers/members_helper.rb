module MembersHelper
  def table_count(size)
    member = size.to_i > 1 ? 'members' : 'member'
    rv = ""
    rv += '<span">'
    rv += "<p>Showing #{size} #{member}</p>"
    rv += '</span>'

    return rv.html_safe
  end
end
