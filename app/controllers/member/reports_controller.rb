class Member::ReportsController < ApplicationController

    before_action :authenticate_member!

    def index
        @reports = current_member.reports.page(params[:page]).per(15)
    end

    def show
        @request = Request.find(params[:request_id])
        @report = @request.report
    end

    def new
    	  @request = Request.find(params[:request_id])
    	  if @request.report.nil?
           @report = Report.new
        else
           @report = @request.report
        end
        #今の時間を取得
        @now = Time.now
    end

    def create
    	  @request = Request.find(params[:request_id])
        @report = @request.build_report(report_params)
        @report.member_id = current_member.id
        #今の時間を取得
        @now = Time.now
        if @report.save
           redirect_to new_request_report_path(@request)
        else
           render :new
        end
    end

    #update実行後approval_status = 終了になる
    def update
        #begin
         #Report.transaction do
          @report = Report.find(params[:id])
          #今の時間を取得
          @now = Time.now
          @request = @report.request
          @request.approval_status = 3
          if @report.update(report_params)
             @request.save!
             redirect_to new_request_report_path(@report.request)
          else
             render :new
          end
         #end
        #rescue => e
        #redirect_to new_request_report_path(@request)
        #end
    end

    private

    def report_params
        params.require(:report).permit(:in_at,
        	                             :out_at,
      	                               :image,
      	                               :body)
    end

end
