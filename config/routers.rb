Por::Application.routes.draw do

  resources :enterprisecycle_purchases do
    get  :express, on: :collection
    # post  :express_complete, on: :collection
    get  :complete, on: :collection
  end




  post "enterprisecycle_purchases/express_complete" => "enterprisecycle_purchases#express_complete"
    get 'enterprisecycle_purchases/pay_session' => "enterprisecycle_purchases#pay_session"
    %w(express complete).each do |action|
      get "enterprisecycle_purchases/#{action}" => "enterprisecycle_purchases##{action}"
  end

  resources :sows
  resources :resources
  resources :faq_databases, except: [:index] do
    post :search_faq, :on => :collection
    post :faq_type, :on => :collection
    post :create_faq_type, :on => :collection
    post :find_faqs, :on => :collection
    post :delete_faqs_type, :on => :collection
  end

  post "devicetypebrands/dynamic_create"
  post "devicebrandversions/dynamiccreate"


  get  'enterprisecases/gettestcases'                           => 'enterprisecases#gettestcases'
  post 'enterprisecases/delete_testcases'                       => 'enterprisecases#delete_testcases'
  post 'enterprisecases/attach_cases_to_cycle'                  => 'enterprisecases#attach_cases_to_cycle'

  

  get "faq-databases", :to => "faq_databases#index"
  get "/testers/sign_out",:to => "testers#sign_out"
  get "admin/index"
  ## For RobotTXt
  get '/robots.txt' => RobotsTxt
  # get "iframe-test",to: "static#iframe_test"
  get "faq", :to => "home#faq"
  get "dosanddonts", :to => "home#dosanddonts"
  get "validatorsdosanddonts", :to => "home#validatorsdosanddonts"
  get "openbugdosanddonts", :to => "home#openbugdosanddonts"
  get "tester/hall-of-fame", :to => "home#halloffame"
  get "tester/toppers", :to => "home#toppers"
  get "tester/skilled", :to => "home#skilled"
  get "tester/functional-bug-leader", :to => "home#functionalleader"
  get "tester/ui-bug-leader", :to => "home#uileader"
  get "tester/active-testers", :to => "home#activetesters"
  get "importcontacts", :to => "home#importcontacts"
  get "importfailure", :to => "home#importfailure"
  get "admin/tester-analysis-and-actions", :to => "admin#tester_analysis_actions"
  get "admin/email_participants_cycle_type"
  get "admin/find_tester_email"
  get "admin/find_testers"
  get "admin/show_active_cycles"
  post "admin/process_survey_data"
  get "admin/invite_to_cycle"
  get "admin/send_invite"
  # get "admin/faq_onboarding"
  post "admin/surveyaction"
  post "admin/toptesterscsv"
  post "admin/lmstesterscsv"
  ## GSM Arena Import
  post 'admin/import_devices', to: "admin#import_devices"
  ## 406 ##
  # get 'testers/:id/search',to: redirect {|p, req| "/"}
  ##
  ## New Request
  post "saas_requirement", :to => "static#new_saas_requirement"
  post "saas_invite", :to => "static#new_saas_invite"
  ## New Form Request ##
  post 'new_device_request', :to => "devices#new_device_request"

  ## New Pricing Page
  post "new_pricing_page", :to => "static#new_pricing_page"

  ## Faq Database
  post "search_faq", :to => "static#search_faq",:as=>"search_faq"

  ##Delete Account ##
  post "admin/delete_tester"
  post "admin/delete_user"
  ## END ##
  ## Tester Reservation ##
  post "admin/reserve_tester"
  ## end ##
  get "admin/launch_contest"
  get "admin/total_testers_payment"
  post "admin/submit_launch_contest"
  post "admin/submit_toptester_email"
  get "admin/close_contest"
  get "admin/set_alert"
  get "admin/aarrr"
  get "admin/show_demo_request_list"
  get "admin/demo_list" 
  ##Tester Data##
  get "admin/invite_mebmer"
  get "admin/invitemember"
  get "admin/grader_usage"
  post "admin/grader_batchurl"
  post "admin/grader_csvdownload"
  get "admin/allgraderurls"
  post "admin/invitemember"
  get "admin/tester_resume"
  get "admin/tester_data"
  get "admin/adminpanel"
  get "admin/bugutility"
  get "admin/leadmanagement"
  post "admin/select_country"
  post "admin/bugutility"
  get "admin/add_gen_filter"
  get "admin/remove_gen_filter"
  get "admin/download_tester_data_csv"
  ##Data Extracts
  get "admin/dataextracts"
  ###
  ## Failed Task ##
  get "admin/failed_tasks"
  ## end ##
  get "admin/activetesters"
  post "admin/submit_alert"
  post "admin/submit_close_contest"
  post "admin/update_tester_payment"
  post "admin/update_tester_challenge_payment"
  post "admin/update_tester_payperbug_payment"
  post "admin/update_intentationaltester_payment"
  post "admin/update_bank_details"
  post "admin/validate_and_resolve_bugs"
  post "admin/testerpaymentdetails"
  post "admin/update_individual_tester_payment"
  post "admin/update_tester_validator"
  post "admin/update_faq_database"
  get "admin/searchexcel"
  post "admin/faq_form",:to=>"admin#faq_form"
  post "admin/delete_faq_database/:id",:to=>"admin#delete_faq_database",:as=>"admin_delete_faq_database"
  get "admin/companies"
  get "admin/allow_limit_to_cycle_creation"
  get "admin/update_cycle_limit_to_company"
  get "admin/companydata"
  get "admin/weekly_mail"
  get "admin/testertimezone"
  get "ptags/get_tags"
  get "opentags/get_opentags"
  post "opentags/update_needlogin"
  get "testing_promos/get_promovalue"
  get "testing_promos/get_challengepromovalue"
  get "testing_promos/get_payperbugpromovalue"
  get "testing_promos/get_enterprisecyclepromovalue"
  get "testertags/get_testertags"
  post "alerts/viewed"
  get "admin/contests/testers_email", :to => "contests#testers_email", :as => "testers_email"
  get "admin/contests"
  get "admin/challenges"
  get "admin/payperbugs"
  get "admin/explores"
  get "admin/enterprisecycles"
  get "admin/testers_payment"
  get "admin/international_tester_payment"
  get "admin/update_tester_paid"
  get "admin/national_tester_payment"
  get "admin/pendingresults"
  get "admin/testerdevices"
  get "admin/testerdevicescsv"
  ## DList
  get "admin/topdeviceslist"
  post "admin/topdeviceslist"
  ##
  get "admin/activetesterdevicescsv"
  get "admin/client_details"
  get "admin/csv_national_tester_payment"
  get "admin/csv_national_tester_payment_99tests"
  get "admin/csv_national_tester_payment_preenos"
  get "ads/adstats"
  get "openbugs/activity"
  get "openbugs/rewards"
  get "openbugs/leaderboard"
  get "openbugs/validatorleaderboard"
  get "openbugs/winners"
  get "openbugs/top"
  get "openbugs/openbug_bug"
  get "tags", :to => "testertags#tags"
  get "linkshares", :to => "linkshares#index"
  # get "software-crowd-testing-blogs", :to => "blogs#index"
  get '/blog' => redirect("https://99tests.com/blog/")

  # get "tester-hub", :to => "tester_hubs#index"
  # Code By: Dimo#
  # For : Sync Server Connection #
  post 'ping' => 'pingpong#ping'
  # get 'ping/:id' => 'pingpong#lowercaseemails'
  # get 'ping' => 'pingpong#verified'
  #### End ####
  # get "home", :to => "marketing#home"
  # get "new_home", :to => "static#new_home"
  #Subscription home page
  # get 'subscription-customer',to: "static#subscription_home_page"
  get 'clone-model', to: 'static#clone_model'
  get 'company-intro',to: "static#company_intro"
  get 'landing-page',to: "static#landing_page"

  ##New Pricing page
  # get "newpricing", :to => "static#newpricing"

  ##Add skill page
  resources :specializations do
     # get "add_skill", :on => :member
     get "specialization_delete", :on => :member
  end

  # Attributes
  resources :globalattributes, except: [:new, :show]

  # Domains
  resources :domains, except: [:new, :show] do
    post "change_domain", on: :collection
  end

  # get "projects", :to => "static#projects"

  # get "software-test-pricing", :to => "static#pricing"
  # get "customers", :to => "static#customers"
  get "case-studies", :to => "static#casestudy"
  post "case-studies", :to => "static#casestudy"
  post "usersubscription", :to => "static#usersubscription"
  get "storyexpand", :to => "static#storyexpand"
  get "companyaccount", :to => "static#companyaccount"
  get "community", :to => "static#community"
  # get "contact-us", :to => "static#contact"
  ##New about-us page
  get "about-us", :to => "static#about"
  get "terms-of-service", :to => "static#tos"
  get "careers", :to => "static#careers"
  get "designer", :to => "static#designer"
  get "privacy-policy", :to => "static#pripol"
  get "load-testing", :to => "static#load"
  get "testing-courses",:to => "static#courses"
  get "signup", :to => "static#signuphomepage"
  get "testersignup", :to => "static#testersignuphomepage"
  get "testcasesignup", :to => "static#testersignuphomepage"
  get "signin", :to => "static#signinhomepage"
  get "demo", :to => "static#demo"
  get "requestdemo", :to => "static#requestdemo"
  post "requestdemo", :to => "static#requestdemo"
  get "active-test-cycle", :to => "static#activecycle"
  get "dailystatus", :to => "static#dailystatus"
  get "explore-it", :to => "static#activeexplores"
  # get "grade_calculation", :to => "static#grade_calculation"
  # get "client-pricing", :to => "static#clientpricing"
  # get "email", :to => "static#email"
  get "select-plan", :to => "static#selectplan"
  post "static/createaccounthomepage"
  post "static/contact-crowd-testing", :to => "static#contactmessage"
  post 'static/model-name', to: 'static#modelname'
  post 'static/clone-model-main', to: 'static#clone_model_main'
  post "testerinfo-crowd-testing", :to => "static#testerinfo"
  post "clientinfo-crowd-testing", :to => "static#clientinfo"
  post "getpricing", :to => "static#getpricing"
  post "static/sessionvar"
  get '/sitemap1.xml.gz' => 'sitemaps#show'




  resources :tester_hubs, :only => :destroy
  get "tester-hub", :to => "tester_hubs#index"
  get "tester-hub/articles", :to => "tester_hubs#articles"
  get "tester-hub/videos", :to => "tester_hubs#videos"
  get "tester-hub/interviews", :to => "tester_hubs#interviews"
  get "tester-hub/books", :to => "tester_hubs#books"
  get "tester-hub/testingtips", :to => "tester_hubs#testingtips"
  get "tester-hub/voices", :to => "tester_hubs#testersvoice"

  #Sync Form Data
  resources :sync_server_informations

  # Recruitment
  resources :recruitments,:path => "upcoming-projects",only: [:index,:show] do
    get 'comment',on: :member
    post 'comment',on: :member
  end
  resources :tester_hubs
  resources :tester_hub_votes do
     post 'vote', :on => :member
     post 'vote_update', :on => :member
     post 'spam', :on => :member
  end

  %w(index express express_complete complete).each do |action|
    get "purchase/#{action}" => "purchase##{action}"
  end
  resources :casestudies do
    get 'email_popup',:on=>:member
    get 'thankyou'
  end
  resources :casestudy_users
  resources :questions do
    post 'toggle_follow', :on => :member
    post 'toggle_vote', :on => :member
    post 'comment', :on => :member
    post 'toggle_best_answer', :on => :member
    post 'dup', :on => :collection
    resources :answers do
      post 'toggle_vote', :on => :member
      post 'comment', :on => :member
    end
  end

  resources :answers
  resources :comments do
    post 'vote', :on => :member
    post 'vote_update', :on => :member
    post 'review_feedback', :on => :member
    post 'disable_status', :on => :member
    post 'toggle_vote', :on => :member
  end
  
  resources :testapps do        
    resources :testappcomponents 
    get "faq_testapps", :on=>:collection
    get "signupvote", :on => :collection
    get "upvote", :on => :collection
    post "show_testapps", :on => :collection
    post "show_testapps", :on => :member    
    post "current_testapps"
    post "get_testapp_bugs"
    get 'launch', on: :member
    post 'launch', on: :member
    post 'transfer', on: :member
    post 'declarevalidatorwinners', on: :member
  end
  get '/bugathon/:permalink/:serial_number', to:'testapps#show', as: 'show_testapp_openbugs'
  get '/bugathon/:permalink/:serial_number/leaderboard', to: 'testapps#leaderboard', as: 'testapp_single_leaderboard'
  get '/bugathon/:permalink/:serial_number/validatorleaderboard', to: 'testapps#validatorleaderboard', as: 'testapp_single_validatorleaderboard'
  get '/bugathon/:permalink/:serial_number/validatorwinners', to: 'testapps#validatorwinners', as: 'testapp_single_validatorwinners'
  get '/admin/testapps', to: 'testapps#admin', as: 'testapps_admin'

  resources :openbugcomments do
    post 'vote', :on => :member
    post 'vote_update', :on => :member
    post 'review_feedback', :on => :member
    post 'disable_status', :on => :member
    post 'vote_remove', :on => :member
    post 'dispute_resolve',on: :member
  end

  resources :openbugcommentvotes do
    post 'vote', :on => :member
    post 'vote_update', :on => :member
  end

  resources :openbugscores do
    post 'mark', :on => :member
    post 'mark_update', :on => :member
    post 'sendtofriend', :on => :member
  end

  resources :bugscores do
    post 'mark', :on => :member
    post 'mark_update', :on => :member
  end

  get "/contests/" => "contests#index", :as => "contests"

  resources :projects, path: 'test-project' do
    post 'dup', :on => :member
    post 'create_cycle', :on => :member
    post 'pricing', :on => :member
    get 'contestdetails', :on => :member
    get 'launch', :on => :member
    resources :casemanagers do
      resources :cases
    end
    resources :cycles do
      post 'player', :on => :member
      post 'destroyplayer', :on => :member
      post 'close', :on => :member
      post 'validator', :on => :member
      post 'contestwinners', :on => :member
      post 'changebugstatus', :on => :member
      post 'submit_updatelaunchcontest', :on => :member
      get 'csv', :on => :member
      get 'show', :on => :member
      get 'leaderboard', :on => :member
      get 'validatorleaderboard', :on => :member
      get 'winners', :on => :member
      get 'activity', :on => :member
      get 'regressionbugs', :on => :member
      get 'topbugs', :one => :member
      get 'validatedbugs', :on => :member
      get 'awardsemail', :on => :member
      get 'download_reports', :on => :member
      get 'csv', :on => :member
      get 'customcsv', :on => :member
      resources :caseresults do
        post 'comment', :on => :member
      end
      resources :bugs do
        post 'valid', :on => :member
        post 'invalid', :on => :member
        post 'clear_rating', :on => :member
      end
      resources :productfeedbacks
      resource :stats, :only => :show
      resource :contest_members, :only => :show
      resource :report, :only => :show
      resource :invite_user, :only => [:new, :create]
      resource :requirement, :only => [:show]
      resources :demo
    end
  end


  ### TestCase Map ###
  resources :test_case_maps,path: 'test-case-map' do
    post "new"
  end
  ###

  ### Bug Map ###
  resources :enterprise_bug_maps,path: 'enterprise-bug-map' do
    post "new"
  end

  resources :enterprisecycles, path: 'enterprise-test-cycle' do
    resources :enterprisecyclecomponents do
      post 'component_assignment', on: :member
      post :starttestcasewriting, on: :member
      post :stoptestcasewriting, on: :member
    end
    resources :acccells do
      post :starttestcasewriting, on: :member
      post :stoptestcasewriting, on: :member
      post :importcasesteps, on: :member
      post 'update_cell', on: :member
      post 'acc_assignment', on: :member
      post 'bugs', on: :member
      post 'testcases', on: :member
      post 'acccell_data', on: :member
      resources :enterprisecasewriters do
        post 'stop_testcase_writing', on: :collection
        post 'finish_testcase_writing', on: :collection
      end
    end
    get 'purchase', on: :member
    get 'mycases', on: :member
    get 'cancelpromo', on: :member
    get 'cycletype', on: :member
    get 'projectbrief', on: :member
    get 'setting', on: :member
    get 'application_under_test', on: :member, path: "application-under-test"
    get 'cycledevice', on: :member
    get 'review', on: :member
    get 'admin', on: :member
    get 'strategy', on: :member
    get 'device', on: :member
    get 'acc', on: :member
    post 'edit_acc', on: :member
    post 'get_attributes', on: :member
    get 'testcaseparticipation', on: :member
    get 'testcasemastersheet_mapping', on: :member
    get 'tcplatparticipation',on: :member
    post 'transfer_to_tcms', on: :member
    get 'automation_config', on: :member, path: 'automation-config'
    post 'edit_config', on: :member, path: 'edit-config'
    get 'download_config', on: :member, path: 'download-config'

    ## Test case
    get 'validation_result',on: :member
    ## Button to update bug points
    post 'launchpageforadmin', :on => :member
    get 'update_bug_points',on: :member
    ##
    ### Usabilities
    get 'allusabilitycsv', :on => :member
    get 'allusability', :on => :member
    resources :usabilities do
      get 'allusabilityresponsecsv', :on => :member
      get 'allusabilityfieldcsv', :on => :member
      get 'uresponseoverview', :on => :member
      get 'uassign', :on => :member
      get 'clone', :on => :member
      post 'assignutesters', :on => :member
      post 'unassignutester', :on => :member
      # post "addresponse", :on => :member
      resources :usability_fields
      resources :usability_responses do
        post :votes, on: :member
      end
    end

    get 'clone',on: :member,action: :clone_preview
    post 'clone',on: :member,action: :clone_cycle
    ## Add Components
    post :add_update_component,on: :member
    post :add_product,on: :member
    post :add_product_component, on: :member
     post :add_global_attributes, on: :member
    post :remove_component, :on => :member
    get 'get_company_products', on: :member
    get 'testercases', on: :member
    ## Reserver ##
    post 'reserve_tester',on: :member
    get 'admin_edit',on: :member
    get 'admin_view',on: :member
    get 'admin_history',on: :member
    post 'reserve_validator',on: :member
    ## END ##
    ## For Download Report ##
    get 'bug_data',on: :member
    ## end ##
    # get 'sync_all_bugs',on: :member
    post 'validator', :on => :member
    post 'player', :on => :member
    put 'extra_points', :on => :member
    patch 'updatedevice', :on => :member
    post 'updatedeviceusecase', :on => :member
    post 'launchlink', :on => :member
    post 'start_cycle', :on => :member
    post 'destroymember', :on => :member
    post 'declarewinners', :on => :member
    post 'resendwinnersemail', :on => :member
    post 'changebugstatus', :on => :member

    post 'show_interest', :on => :member
    patch 'component', :on => :member
    post 'platform', :on => :member
    post 'testcase', :on => :member
    post 'usability', :on => :member
    post 'adminlaunch', :on => :member
    post 'clientlaunch', :on => :member
    post 'update_cardtype', :on => :member
    post 'allowtesterswaiting', :on => :member
    post 'allowinterestedtesters', :on => :member
    post 'confirmvalidatorset', :on => :member
    post 'update_cycle_status', :on => :member
    post 'addplatform', :on => :member
    post 'addwatchers', :on => :member
    post 'disallowparticipant', :on => :member
    post 'savefeedback', :on => :member
    get 'feedback', :on => :member
    get 'componentsplat', :on => :member

    get 'launch', :on => :member
    get 'search', :on => :member
    post 'filtertesters', :on => :member
    post 'filtercycletesters', :on => :member
    post 'mailtesters', :on => :member
    get 'crowd_mgmt', :on => :member
    get 'invite_testers', :on => :member
    get 'user_communication', :on => :member
    get 'uploadtcnext', :on => :member
    get 'requirement',  :on => :member
    get 'metrics',  :on => :member
    get 'metrics_for_chart_admin',  :on => :member
    get 'coverage',  :on => :member
    get 'activity', :on => :member
    get 'leaderboard', :on => :member
    get 'validatorleaderboard', :on => :member
    get 'knownissues', :on => :member
    post 'knownissues', on: :member
    get 'caseresults', :on => :member
    get 'validatedbugs', :on => :member
    get 'winners', :on => :member
    get 'csv', :on => :member
    get 'all_bugs', on: :member
    get 'ppb_payment_report', on: :member
    get 'valid_testcase_bugs', on: :member
    get 'all_testcase_bugs', on: :member
    get 'testcase_report', :on => :member
    get 'customcsv', :on => :member
    get 'paymentreport', :on => :member
    get 'testerdetails', :on => :member
    get 'download_reports', :on => :member
    ### Bug import from file ###
    get 'import_bugs', :on => :member
    post 'upload_bugs', :on => :member
    resources :bdds, path: "workflows" do
      post :add_script, on: :member
      post :add_scenario, on: :member
      post :add_workflow, on: :collection
      post :push_to_master, on: :member
      post :sync_master, on: :member
      post :bddassign, on: :member
      post :unassignbdd, on: :member
      post :bddassignscript, on: :member
      post :unassignbddscript, on: :member
      post :startscript, on: :member
      post :stopscript, on: :member
      post :startscenario, on: :member
      post :stopscenario, on: :member
      post :scenario_data, on: :member
      resources :scenarios do
        post :add_testcase, on: :member
        get :filtered_testcases, on: :member
        post :update_testcase, on: :member
        post :remove_testcase, on: :member
      end
    end
    resources :scripts do
      get 'show_folder', on: :collection
      post 'upload_file', on: :collection
      post 'delete_file', on: :collection
      post 'new_folder', on: :collection
    end
    ###Testrun
    resources :testruns do
      get 'show_result/:request_id', to: 'testruns#show_result', as: 'show_result', on: :collection
    end
    resources :feedback, :only => [:index] do
    end
    resources :enterprise_bug_maps,path: 'enterprise-bug-map' do
    end
    ### ###
    ### CSV import ###
    get 'import_testcase', :on => :member
    post 'upload_testcase', :on => :member
    resources :test_case_maps,path: 'test-case-map' do
    end
    ### ###
    get 'testcasecsv', :on => :member #For CSV
    get 'testcasexml', :on => :member #For XML
    get 'mantistestcasexml', :on => :member #For MantisXML
    get 'mantistestcasecsv', :on => :member #For MantisCSV

    get 'sync', :on => :member #For Sync
    get 'show_sync', :on => :member #For SyncView

    get 'attachments_bulkdownload', :on => :member
    get 'bugattachlinkcsv', :on => :member
    get 'resultattachlinkcsv', :on => :member
    get 'exportbug', :on => :member
    get 'allowtesters', :on => :member
    get 'report', :on => :member
    get 'caseresultcsv', :on => :member
    get 'allcaserresultcsv', on: :member
    get 'download_report', :on => :member
    get 'download_testcase', :on => :member
    ### Executed Testcase ###
    get 'download_executed_testcase', :on => :member
    ### end ###
    get 'regressionbugs', to: 'enterpriseregressionbugs#regressionbugs'
    get 'regressionbugs/:id', to: 'enterpriseregressionbugs#showregressionbug'
    resources :enterprisebugs, path: 'bugs' do
      post 'remove_attachment', :on => :member
      post 'indivbugstatus', :on => :member
      post 'assignbug', :on => :member
      get 'knownissue_show', on: :member
    end
    # resources :enterprisecaseplatforms, path: "enterprisecaseplatforms" do
    #   member {
    #     get "testcase_info"
    #     get 'tcassign'
    #     post 'assigtctester'
    #     post 'unassigntctester'
    #   }
    #   collection{
    #     get "update_device_coverage"
    #     get "update_device_coverage_spec"
    #   }
    # end
    resources :enterpriseusability do
      # post "addresponse", :on => :member
      resources :usabilityfield
      resources :usabilityresponse do
        post "votes", on: :member
      end

    end


    resources :enterprisecases, path: 'testcases' do
      collection { post :mappingcases    }
      collection { post :createtestcases }
      # collection { get  :gettestcases    } 
      get 'casetesterform', :on => :member
      get 'editcase',:on => :member
      get 'restarttc', :on => :member
      # get 'gettestcases', :on => :member
      # 
      # post 'createtestcases', :on => :member
      collection { get :csv }
      collection { post :importcases }
      get 'casesteps', :on => :member
      get 'copysteps', :on => :member
      post 'copy_testcase', :on => :member
      get 'casestepdetails', :on => :member
      get 'testcase_info', :on => :member
      get 'oldshow', :on => :member
      get 'restarttc', :on => :member
      post 'get_attributes', on: :member
      post 'get_acc_testcase', on: :member
      post 'get_component_testcase', on: :member
      get 'add_testcase', on: :collection
      post 'automation_true', on: :member
      post 'automation_false', on: :member
      post 'pust_to_master_sheet', on: :member
      post :startscript, on: :member
      post :stopscript, on: :member
      post :importcasesteps, on: :member
      resources :scripts
      resources :enterprisecaseresults, path: 'testcaseresults' do
        get 'cancel', :on=> :member
      end
      resources :enterprisecasetesters do
        post :validationmarked, :on => :member
        post :stop_testcase, :on => :member
      end
    end
    resources :enterprisecycle_extrafields, :only => :destroy
    resources :enterpriseworkingflows, path: 'workingflows'
    resources :enterprisecycledevices do
      member {
        get "testcase_info"
        get 'tcassign'
        get 'devicedetail'
        post 'assigtctester'
        post 'tagdetails'
        post 'unassigntctester'
      }
      collection{
        get :adddevice
        get "update_device_coverage"
        get "update_device_coverage_spec"
      }
      resources :enterprisecycledevicebrowsers
    end
    resources :enterprisecyclealerts, path: 'alerts' do
      collection { get :discussion }
    end
  end

  resources :enterprisebugcomments do
    post 'vote', :on => :member
    post 'vote_update', :on => :member
    post 'review_feedback', :on => :member
    post 'disable_status', :on => :member
    post 'vote_remove', :on => :member
  end

  resources :enterprisebugcommentvotes do
    post 'vote', :on => :member
    post 'vote_update', :on => :member
  end

  resources :openbugs,except: [:destroy] do
    collection { post :attachmentupload }
    member{
      get 'testapp_hint'
      post 'declareopenbugwinners'
      post 'validator'
      get 'validator'
      get 'exportbug'
      get 'openbug_bug'
    }
    resources :openbugcomments do

    end
  end
  get '/openbugs/:id/:title', :to=> "openbugs#show", :via => "get", :as => "openbug_with_title"
  get 'bugathon/:permalink/:serial_number/:id/:title', to: "openbugs#show", via: "get", as: "openbug_with_testapp"

  resources :cases
  resources :votes
  resources :caseresults
  devise_for :users, :controllers => {:registrations => "registrations",
                                      :passwords => "custom_password",
                                      :sessions => "custom_session",
                                      :confirmations=> 'confirmations'
                                      }
  devise_for :testers, :controllers => {:registrations => "registrations",
                                      :passwords => "custom_password",
                                      :sessions => "custom_session",
                                      :confirmations=> 'confirmations',
                                      :unlocks=>'unlocks'
                                      },path: '/'
  get 'auth/:token/authenticate_token' => 'userauthentications#authenticate_token'
  get 'auth/:provider/callback' => 'userauthentications#create'
  resources :userauthentications, only: [:create, :destroy, :index]
  get 'userauthentications/authentication' => 'userauthentications#authentication'
  get 'userauthentications/authenticationtester' => 'userauthentications#authenticationtester'
  post "userauthentications/createaccount"
  post "userauthentications/createtesteraccount"

  get 'stacklead/leads' => 'leads#stacklead'

  get '/sign_out',:to => "testers#sign_out"
  resources :testers,except: [:delete,:destroy] do
    get 'sign_out'
    ## Deactivation and Reactivation
    post 'account_deactivation_request', on: :collection
    get 'activate_account', on: :collection
    ###
    post 'neo_device', on: :collection
    post 'check_device', on: :collection
    get 'overview', :on => :member
    get 'profile', :on => :member
    get 'dashboard', :on => :member
    #Tester dashboard fragmentation#
    # member{
    #   get 'dashboard_overview'
    #   get 'dashboard_new_tester'
    # }
    collection{
      get 'dashboard_overview'
      get 'dashboard_new_tester'
    }
    #end#
    get 'mytestcycles', :on => :member
    get 'contests', :on => :member
    get 'challenges', :on => :member
    get 'payperbugs', :on => :member
    get 'validationcontests', :on => :member
    get 'validationchallenges', :on => :member
    get 'validationpayperbugs', :on => :member
    get 'xyz_show', :on => :member
    get 'followingupdates', :on => :member
    get 'skillanalysis', :on => :member
    get 'change_password', :on => :member
    ### Change Email ###
    get 'change_email', :on => :member
    ###
    get 'payment_info',:on=>:member
    get 'device', :on =>:member
    get 'notifications',:on => :member
    get 'skills', :on => :member
    get 'tags', :on => :member
    get 'bugs', :on => :member
    get 'openbugs', :on => :member
    get 'credits', :on => :member
    get 'bookmarks', :on => :member
    get 'help', :on => :member
    get 'notifications', :on => :member
    get 'following', :on => :member
    get 'followers', :on => :member
    get 'messages', :on => :member
    get 'search', :on => :member
    get 'mymessages', :on => :member
    get 'messagedisplay', :on => :member
    get 'myrecommendations', :on => :member
    get 'recommenddisplay', :on => :member
    get 'wall', :on => :member
    get 'jobprofile', :on => :member
    get 'device', :on => :member
    get 'jobposts', :on => :member
    get 'welcome', :on => :member
    get 'welcomeskills', :on => :member
    get 'welcomedevice', :on => :member
    get 'welcomeinvite', :on => :member
    get 'welcomeopenbug', :on => :member
    get 'recommendations', :on => :member
    get 'importandinvite', :on => :member
    get 'importcontacts', :on => :member
    get 'importfailure', :on => :member
    get 'activity', :on => :member
    get 'received', :on => :member
    get 'given', :on => :member
    get 'accept_recommendation', on: :member
    ### Change Email ###
    post 'update_email', on: :member
    ###
    post 'notification_submit', :on => :member
    post 'bugstype', :on => :member
    get 'bugstype', :on => :member
    post 'profileupload', :on => :member
    collection { post :missingbrand }
  end
  get '/testers/:id/:display_name', :to=> "testers#show", :via => "get", :as => "tester_with_display_name"

  resources :relationships, only: [:create, :destroy]
  resources :messages, only: [:create, :destroy]
  put "message", :to => "messages#create"
  resources :walls, only: [:create, :destroy]
  resources :profileviews, only: [:create, :destroy]
  resources :invitations
  post "invitations/sendinvites"
  resources :ads, only: [:create]
  resources :opentags,except: [:new,:create,:edit,:delete]
  # resources :opentags, :path => '', :only => [:show, :edit]
  resources :ptags
  resources :recommendations do
   post 'accept', :on => :member
   post 'edit',:on => :member
   post 'destroy', :on=>:member
  end
  resources :testertags
  get '/tags/:id/:name', :to=> "testertags#show", :via => "get", :as => "testertag_with_name"
  resources :taggeds
  ## Planner
  resources :planners do
    member{
      post '/',action: :update
    }
  end
  resources :companies do
    get 'planner', on: :collection
    get 'company_products', on: :member, path: "company-products"
    get 'cycle_filter',on: :member
    get 'admin', on: :member
    post 'adminlaunch', :on => :member
    resources :products do
      resources :productcomponents
      resources :master_bdds do
        post :copy_to_cycle, on: :member
        post :sync_cycle_workflow, on: :member
        get :choose_cycle_modal, on: :member
        post :master_bdd_form, on: :collection
        post :master_bdd_edit_form, on: :member
        resources :master_scenarios
      end
    end

    resources :users do
      get 'set_password',on: :collection
      post 'set_password',on: :collection
    end
    get 'tcms', :on => :member
    get 'performance', on: :collection
    get 'usability', on: :collection
    get 'dummy_dashboard', :on => :member
    get 'companysetup', :on => :member
    get 'applicationsetup', :on => :member
    get 'subscription', :on => :member
    get 'demo', :on => :member
    get 'pause_settings', :on => :member
    get 'mytestcycles', :on => :member
    get 'contests', :on => :member
    get 'challenges', :on => :member
    get 'payperbugs', :on => :member
    get 'enterprisecycles', :on => :member
    get 'jobposts', :on => :member
    get 'ads', :on => :member
    get 'adstats', :on => :member
    get 'credits', :on => :member
    get 'invite_teammember', :on => :member
    get 'invite_teammember', :on => :collection
    post 'invitemember', :on => :member
    post 'clone_testcase', :on => :member
    get 'component', :on => :member
    get 'grader', :on => :collection
    get 'grader_pdf', :on => :collection, format: 'pdf'
    get 'planner', :on => :collection
    get 'planner', :on => :member
    get 'grade_calculation', on: :collection
    post 'search', on: :collection
    # get 'show', :on => :member
  end
  get 'appgrader', to: 'companies#grader'
  post 'grade_calculation', to: 'companies#grade_calculation', as: 'grade_calculation'
  get '/grade/*siteurl', to: 'companies#grade_display', as: 'grade_display'
  get 'show', to: 'companies#show'
  resources :faq do
    get 'skillanalysis', :on => :member
    get 'dashboard', :on => :member
  end

  resources :joblists do
    get 'apply', :on => :member
    get 'jobapplications', :on => :member
  end
  get '/joblists/:id/:company/:location/:jobtype/:title', :to=> "joblists#show", :via => "get", :as => "joblist_with_title"
  resources :jobapplications, only: [:create]
  resources :jobprofiles, only: [:create, :edit, :update]
  resources :tester_devices, only: [:create, :edit, :update]
  resources :users do
    ### Change Email ###
    # patch '', on: :member
    get 'change_email', :on => :member
    # get 'faq-onboarding', :on => :collection
    post 'update_email', on: :member
    ###
    ## Deactivation and Reactivation
    post 'account_deactivation_request', on: :collection
    get 'activate_account', on: :collection
    ###
  end
  resources :bugs

  resources :notifications do
    post 'viewupdate', :on => :member
    post 'generalviewupdate', :on => :member

    post 'markmessages', :on => :member
    get 'markmessages', :on => :member

    post 'new_markmessages', :on => :member
    get 'new_markmessages', :on => :member

    post 'marknotifications', :on => :member
    get 'marknotifications', :on => :member

    post 'new_marknotifications', :on => :member
    get 'new_marknotifications', :on => :member

    get 'ajax_notification', :on => :collection
    get 'message_notifications', :on => :collection
  end

  resources :products do
    resources :platforms
  end

  resources :devices do
    collection { get :types }
    collection { get :browsers }
    collection { get :brands }
    collection { get :deviceos }
    collection { get :deviceosversion }
    collection { get :devicebrowsers }
    collection { get :devicebrands }
    collection { get :browserversions }
    collection { get :brandversions }
    collection { get :testers }
    collection { get :testerdevicescsv}
    resources :devicetypes do
      resources :devicetypeosversions
      resources :devicetypebrowsers do
        resources :devicebrowserversions
      end
      resources :devicetypebrands do
        resources :devicebrandversions
      end
    end
  end

  resources :testerdevices do
    collection { get :adddevice }
    get :devicedetail, :on => :member
    post :tagdetails, :on => :member
    resources :testerdevicebrowsers
  end

  # get 'blogs/delete'
  # resources :blogs do
  #   get "blogcommentsinfo", :on => :collection
  #   resources :blogcomments, only: [:create]
  # end

  resources :testing_promos
  resources :contacts
  resources :blockedtesters
  resources :linkshares, except: [:show]
  resources :linksharevotes do
     post 'vote', :on => :member
     post 'vote_update', :on => :member
  end
  get "/contacts/gmail/callback" => "testers#importcontacts"
  get "/contacts/yahoo/callback" => "testers#importcontacts"
  get "/contacts/hotmail/callback" => "testers#importcontacts"
  get "/contacts/facebook/callback" => "testers#importcontacts"
  get "/contacts/failure" => "testers#importfailure"
  get "/chat" => "chat#chat", as: "chat"
  root :to => "marketing#home"
  get "/dashboard" => "marketing#dashboard"
  get "/exploratory-functional-testing" => "marketing#bugbash"
  get "/test-case-management-tool" => "marketing#testcase_landing"
  get "/more-testing-service" => "marketing#more_testing_service"
  get "/continuous-crowd-testing" => "marketing#crowd_ci"
  get "/LP-adv-crowdCI" => "marketing#champaign_crowdci"
  get "/get_openbug_tester_details" => "marketing#get_openbug_tester_details"
  get "/get_expo_tester_details" => "marketing#get_expo_tester_details"
  get "/getcounts" => "marketing#getcounts"

  namespace :api do
    # APIs for automation
    namespace :v2 do
      resources :sessions
    end

    namespace :v3 do
       post 'authenticate', to: 'authentication#authenticate'
    end
    namespace :v1  do
      namespace :slack do
        resources :authorization
      end
      resources :products do
        resources :enterprisecycles, controller: 'productenterprisecycles'
        get  "/checktestcases"               => "products#checktestcases"
        get  "/get_all_components_tags"      => "productcomponents#get_all_components_tags"
        get  "/get_product_testcases"        => "productcomponenttestcases#get_product_testcases"
        post "/create_testcase_from_excel"   => "productcomponenttestcases#create_testcase_from_excel"        
        resources :components, controller: 'productcomponents' do

          resources :testcases, controller: 'productcomponenttestcases' do
            # post '/create_testcase'   => "productcomponenttestcases#create_testcase"
            # get '/get_testcases'      => "productcomponenttestcases#get_testcases"
            resources :steps, controller: 'productcomponenttestcasesteps' do
              put '/step_up' => "productcomponenttestcasesteps#step_up"
              put '/step_down' => "productcomponenttestcasesteps#step_down"
            end
          end
          get '/check_title/:title' => "productcomponenttestcases#check_title"
        end
        resources :cycles, controller: 'productcycles' do
          get 'latest', on: :collection, to: 'productcycles#latest'
        end
      end
      resources :users, except: [:update, :destroy] do
        get '/request_access' => "users#request_access"
        get '/grant_permission' => "users#grant_permission"
        resources :products, controller: 'userproducts'
        resources :confirmation_mail, controller: 'userconfirmationmail'
      end
      post 'invite_member' => 'users#invite_member'
      resources :scripts, only: [:show] do
        # post 'create', on: :collection, to: 'scripts#create'
        # get 'test', on: :collection, to: 'scripts#test'
        # get 'test2', on: :collection, to: 'scripts#test2'
      end
      resource :devices do
        get "/deviceos" => "devices#deviceos"
        get "/deviceosversion" => "devices#deviceosversion"
        get "/devicebrands" => "devices#devicebrands"
        get "/devicebrowsers" => "devices#devicebrowsers"
        get "/brandversions" => "devices#brandversions"
        get "/" => "devices#index"
      end
      #Marketing APIs with Basic authentication
      resources :marketingapis do
       get '/getProjects' => 'marketingapis#getProjects'
       get '/getTestsuite' => 'marketingapis#getTestsuite'        
       get '/getTestcaseList' => 'marketingapis#getTestcaseList'
       get '/clientLogin' => 'marketingapis#clientLogin'
       post '/createProduct' => 'marketingapis#createProduct'
       post '/createTestcase' => 'marketingapis#createTestcase'        
       post '/createProject' => 'marketingapis#createProject'
       post '/updateProject' => 'marketingapis#updateProject'        
       post '/createFeature' => 'marketingapis#createFeature'
       post '/updateBugFeature' => 'marketingapis#updateBugFeature'
       post '/updateTestcase' => 'marketingapis#updateTestcase'  

       get '/getBugs' => 'marketingapis#getBugs'
       get '/getBugscustom' => 'marketingapis#getBugscustom'
       post '/reportBug' => 'marketingapis#reportBug'  
       post '/updateBugs' => 'marketingapis#updateBugs'            
       get '/getProducts' => 'marketingapis#getProducts'  
      end
      #End Marketing APIs
      get "/get_tester_country" => "devices#get_tester_country"
      resources :testrun_requests, only: [:show, :create, :update] do
      end
      
      resources :workflows, only: [:checkpoints] do
        get 'checkpoints', on: :member, to: 'workflow#checkpoints'
      end
     
      get '/getOpenBugscustom' => 'testapps#companyapps'
      get '/gettestappsbugs' => 'testapps#gettestappsbugs'
 
      resources :testapps do
        resources :featurestatus 
      end

      resources :client_invite 
        get "/get_list_of_products" => "client_invite#get_list_of_products", path: "products"
      resources :casestudies
      resources :customer_requirements
      resources :companies do
        post 'invitemember', :on => :member
        get "/get_exploratory_cycles" => "companies#get_exploratory_cycles"
        get "/get_testcase_cycles"    => "companies#get_testcase_cycles"
        get "/get_all_users"          => "companies#get_all_users"
        get "/getCompanyDetails"      => "companies#getCompanyDetails"
        resources :products, controller: 'companyproducts'
        get "/check_cycle_limit" => 'companyenterprisecycles#check_cycle_limit'
        post "/download_charts"   => 'companyenterprisecycles#download_charts'
        post "/download_et_charts"   => 'companyenterprisecycles#download_et_charts'
        resources :enterprisecycles, controller: 'companyenterprisecycles' do 
          
        end
      end
      resources :sessions
      resources :testing_promo
      resources :testers
      get '/attachments' => "enterprisecycle_attachments#send_to_add"
      resources :enterprisecycles do
        get '/pause_resume_cycle' => "enterprisecycles#pause_resume_cycle"
        get '/metrics' => "enterprisecycles#metrics"        
        post '/cycle_metrics' => "enterprisecycles#cycle_metrics"
        post '/get_feature_bug_details' => "enterprisecycles#get_feature_bug_details"
        get "/environment_list" => "enterprisecycles#environment_list"
        resources :attachments, controller: 'enterprisecycle_attachments'
      end
      resources :campaign
      resources :enterprisecycle do
        resources :cases, controller: 'enterprisecycle_cases' do
          resources :testcaseresults, controller: 'enterprisecycle_casetcresults'
        end
        resources :bugs, controller: 'enterprisecycle_bugs', except: [:create] do
          resources :comments, controller: 'enterprisecycle_bugcomments', except: [:create]
        end
      end
      resources :enterprisecycle_bugcomments
      resources :enterprisecycle_bugs, only: [:create]
     
      resources :crowdci

        post 'requestdemo', to: 'demo_request#requestdemo'
        post 'request_partnership', to: 'demo_request#request_partnership'
        post 'contact-crowd-testing', to: 'contact#contactmessage'
      

      resources :testrun_results, only: [:show]
      
      post 'enterprisecycle_attachments/presign_upload'  => "enterprisecycle_attachments#presign_upload"
      
      post 'enterprisecycle_attachments/request_payment'  => "enterprisecycle_attachments#request_payment"
      post 'enterprisecycle_attachments/payment_status_from_instamojo'  => "enterprisecycle_attachments#payment_status_from_instamojo"
      post 'enterprisecycle_attachments/payment_status_from_paypal'     => "enterprisecycle_attachments#payment_status_from_paypal"
      get  'enterprisecycle_attachments/request_payment_paypal'         => "enterprisecycle_attachments#request_payment_paypal"
      
      

      post 'vnccallback/', to: 'testrun_requests#vnccallback'
      post 'completioncallback/', to: 'testrun_requests#completioncallback'

      post "companyenterprisecycles/update_et_cycle" => 'companyenterprisecycles#update_et_cycle'
    end
    ##### Automation APIs end

    resources :subscriptions do
      member{
        get 'confirm'
        get 'unsubscribe'
      }
    end
    resources :tfs do
      member{

      }
      collection{
        post :connect
      }
    end
    resources :devices do

    end
    resources :bugs do
      get 'pdf',on: :collection
      get 'backup_platforms',on: :collection
      get 'backup_products',on: :collection
      get 'create_zip',on: :member
    end
    post "generate_api_keys",to: "bugs#generate_api_keys"
    get "reference",to: "bugs#reference"
    get 'bugs/:id(.:format)'=> "bugs#pdf"

    resources :standardize do
      get 'country_code',on: :collection
    end
    ##
    resources :git do
      collection{
        get :connection_response
        get :get_token
        get :phantom_form
        get :get_issues
        get :get_repos
      }
      member{
        get "/connect/:cycletype",action: :connect
        get "/get_issues_from_repo/:repo",action: :get_issues_from_repo
        get :get_issues_from_repo
        get :get_issues_for_org
        get "/:repo/get_issue_from_repo/:number",action: :get_issue_from_repo
        get "/:repo/push_issue_to_repo",action: :push_issue_to_repo
        post "/:cycletype/push_issues",action: :push_issues
        get "/:repo/patch_issue/:bug_id",action: :patch_issue
      }

    end
    ## Asana Integration
    resources :asana do
      collection{
        get :connection_response
        get :get_token
        get :init,path: "init/:cycletype"
        get :phantom_form
        get :get_issues
        get :get_repos
      }
      member{
        get "/connect/:cycletype",action: :connect
        get "/get_issues_from_repo/:repo",action: :get_issues_from_repo
        get :get_issues_from_repo
        get :get_issues_for_org
        get "/:repo/get_issue_from_repo/:number",action: :get_issue_from_repo
        get "/:repo/push_issue_to_repo",action: :push_issue_to_repo
        post "/:cycletype/push_issues",action: :push_issues
        get "/:repo/patch_issue/:bug_id",action: :patch_issue
      }
    end
    resources :mantis do
      get 'push_bugs',:on => :member
    end
    resources :jiras do
      post 'push_bugs',:on => :member
      get 'check_for_projects',on: :member
    end
    resources :you_tracks do
      post 'push_bugs',:on => :member
      get 'check_for_projects',on: :member
    end
    resources :bugzillas
    resources :redmines do
      get 'push_bugs', :on => :member
    end
    get 'zip/:id' => "bugs#create_zip"
    get 'new' => "bugs#new"
    get 'authorize' => "bugs#authorize"
    get 'callback' => "bugs#callback"
    get 'push_bugs/:id' => "bugs#push_bugs"
    get 'update_bugs/:id/:bug_id' => "bugs#update_bug"
    resources :payoneer do
      collection do
        get 'tester_token'
        get 'verify_tester'
        get 'update_tester'
        get 'check_payoneer_amount'
      end
      member do
        get 'update_tester'
        get 'verify_tester'
        post 'search_payment_data'
        post 'raise_invoice'
        post 'generate_payment_report'
        post 'make_payment'
        get 'check_payoneer_detail'

      end
    end
    #Secure Tunnel Notification System
    resources :secure_tunnel do
      collection do
        get 'notify'
        get 'update_credit'
        get 'update_points'
      end
    end
  end
  ###API subdomain
  constraints subdomain: 'api' do
    namespace :api, path: '/' do
      resources :bugs do
        get 'pdf',on: :collection
        get 'backup_platforms',on: :collection
        get 'backup_products',on: :collection
        get 'create_zip',on: :member
      end
      post "generate_api_keys",to: "bugs#generate_api_keys"
      get "reference",to: "bugs#reference"
      get 'bugs/:id(.:format)'=> "bugs#pdf"
      ## Social Plugin ##
      # resources :social,path: "/" do
      #   get 'twitter',on: :collection
      #   get 'facebook',on: :collection
      # end
      ## end ##
      ## Standardize system ##
      resources :standardize do
        get 'country_code',on: :collection
      end
      ##
      resources :git do
        collection{
          get :connection_response
          get :get_token
          get :phantom_form
          get :get_issues
          get :get_repos
        }
        member{
          get "/connect/:cycletype",action: :connect
          get "/get_issues_from_repo/:repo",action: :get_issues_from_repo
          get :get_issues_from_repo
          get :get_issues_for_org
          get "/:repo/get_issue_from_repo/:number",action: :get_issue_from_repo
          get "/:repo/push_issue_to_repo",action: :push_issue_to_repo
          post "/:cycletype/push_issues",action: :push_issues
          get "/:repo/patch_issue/:bug_id",action: :patch_issue
        }

      end
      resources :mantis do
        get 'push_bugs',:on => :member
      end
      resources :jiras do
        get 'push_bugs',:on => :member
        get 'check_for_projects',on: :member
      end
      resources :you_tracks do
        get 'push_bugs',:on => :member
        get 'check_for_projects',on: :member
      end
      resources :bugzillas
      resources :redmines do
        get 'push_bugs', :on => :member
      end
      get 'zip/:id' => "bugs#create_zip"
      get 'new' => "bugs#new"
      get 'authorize' => "bugs#authorize"
      get 'callback' => "bugs#callback"
      get 'push_bugs/:id' => "bugs#push_bugs"
      get 'update_bugs/:id/:bug_id' => "bugs#update_bug"
    end
  end
  #################
  ###Events subdomain
  constraints subdomain: 'events' do
    namespace :events, path: '/' do
      resources :championships do
        member{
          get :new_question
          get :register_to_event
          get :declare_result
          get :winners
          post :save_result
          get :participants
        }
        resources :questions,path: "questions" do
          get :answers
          post :answers
          resources :answers do
            get :valid
            get :invalid
          end
        end
      end
      resources :bugathons do
        member{
          get :participate
        }
      end
    end
    resources :events
  end
  namespace :events, path: 'events' do
    resources :championships
  end
  #################
  ### Bug a thon subdomain
  constraints subdomain: 'bugathon' do
    namespace :events, path: '/' do
      resources :bugathons do
        member{
          get :participate
          get :how_it_works,path: "how-it-works"
          # get :selected_app,path: "winner-apps"
          get :b_view
          get :bug,path: "bug"
        }
        collection{
          get :participate
          get :how_it_works,path: "how-it-works"
          # get :selected_app,path: "winner-apps"
          get :b_view
          get :myapp,path: "myapp"
          post :search
          get :signup
          post :createaccounthomepage
        }
      end
      get "home" => "bugathon#votenow"
    end
  end
  ###
  ###User Role Based System ###
  get "admin/roles"
  resources :user_roles do
    post "map",:on => :collection
    member{
      get :permissions
      get :users
      post :store_permissions
    }
  end
  ###

  ## Failed Task ##
  resources :failed_tasks do
  end
  ## end ##

  ##404
  get "case-studies",to: redirect {|p, req| "/"}
  get "case-studies",to: redirect {|p, req| "/"}
  post "case-studies",to: redirect {|p, req| "/"}
  get "blog",to: redirect {|p, req| "http://blog.99tests.com/"}
  get "ourblog",to: redirect {|p, req| "http://blog.99tests.com/"}
  get "saas-customers",:to => "static#customers"
  get "privacy-policy/load-testing",:to => "static#pripol"
  get "uncategorized",to: redirect {|p, req| "/"}
  ##Guest Access
  resources :admin do
    member do
      get "guest_users"
      get "raise_invoice"
      get "archieve_cycle"
      get "restore_cycle"
    end
    collection do
      get :generate_login_token,path: "generate-login-token"
      get :generated_login_token,path: "generated-login-token"
      post :set_login_token,path: "generate-login-token"
      get :archieved_cycles,path: "archived-cycles"
      post "create_guest_users"
      post "generate_guest_users"
      post "download_guest_user_csv"
      post "randomize_password_for_guest_users"
      get "guest_users"
      get "international_tester_payment_detail"
      post "international_tester_payment_detail"
      ## No Nationality Tester ##
      get :unknown_nationality_tester_payment_detail,path: "unknown-nationality-tester-payment-detail"
      get :no_nationality_tester_payment,path: "no-nationality-tester-payment"
      get :suggested_nationality_for_no_nationality_tester
      ## end ##
      get "raise_invoice"
      get "raise_invoice_for_all"
      get "pending_invoices"
      get "update_to_revit_server"
      ##weekly payment for international tester payment(payoneer)
      get 'payoneer_weekly_payment'
      ## 1 payment page
      get 'payments'
      get 'payment_dashboard'
      get "payment_history"
    end
  end

  post '/admin/remove_privileged_tester', to: 'admin#remove_privileged_tester', as: 'admin_remove_privileged_tester'
  post '/admin/add_privileged_tester', to: 'admin#add_privileged_tester', as: 'admin_add_privileged_tester'
  post '/admin/tester_capability_find_testers', to: 'admin#tester_capability_find_testers', as: 'tester_capability_find_testers'
  post '/admin/tester_capability_action', to: 'admin#tester_capability_action', as: 'admin_tester_capability_action'
  ##

  ## Openbug dashboard ##
  resources :static ,path: "/",except: [:show,:edit] do
    collection do
      get "dashboard"
    end
  end
  ###
  get "/enterprisecycles" => "companies#enterprisecycles"
  get "/contests" => "companies#contests"
  get "/challenges" => "companies#challenges"
  get "/mytestcycles" => "companies#mytestcycles"
  get "/invite_teammember" => "companies#invite_teammember"
  post "/invite_teammember" => "companies#invitemember"
  get "/get-started" => "companies#companysetup"
  get "/profile/edit" => "companies#edit"
  get '/404', :to => redirect('/404.html')
  get '/500', :to => redirect('/404.html')
  get '/422', :to => redirect('/422.html')
  get '/unsubscribe', :to => "home#unsubscribe"
  get '/sitemap',:to => redirect('/sitemap.xml')


  ## Subdomain links
  ## Marketing Pages
  get '/partnership', :to => "marketing#partnership"
  get '/test-cases', :to => "marketing#testcase_home"
  get '/testcase', :to => "marketing#testcase"
  get '/testcase/:product_id', :to => "marketing#testcase"
  get '/results', to:'testapps#show'
  get '/bug_bash', to: 'marketing#onboarding'
  get 'accept_invitation', :to => "marketing#accept_invitation"
  get 'case_studies', :to => "marketing#case_studies" 
  get 'invite_team', :to => "marketing#invite_team"
  get 'thank-you-for-request', :to => "marketing#thank_you_requestdemo"
  get 'thank-you', :to => "marketing#thank_you_contact"
  get 'how-test-automation-works', :to => "marketing#how_it_works"
  get 'software-test-pricing', :to => "marketing#pricing"
  # get 'product-dashboard', :to => "marketing#product_dashboard"
  # get 'bug-trackers', :to => "marketing#bug_trackers"
  # get 'app-analytics', :to => "marketing#app_analytics"
  # get 'crowd-testing', :to => "marketing#crowd_testing"
  # get 'app-grader', :to => "marketing#app_grader"
  # get 'testing-planner', :to => "marketing#testing_planner"
  get 'about-us', :to => "marketing#about"
  get 'contact-us', :to => "marketing#contact"
  get 'request-demo', :to => "marketing#request_demo"
  get 'user-bug', :to => "marketing#user_bug"
  get  'terms-of-services', :to => "marketing#terms_of_services"
  get 'tester-zone', :to => "marketing#tester_zone"
  get 'news', :to => "marketing#media"
  get 'LP-adv-crowdsourced-testing', :to => "marketing#campaign_home"
  get 'LP-adw-crowdsourced-testing/thankyou', :to => "marketing#thank_you_campaign"
  get 'LP-adv-crowdCI/thankyou', :to => "marketing#thank_you_campaign"
  # get 'automation', :to => "marketing#automation_testing"
  # get 'functional-testing', :to => "marketing#functional_testing"
  # get 'security-testing', :to => "marketing#security_testing"
  # get 'localization-testing', :to => "marketing#localization_testing"
  # get 'usability-testing', :to => "marketing#usability_testing"
  # Decoupled routes
  # get "/:parent_class/:parent_id/:child_class/:child_id"
  # get "/:uniq_tester_id" => "testers#show"
  get "/:uniq_tester_id/wall" => "testers#wall"
  get "/:uniq_tester_id/activity" => "testers#activity"
  get "/:name", to: "testapps#show"
end
