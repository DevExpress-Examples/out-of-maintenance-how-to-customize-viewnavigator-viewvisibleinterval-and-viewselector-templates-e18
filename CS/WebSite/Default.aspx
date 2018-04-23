<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register Assembly="DevExpress.Web.v15.2" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.0.0, Culture=neutral, PublicKeyToken=79868b8147b5eae4"
    Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.0.0, Culture=neutral, PublicKeyToken=79868b8147b5eae4"
    Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <script type="text/javascript">
        function OnSelectViewType(viewType) {
	        var newType = clientViewsCombo.GetSelectedItem().value;
	        scheduler.SetActiveViewType(newType);
        }
        function EndCallback() {
            var currType = scheduler.GetActiveViewType();
            clientViewsCombo.SetValue(currType);
        }
    </script>
    <form id="form1" runat="server">
    <div>
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" OnAppointmentInserting="ASPxScheduler1_AppointmentInserting" ClientInstanceName="scheduler" OnBeforeExecuteCallbackCommand="ASPxScheduler1_BeforeExecuteCallbackCommand">
            <ClientSideEvents EndCallback="function(s,e) { EndCallback(); }" />
            <Templates>
                <ToolbarViewVisibleIntervalTemplate>
                    Toolbar Templates Sample
                </ToolbarViewVisibleIntervalTemplate>
                <ToolbarViewNavigatorTemplate>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Delete&nbsp;all" AutoPostBack="false">
                        <ClientSideEvents Click="function(s,e) { scheduler.RaiseCallback('DLTALL|'); }" />
                    </dx:ASPxButton>
                </ToolbarViewNavigatorTemplate>
                <ToolbarViewSelectorTemplate>
                    <div style="padding-right:10px;">
                        <dx:ASPxComboBox ID="cbActiveView" ClientInstanceName="clientViewsCombo" runat="server" Width="250px" ValueType="System.String" SelectedIndex="0">
					        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnSelectViewType(s); }" />
						    <Items>
							    <dx:ListEditItem Text="Day View" Value="Day" />
							    <dx:ListEditItem Text="Week View" Value="Week" />
							    <dx:ListEditItem Text="Work Week View" Value="WorkWeek" />
							    <dx:ListEditItem Text="Month View" Value="Month" />
							    <dx:ListEditItem Text="Timeline View" Value="Timeline" />
						    </Items>
					    </dx:ASPxComboBox>
                    </div>
                </ToolbarViewSelectorTemplate>
            </Templates>
            <Views>
                <DayView>
                    <TimeRulers>
                        <cc1:TimeRuler>
                        </cc1:TimeRuler>
                    </TimeRulers>
                </DayView>
                <WorkWeekView>
                    <TimeRulers>
                        <cc1:TimeRuler>
                        </cc1:TimeRuler>
                    </TimeRulers>
                </WorkWeekView>
            </Views>
        </dxwschs:ASPxScheduler>
    
    </div>
        <asp:ObjectDataSource ID="appointmentDataSource" runat="server" DataObjectTypeName="CustomEvent"
            TypeName="CustomEventDataSource" DeleteMethod="DeleteMethodHandler" SelectMethod="SelectMethodHandler" InsertMethod="InsertMethodHandler" UpdateMethod="UpdateMethodHandler" OnObjectCreated="appointmentsDataSource_ObjectCreated"></asp:ObjectDataSource>
    </form>
</body>
</html>
