var app = angular.module("bugathonPageApp",[]);
// create angular controller
app.controller('bugathon_controller', function($scope,$http) 
{

angular.element(document).ready(function () {
	 $http({
            method: 'GET',
            url: '/api/v1/testapps',
            headers: {
                // 'X-Auth-User' : user_email,
                // 'X-Auth-Key' : user_apikey
            }
          }).then(function successCallback(response){
                    
                     
                  console.log(response.data);
                 	 var obj = response.data;
                     var h = "";
                     var ob;
                 	   for(var i=0;i<obj.length;i++){
                    		ob = obj[i];
                            h+='<div class="creating-box">';
                            h+='<div class="sub-box" style="margin-left:20px;"></div>';
                            h+='<div class="company-details" style="padding-left:177px"> '+ob.appurl+','+ob.updated_at+'</div>';
                            h+='</div>';
                            console.log("================================")
                            console.log(h);
                            console.log("-------------------------------")
                      		 // $("#bugathon_table  tbody").append('<tr><td  class="bugathon-details-box"   style="width:700px;margin-left:300px;padding-left:50px;"  </td> '+response.data[i].appurl+','+response.data[i].updated_at+'</tr>');
                    	}
                        $("#bugathon_table").append(h);
                       
                        
                },function errorCallback(response) {
                    alert("error");
                });

});
});
