class MarketingController < ApplicationController
  skip_before_filter :account_active?
  skip_before_filter :verify_authenticity_token
  # before_filter :user_check, only: :dashboard
  # before_filter :authenticate!, only: :dashboard
  # before_filter :authenticate_user!, only: :dashboard
  before_filter :check_for_login,
    :only => [:case_studies, :contact, :about, :tester_zone, :media, :pricing]

  def home
    if ["blog"].include?(request.subdomains.first)
      redirect_to "/blog"
      return
    end
    if ['bugathon'].include?(request.subdomains.first)
      if @testeruser
        reset_session
        flash[:notice]="You cannot login as a tester for bugathon"
        redirect_to sign_out_path and return
      else
        @testapps = Testapp.where(showtestapps: true).sort_by(&:created_at).reverse
        @testapps = Kaminari.paginate_array(@testapps).page(params[:page] || 1).per(10)
        render "events/bugathons/votenow"
        return
      end
    end
    if @adminuser
      @company = @company_by_subdomain=(@company_by_subdomain||Company.find_by_permalink(current_user.company_names.first))
      @cycles = @company.cycles_sorted
      @cycles = Kaminari.paginate_array(@company.cycles_sorted).page(params[:page]).per(10) if @cycles.present?
      respond_to do |format|
        format.html{ render "companies/show", layout: "layouts/application"}
        format.js { render "shared/common",locals: {template: "companies/show"} }
      end
    elsif @clientuser && current_user.company == nil
      @usercompanymap = UserCompanyMap.find_by(user_id: current_user.id)
      @company = @usercompanymap.company
      @admin_user = User.where(company_id: @company.id).order(created_at: :DESC).first
      render :file => "public/website/dashboard/request_admin.html.erb", layout: false   
    elsif @clientuser && current_user.company.company_settings["need_old_dashboard"] == "yes"
      @company = @company_by_subdomain=(@company_by_subdomain||Company.find_by_permalink(current_user.company_names.first))
      @cycles = @company.cycles_sorted
      @cycles = Kaminari.paginate_array(@company.cycles_sorted).page(params[:page]).per(10) if @cycles.present?
      respond_to do |format|
        format.html{ render "companies/show", layout: "layouts/application"}
        format.js { render "shared/common",locals: {template: "companies/show"} }
      end
    elsif @clientuser && (current_user.company_names.count > 0) && current_user.company_names.include?(@current_subdomain||current_user.company_names.first)
      @company = @company_by_subdomain=(@company_by_subdomain||
        Company.find_by_permalink(current_user.company_names.first))
      # @entcycles = @company.enterprisecycles.order(created_at: :DESC)
      # @projects = @company.projects.order(created_at: :DESC)
      # @contests = []
      # @projects.each do |project|
      #   project.cycles.each do |cycle|
      #     @contests.push cycle
      #   end
      # end
      # @cycles=(@entcycles+@contests).sort_by(&:created_at).reverse!
      @cycles = @company.cycles_sorted

      if Rails.env.production?
        @server_name = "http://99tests.com"
      elsif Rails.env.staging?
        @server_name = "http://testfolio.in"
      else
        @server_name = "http://localhost:3000"
      end
      # @cycles = Kaminari.paginate_array(@company.cycles_sorted).page(params[:page]).per(10) if @cycles.present?
      # if @cycles.present? || @adminuser
      #   respond_to do |format|
      #     format.html{ render "companies/show", layout: "layouts/application"}
      #     format.js { render "shared/common",locals: {template: "companies/show"} }
      #   end
      #     # format.html{ render "companies/show", layout: "layouts/application" }
      #     # format.js { render "shared/common",locals: {template: "companies/show"} }
      # elsif @clientuser && @company.products.present? #&& @clientuser.signup_from == "#{@server_name}"+"/testersignup"
      #   respond_to do |format|
      #     format.html{ render "companies/show", layout: "layouts/application"}
      #     format.js { render "shared/common",locals: {template: "companies/show"} }
      #   end
      # else
      #   redirect_to testcase_path # render :file => "public/website/test-case.html.erb", :layout => false
      # end
      render :file => "public/website/dashboard/dashboard.html.erb", :layout => false
      return
    elsif @testeruser
      redirect_to overview_tester_path(current_tester)
      return
    else
      @usersubscription = Usersubscription.new
      render :file => "public/website/index.html", :layout => false
    end
  end

  def case_studies
    @casestudies = Casestudy.where(scope: ["casestudy", nil]).sort_by(&:created_at).reverse
    @onbanner = Casestudy.where(:on_banner => "yes").where(:scope => ["casestudy", nil]).last
    @firstcasestudy = @onbanner.present? ? @onbanner : Casestudy.last
    @usersubscription = Usersubscription.new
    @limitedcasestudies= Casestudy.limit(3).order("RANDOM()")
  end

  def media
    @medias = Casestudy.where(:scope => "media_link").sort_by(&:created_at)
  end

  def bugbash
    render :file => "public/website/bugbash.html", :layout => false
  end

  def get_openbug_tester_details
    ids = [14261, 6254, 10890, 4281, 5622, 14187, 13745, 15361, 1465, 5028, 15617, 7373, 785, 6960, 11514, 15832, 14723, 7389, 12240, 13336, 16918, 9359, 179194, 12135, 8541, 10715, 13336, 16918, 5733, 7371, 13740, 15424, 15836, 14086, 12516, 11186, 4622, 13065, 10334, 64, 15786, 11806, 15009, 5740, 2021, 7428, 17775, 12673, 3606, 13646, 204461, 10436, 9622, 5247, 6087, 18603, 13853, 7285, 4360, 6371, 10286, 8378, 8674, 10449, 16075, 10673, 6389, 13057, 712, 15771, 3023, 8301, 6735, 9789, 9312, 7625, 10849, 12272, 12899, 16123, 7731, 8979, 10971, 9999, 4453, 7069, 19511, 2843, 6285, 15961, 15763, 15681, 10492, 14545, 7941, 2223, 4330, 10961, 14448, 5934, 12919, 13537, 10842, 11729, 12934, 5025, 8919, 11192, 12838, 3339, 5839, 7063, 10503, 6017, 2238, 10506, 4062, 4653, 15269, 8289, 4347, 8644, 6468, 8185, 6893, 12613, 15475, 9855, 6282, 14779, 11286, 5921, 14804, 6325, 7489, 8, 14116, 6736, 6588, 6786, 110, 7391, 9856, 14031, 6651, 1005, 62, 16427, 13215, 17107, 18290, 11453, 5468, 17255, 7423, 7520, 15297, 7565, 286, 15256, 7121, 2313, 15915, 16935, 2107, 17295, 6927, 6848, 6832, 7955, 9087, 5055, 15266, 7307, 2095, 2744, 5849, 10824, 3038, 10536, 8456, 8343, 12536, 11434, 10615, 10431, 9523, 2225, 10680, 7251, 8938, 7737, 7240, 2204, 16071, 9089, 18179, 9539, 14962, 18278, 4111, 2674, 14933, 6878, 5119, 8195, 2644, 5255, 8691, 13041, 5979, 18078, 8827, 10848, 3111, 18478, 12628, 6148, 8913, 5628, 7871, 6267, 7303, 15936, 6435, 14400, 13971, 11392, 2475, 18788, 7732, 11024, 9808, 7740, 6956, 6528, 6978, 9108, 16960, 10572, 11688, 6227, 11031, 6382, 14361, 12848, 3864, 17072, 13296, 2840, 7471, 10659, 15603, 10742, 6949, 12633, 14267, 14663, 4031, 9056, 8629, 10187, 197]
    tester = Tester.where(id: ids).select('id,email,country')
    render json: tester.to_json
  end

  def get_expo_tester_details
    ids = [19424,10180,19547,13215,3714,20242,7079,21890,19969,14735,24359,18757,14847,15265,15617,14972,16328,15867,24104,16191,15297,286,2636,17295,3433,6848,24139,25109,25046,23882,2193,17716,13336,16918,16500,14627,15002,24323,7582,24909,4380,23190,19570,20693,23525,10431,2949,2225,13740,10615,5733,17888,12503,24619,15428,20334,7428,18179,24878,23879,2674,64,17823,17342,24333,22899,10334,21219,24578,20307,21463,18078,16530,19931,9460,18603,20023,13571,21499,22533,15464,893,23148,15927,10286,22534,13126,22199,20602,18478,23613,18572,15936,19656,23017,20138,10825,17599,19257,6956,23987,15771,23307,9789,23238,22757,22582,10572,11688,11031,14361,19156,12848,4330,20831,24559,23234,19586,19274,19532,21958,14545,13537,14705,12633,19571,14663,19128,23299,24481,17378,14363,21871,25098,23355,3339,592,18877,1239,11899,17721,13817,24102,20466,15269,10301,8644,2477,6468,25216,18620,7960,25107,15386,18804,23241,21882,24099,5139]
    tester = Tester.where(id: ids).select('id,email,country')
    render json: tester.to_json
  end

  def pricing
    # @cost = 'INR33,000/-'
    # if Geoip2.country(request.remote_ip).nil?
    #   @cost = 'INR33,000/-'
    # else
    #   temp = Geoip2.country(request.remote_ip)
    #   if temp.error.nil? # if error is present, then country resolution failed
    #     country = temp[:country][:names][:en]
    #     if country == "India" || country == ""
    #       @cost = 'INR33,000/-'
    #     else
    #       @cost = '$995'
    #     end
    #   end  
    # end
    render :file => "public/website/software-test-pricing.html", :layout => false
  end

  def contact
    render :file => "public/website/contact-us.html", :layout => false
  end

  def request_demo
    render :file => "public/website/requestdemo.html", :layout => false
  end

   def user_bug
    render :file => "public/website/user-bug.html", :layout => false
  end


  def how_it_works
    render :file => "public/website/how-test-automation-works.html", :layout => false
  end

  def thank_you_contact
    render :file => "public/website/thank-you-contact.html", :layout => false
  end
  def terms_of_services
    render :file => "public/website/terms-of-services.html", :layout => false
  end

  def thank_you_requestdemo
    render :file => "public/website/thank-you-request.html", :layout => false
  end
  
  def invite_team
    render :file => "public/website/invite-team.html", :layout => false
  end

  def case_studies
    render :file => "public/website/case-studies.html", :layout => false
  end

  def tester_zone
    render :file => "public/website/tester-zone.html", :layout => false
  end

  def campaign_home
    render :file => "public/website/campaigns.html", :layout => false
  end

  def thank_you_campaign
    render :file => "public/website/thank-you-campaign.html", :layout => false
  end

  def partnership
    render :file => "public/website/partnership.html", :layout => false
  end

  def dashboard
    if @clientuser && (current_user.company_names.count > 0) && current_user.company_names.include?(@current_subdomain||current_user.company_names.first)
      @company = @company_by_subdomain=(@company_by_subdomain||
        Company.find_by_permalink(current_user.company_names.first))
       @cycles = @company.cycles_sorted
    end
    puts @clientuser.email
    render :file => "public/website/dashboard/dashboard.html.erb", :layout => false
  end

  def testcase
    if params[:product_id]
      @product = Product.find(params[:product_id])
    end
    render :file => "public/website/dashboard/test-case.html.erb", :layout => false
  end

  def crowd_ci
    render :file => "public/website/crowd-ci.html", :layout => false
  end

  def champaign_crowdci
    render :file => "public/website/campaign-crowd-ci.html", :layout => false
  end

  def testcase_landing
    render :file => "public/website/test-case-landing.html", :layout => false
  end

  # def accept_invitation
    
  # end

  def onboarding
    render :file => "public/website/bug_bash.html", :layout => false
  end

  def more_testing_service
    render :file => "public/website/more-testing-service.html", :layout => false
  end

  def getcounts
    totaltesters = Tester.all.count
    totalbugs = Enterprisebug.all.count + Bug.all.count
    totalcompanies = Enterprisecycle.all.pluck(:company_id).uniq.count

    render :json =>  {:totaltesters => totaltesters, :totalbugs => totalbugs, :totalcompanies => totalcompanies}, status: 200 
  end


  private

  def check_for_login
    if user_signed_in? && request.subdomains.count==0
      redirect_to company_path(request.subdomains.count > 0 ? (request.subdomains.first) : (current_user.colleagues.first))
    elsif tester_signed_in? && !['api','blog','help','support','events'].include?(request.subdomains.first)
      redirect_to overview_tester_path(current_tester)
      return
    end
  end

end
