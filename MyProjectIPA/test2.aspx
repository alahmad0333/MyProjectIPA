﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="MyProjectIPA.test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="404Page.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <svg xmlns="http://www.w3.org/2000/svg" id="robot-error" viewBox="0 0 260 118.9">
            <defs>
                <clipPath id="white-clip"><circle id="white-eye" fill="#cacaca" cx="130" cy="65" r="20" /> </clipPath>
             <text id="text-s" class="error-text" y="106"> 403 </text>
            </defs>
              <path class="alarm" fill="#e62326" d="M120.9 19.6V9.1c0-5 4.1-9.1 9.1-9.1h0c5 0 9.1 4.1 9.1 9.1v10.6"/>
             <use xlink:href="#text-s" x="-0.5px" y="-1px" fill="black"></use>
             <use xlink:href="#text-s" fill="#2b2b2b"></use>
            <g id="robot">
              <g id="eye-wrap">
                <use xlink:href="#white-eye"></use>
                <circle id="eyef" class="eye" clip-path="url(#white-clip)" fill="#000" stroke="#2aa7cc" stroke-width="2" stroke-miterlimit="10" cx="130" cy="65" r="11" />
<ellipse id="white-eye" fill="#2b2b2b" cx="130" cy="40" rx="18" ry="12" />
              </g>
              <circle class="lightblue" cx="105" cy="32" r="2.5" id="tornillo" />
              <use xlink:href="#tornillo" x="50"></use>
              <use xlink:href="#tornillo" x="50" y="60"></use>
              <use xlink:href="#tornillo" y="60"></use>
            </g>
          </svg>
<h1>You are not allowed to enter here</h1>
<h2>Go <a  href="WebForm1.aspx">Home!</a></h2>
        <script>

            var root = document.documentElement;
            var eyef = document.getElementById('eyef');
            var cx = document.getElementById("eyef").getAttribute("cx");
            var cy = document.getElementById("eyef").getAttribute("cy");

            document.addEventListener("mousemove", evt => {
                let x = evt.clientX / innerWidth;
                let y = evt.clientY / innerHeight;

                root.style.setProperty("--mouse-x", x);
                root.style.setProperty("--mouse-y", y);

                cx = 115 + 30 * x;
                cy = 50 + 30 * y;
                eyef.setAttribute("cx", cx);
                eyef.setAttribute("cy", cy);

            });

            document.addEventListener("touchmove", touchHandler => {
                let x = touchHandler.touches[0].clientX / innerWidth;
                let y = touchHandler.touches[0].clientY / innerHeight;

                root.style.setProperty("--mouse-x", x);
                root.style.setProperty("--mouse-y", y);
            });

        </script>
    </form>
</body>
</html>
