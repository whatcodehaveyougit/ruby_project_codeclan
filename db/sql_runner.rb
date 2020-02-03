# require('pg')
#
# class SqlRunner
#
#   def self.run(sql, values = [])
#     begin
#       db = PG.connect({dbname: 'edinburghsound', host: 'localhost'})
#       db.prepare("query", sql)
#       result = db.exec_prepared("query", values)
#     ensure
#       db.close() if db != nil
#     end
#     return result
#   end
#
# end


require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'd9t6pd3bgk5kbp', host: 'ec2-3-220-86-239.compute-1.amazonaws.com'
        port: 5432, user: 'tdcunwpeqgeslo', password: '79fcf1de5fcea53f4cd57084afc066d06fe5a009437d4493a1123b36f5841000'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
