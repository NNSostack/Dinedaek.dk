﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MaintainScrollPositionOnPostback="true"%>
<%@ Register src="TireRequest.ascx" tagPrefix="trancku" tagName="tireRequest" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%# Global.Title %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen" />
    <link rel="stylesheet" href="content/jquery.fancybox.css" type="text/css" media="all" />
    <script src="http://code.jquery.com/jquery.js"></script>

    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
        background-image: url('img/tires3.jpg');
        
      }

      .show-grid {
            margin-bottom: 20px;
            margin-top: 10px;
    }
    .show-grid {
        background-color: #EEEEEE;
        border-radius: 3px 3px 3px 3px;
        line-height: 40px;
        min-height: 40px;
        
    }

    .span4 .modal-body {
        max-height: none;
    }

    .hide {
        display: none;
    }

}


    
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="/" class="brand"><%# Global.Host %></a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Forside</a></li>
              <li><a class="contactFancybox" href="#contact">Kontakt</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
                  
    <div class="container">
        <div class="row">
            <div class="span12 show-grid text-center"><h2>Danmarks billigste dæk.</h2>Garanteret
            </div>
            <div class="span4 show-grid">
                <div class="modal-header text-center" onclick="window.location = '?type=winter'" style="cursor:pointer;">
                    <h2>Vinterdæk</h2>
                </div>
                
            </div>
            <div class="span4 show-grid">
            
                <div class="modal-header text-center" onclick="window.location = '?type=summer'" style="cursor:pointer;">
                    <h2>Sommerdæk</h2>
                </div>
                
            </div>
            <div class="span4 show-grid">
            
                
                <div class="modal-header text-center" onclick="window.location = '?type=allyear'" style="cursor:pointer;">
                    <h2>Helårsdæk</h2>
                </div>
                

            </div>
            <div class="span4 show-grid">
            
                
                <div class="modal-header text-center" onclick="window.location = '?special=1'" style="cursor:pointer;">
                    <h2>Specialdæk</h2>
                </div>
                

            </div>
        </div>
    </div>
        
    <div style="display: none;" id="contact">
        <div>
            <div class="modal-header">
                <h2>Kontakt</h2>
                <div class="formInfo">
                    <p>Har du spørgsmål til siden eller til produkterne kan du udfylde formularen herunder</p>
                </div>
            </div>
        
        
            <div class="modal-body">
        
                <div class="inputs">
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="name" ErrorMessage="Du skal skrive dit navn" Display="Dynamic" ValidationGroup="contact" />

                    <asp:Label runat="server" AssociatedControlID="name">*Dit navn:</asp:Label>
                    
                    <asp:TextBox runat="server" ID="name" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="<br/>Du skal skrive din email" Display="Dynamic" ValidationGroup="contact" />

                    <asp:Label runat="server" AssociatedControlID="email">*Din e-mailadresse:</asp:Label>
                    
                    <asp:TextBox runat="server" ID="email" />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="comment" ErrorMessage="<br/>Du skal skrive et spørgsmål" Display="Dynamic" ValidationGroup="contact" />
                    <asp:Label runat="server" AssociatedControlID="comment">*Dit spørgsmål:</asp:Label>
                    
                    <asp:Textbox runat="server" TextMode="MultiLine" ID="comment" />
                </div>
            </div>
        
            <div class="modal-footer">
                        
                <div class="buttons">
                    <asp:Button runat="server" Text="Send" OnClick="OnClick" ID="send" ValidationGroup="contact"  />
                </div>
                    
            </div>
                    

        </div>
    
</div>
        
    <asp:PlaceHolder runat="server" Visible='<%# Request.QueryString["type"] != null || Request.QueryString["special"] != null %>'>
        <trancku:tireRequest runat="server"  />  

    </asp:PlaceHolder> 
        

    
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.fancybox.pack.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $(".contactFancybox").fancybox({
                width: "350",
                minHeight: "auto",
                parent: "form:first" // jQuery selector
            });
        });
    </script>    
        
    <asp:PlaceHolder runat="server" Visible='<%# Request.QueryString["showThanks"] != null %>'>
        <script>
            $(document).ready(function () {
                $.fancybox(
                    '<h2 style="text-align: center;">Tak for din forespørgsel</h2><p>Din forespørgsel er sendt videre og vil blive behandlet snarest.' +
                        '<br/>Du vil modtage et autosvar med de informationer, der er sendt afsted</p>',
                    {
                        'autoDimensions': true,
                        'height': 'auto',
                        'transitionIn': 'none',
                        'transitionOut': 'none'
                    }
                );

            });
        </script>

    </asp:PlaceHolder>    
        
        
    <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible='<%# Request.QueryString["showContactThanks"] != null %>'>
        <script>
            $(document).ready(function () {
                $.fancybox(
                    '<h2 style="text-align: center;">Tak for din forespørgsel</h2><p>Din forespørgsel er sendt videre og vil blive besvaret snarest.' +
                        '<br/>Du vil modtage et autosvar med de informationer, der er sendt afsted</p>',
                    {
                        'autoDimensions': true,
                        'height': 'auto',
                        'transitionIn': 'none',
                        'transitionOut': 'none'
                    }
                );

            });
        </script>

    </asp:PlaceHolder>    

<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-45612705-1', 'dinedæk.dk');
    ga('send', 'pageview');

</script>


    </form>
</body>
</html>
