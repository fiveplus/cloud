<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="/master-tag" prefix="fms" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/date-tag" prefix="date" %>
<fms:ContentPage masterPageId="frontMaster">
	<fms:Content contentPlaceHolderId="title">
		碎片云3.0
	</fms:Content>
	<fms:Content contentPlaceHolderId="source">
		<!-- 导入外部css/js -->
		<link rel="stylesheet" href="js/dropkick/css/dropkick.css" />
		<script src="js/dropkick/js/jquery.dropkick-2.1.9.min.js"></script>
		<!-- 日历插件 -->
		<link rel='stylesheet' type='text/css' href='js/jquery-week-calendar/libs/css/smoothness/jquery-ui-1.8.11.custom.css' />
	 	<link rel="stylesheet" href="js/jquery-week-calendar/jquery.weekcalendar.css" type="text/css" />
		<link rel="stylesheet" href="js/jquery-week-calendar/libs/skins/default.css" type="text/css" />
		
	 	
	 	<script type='text/javascript' src='js/jquery-week-calendar/libs/jquery-ui-1.8.11.custom.min.js'></script>
		<script type='text/javascript' src='js/jquery-week-calendar/libs/date.js'></script>
		<script src="js/jquery-week-calendar/jquery.weekcalendar.js"></script>
	</fms:Content>
	<fms:Content contentPlaceHolderId="main">
		<!-- main content -->
		<div class="main" style="overflow:hidden;">
			<div style="position:relative">
				<div class="cmenu" style="min-width:850px;">
					<div class="cmenuleft">
						<a class="cur">日历</a>
						<a href="calexam">事件审核</a>
					</div>
					<div class="cmenuright"></div>
					<div class="clear"></div>
				</div>	
				<div class="space_h_40"></div>
				<div>
					<!-- main div -->
					<div style="padding:15px 0 10px 0;">
						<select name="data_source" class="dropkick" id="data_source">
							<c:forEach items="${users}" var="u">
								<c:if test="${u.id==user.id}">
									<option value="${u.id}" selected="selected">${u.username}</option>
								</c:if>
								<c:if test="${u.id!=user.id}">
									<option value="${u.id}">${u.username}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div id='calendar'></div>
				</div>
				<div class="space_h_30 clear"></div>
			</div>
		</div>
		
		<div id="event_edit_container" >
			<form>
				<input type="hidden" />
				<ul>
					<li>
						<span>Date: </span><span class="date_holder"></span> 
					</li>
					<li>
						<label for="start">Start Time: </label><select  name="start"><option value="">Select Start Time</option></select><br />
					</li>
					<li style="margin:20px 0 0 0;">
						<label for="end">End Time: </label><select name="end"><option value="">Select End Time</option></select><br />
					</li>
					<li style="margin:20px 0 0 0;">
						<label for="title">Title: </label><input type="text" name="title" />
					</li>
					<li>
						<label for="body">Body: </label><textarea name="body"></textarea>
					</li>
				</ul>
			</form>
		</div>
		
		
		<div id="event_read_container" >
			<form>
				<input type="hidden" />
				<ul>
					<li>
						<span>Date: </span><span class="date_holder"></span> 
					</li>
					<li>
						<label for="userName">UserName: </label><label name="userName"></label>
					</li>
					<li>
						<label for="start">Start Time: </label><label name="start"></label>
					</li>
					<li>
						<label for="end">End Time: </label><label name="end"></label>
					</li>
					<li>
						<label for="title">Title: </label><label name="title"></label>
					</li>
					<li>
						<label for="body">Body: </label><label name="body"></label>
					</li>
				</ul>
			</form>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$('#data_source').dropkick();
			
				
			   var $calendar = $('#calendar');
			   var id = 10;
			   
			   
			   $calendar.weekCalendar({
				  displayOddEven:true,
			      timeslotsPerHour : 4,
			      allowCalEventOverlap : true,
			      overlapEventsSeparate: true,
			      firstDayOfWeek : 1,
			      businessHours :{start: 8, end: 18, limitDisplay: true },
			      daysToShow : 7,
			      switchDisplay: {'1 day': 1, '3 next days': 3, 'work week': 5, 'full week': 7},
			      title: function(daysToShow) {
						return daysToShow == 1 ? '%date%' : '%start% - %end%';
			      },
			      height : function($calendar) {
			    	  //outerHeight
			         return $(window).height()-$(".cmenu").outerHeight(true)-1;
			      },
			      eventRender : function(calEvent, $event) {
			         if (calEvent.end.getTime() < new Date().getTime()) {
			            $event.css("backgroundColor", "#aaa");
			            $event.find(".wc-time").css({
			               "backgroundColor" : "#999",
			               "border" : "1px solid #888"
			            });
			         }
			      },
			      draggable : function(calEvent, $event) {
			         return calEvent.readOnly != true;
			      },
			      resizable : function(calEvent, $event) {
			         return calEvent.readOnly != true;
			      },
			      eventNew : function(calEvent, $event) {
			         var $dialogContent = $("#event_edit_container");
			         resetForm($dialogContent);
			         var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
			         var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
			         var titleField = $dialogContent.find("input[name='title']");
			         var bodyField = $dialogContent.find("textarea[name='body']");
			         
			         var userid = $("#data_source").val();
					
			         $dialogContent.dialog({
			            modal: true,
			            title: "New Calendar Event",
			            close: function() {
			               $dialogContent.dialog("destroy");
			               $dialogContent.hide();
			               $('#calendar').weekCalendar("removeUnsavedEvents");
			            },
			            buttons: {
			               save : function() {
			            	   
			            	   $.ajax({
			            		   url:"calendar/add",
			            		   data:{userid:userid,start:startField.val(),end:endField.val(),title:titleField.val(),body:bodyField.val()},
			            		   type:"POST",
			            		   success:function(data){
			            			   var vdata = eval("("+data+")");
			            			   $.alert({title:'提示信息',content:vdata.message,type:'blue'});
			            		   }
			            	   });
			            	   
			                  calEvent.id = id;
			                  id++;
			                  calEvent.start = new Date(startField.val());
			                  calEvent.end = new Date(endField.val());
			                  calEvent.title = titleField.val();
			                  calEvent.body = bodyField.val();
		
			                  $calendar.weekCalendar("removeUnsavedEvents");
			                  $calendar.weekCalendar("updateEvent", calEvent);
			                  $dialogContent.dialog("close");
			               },
			               cancel : function() {
			                  $dialogContent.dialog("close");
			               }
			            }
			         }).show();
			         
			         var left = $(window).width()/2 - $(".ui-dialog").width()/2;
			         var top = $(window).height()/2 - $(".ui-dialog").height()/2;
			         $(".ui-dialog").css({"left":left,"top":top});
					
			         $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
			         setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));
		
			      },
			      eventDrop : function(calEvent, $event) {
			      },
			      eventResize : function(calEvent, $event) {
			      },
			      eventClick : function(calEvent, $event) {
		
			         /*if (calEvent.readOnly) {
			            return;
			         }*/
			         
			         var $dialogContent = $("#event_read_container");
			         resetForm($dialogContent);
			         var userNameField = $dialogContent.find("label[name='userName']").text(calEvent.userName);
			         var startField = $dialogContent.find("label[name='start']").text(calEvent.start);
			         var endField = $dialogContent.find("label[name='end']").text(calEvent.end);
			         var titleField = $dialogContent.find("label[name='title']").text(calEvent.title);
			         var bodyField = $dialogContent.find("label[name='body']");
			         bodyField.text(calEvent.body);
			         
					
			         $dialogContent.dialog({
			            modal: true,
			            title: "Read - " + calEvent.title,
			            resizable:false,
			            close: function() {
			               $dialogContent.dialog("destroy");
			               $dialogContent.hide();
			               $('#calendar').weekCalendar("removeUnsavedEvents");
			            },
			            buttons: {
			               /*
			               save : function() {
			                  calEvent.start = new Date(startField.val());
			                  calEvent.end = new Date(endField.val());
			                  calEvent.title = titleField.val();
			                  calEvent.body = bodyField.val();
		
			                  $calendar.weekCalendar("updateEvent", calEvent);
			                  $dialogContent.dialog("close");
			               },
			               "delete" : function() {
			                  $calendar.weekCalendar("removeEvent", calEvent.id);
			                  $dialogContent.dialog("close");
			               },*/
			               cancel : function() {
			                  $dialogContent.dialog("close");
			               }
			            }
			         }).show();
			         var left = $(window).width()/2 - $(".ui-dialog").width()/2;
			         var top = $(window).height()/2 - $(".ui-dialog").height()/2;
			         $(".ui-dialog").css({"left":left,"top":top});
					
			         var startField = $dialogContent.find("label[name='start']").text(calEvent.start.Format("HH:mm:ss"));
			         var endField = $dialogContent.find("label[name='end']").text(calEvent.end.Format("HH:mm:ss"));
			         $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
			        // setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));
			         $(window).resize().resize(); //fixes a bug in modal overlay size ??
		
			      },
			      eventMouseover : function(calEvent, $event) {
			      },
			      eventMouseout : function(calEvent, $event) {
			      },
			      noEvents : function() {
		
			      },
			      data : function(start, end, callback) {
			    	 var userid = $("#data_source").val();
			         callback(getEventDataToId(userid));
			      }
			   });
		
			   function getEventDataToId(userid) {
				   var datas = [];
				   $.ajax({
					   url:"calendar/list",
					   data:{userid:userid},
					   async:false,
					   success:function(data){
						   datas = eval("("+data+")").bolist;
					   }
				   });
				   return{
					   events:datas
				   };
			   }
		
			   function resetForm($dialogContent) {
			      $dialogContent.find("input").val("");
			      $dialogContent.find("textarea").val("");
			   }
		
			   function getEventData() {
		
			      var year = new Date().getFullYear();
			      var month = new Date().getMonth();
			      var day = new Date().getDate();
				 
			      return {
			         events : [
			            {
			               "id":1,
			               "start": new Date(year, month, day, 12),
			               "end": new Date(year, month, day, 13, 30),
			               "title":"Lunch with Mike",
			                "body":"aaaa"
			            },
			            {
			               "id":2,
			               "start": new Date(year, month, day, 14),
			               "end": new Date(year, month, day, 14, 45),
			               "title":"Dev Meeting"
			            },
			            {
			               "id":3,
			               "start": new Date(year, month, day + 1, 17),
			               "end": new Date(year, month, day + 1, 17, 45),
			               "title":"Hair cut"
			            },
			            {
			               "id":4,
			               "start": new Date(year, month, day - 1, 8),
			               "end": new Date(year, month, day - 1, 9, 30),
			               "title":"Team breakfast"
			            },
			            {
			               "id":5,
			               "start": new Date(year, month, day + 1, 14),
			               "end": new Date(year, month, day + 1, 15),
			               "title":"Product showcase"
			            },
			            {
			               "id":6,
			               "start": new Date(year, month, day, 10),
			               "end": new Date(year, month, day, 11),
			               "title":"I'm read-only",
			               readOnly : true
			            }
		
			         ]
			      };
			   }
		
		
			   /*
			    * Sets up the start and end time fields in the calendar event
			    * form for editing based on the calendar event being edited
			    */
			   function setupStartAndEndTimeFields($startTimeField, $endTimeField, calEvent, timeslotTimes) {
		
			      for (var i = 0; i < timeslotTimes.length; i++) {
			         var startTime = timeslotTimes[i].start;
			         var endTime = timeslotTimes[i].end;
			         var startSelected = "";
			         if (startTime.getTime() === calEvent.start.getTime()) {
			            startSelected = "selected=\"selected\"";
			         }
			         var endSelected = "";
			         if (endTime.getTime() === calEvent.end.getTime()) {
			            endSelected = "selected=\"selected\"";
			         }
			         $startTimeField.append("<option value=\"" + startTime + "\" " + startSelected + ">" + timeslotTimes[i].startFormatted + "</option>");
			         $endTimeField.append("<option value=\"" + endTime + "\" " + endSelected + ">" + timeslotTimes[i].endFormatted + "</option>");
		
			      }
			      $endTimeOptions = $endTimeField.find("option");
			      $startTimeField.trigger("change");
			      $startTimeField.dropkick('refresh');
			      $endTimeField.dropkick('refresh');
			   }
		
			   var $endTimeField = $("select[name='end']");
			   var $endTimeOptions = $endTimeField.find("option");
		
			   //reduces the end time options to be only after the start time options.
			   $("select[name='start']").change(function() {
			      var startTime = $(this).find(":selected").val();
			      var currentEndTime = $endTimeField.find("option:selected").val();
			      $endTimeField.html(
			            $endTimeOptions.filter(function() {
			               return startTime < $(this).val();
			            })
			            );
		
			      var endTimeSelected = false;
			      $endTimeField.find("option").each(function() {
			         if ($(this).val() === currentEndTime) {
			            $(this).attr("selected", "selected");
			            endTimeSelected = true;
			            return false;
			         }
			      });
		
			      if (!endTimeSelected) {
			         //automatically select an end date 2 slots away.
			         $endTimeField.find("option:eq(1)").attr("selected", "selected");
			      }
		
			   });
			   
			   $("#data_source").change(function(){
				   $calendar.weekCalendar("refresh");
			   });
			
			});
				   
			</script>
		
		
	</fms:Content>
</fms:ContentPage>