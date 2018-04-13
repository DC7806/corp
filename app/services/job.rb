class Job
  
  include HTTParty

  def jobs
    corp_num = "4070426b4046402540583b1d1d1d1d5f2443a363189j48"
    request_data = "J,JOB,JOB_ADDR_NO_DESCRIPT,DESCRIPTION"
    self.class.get("http://www.104.com.tw/i/apis/jobsearch.cfm?c=#{corp_num}&fmt=8&cols=#{request_data}", format: :json).parsed_response["data"]
  end

end