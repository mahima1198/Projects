<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="css_js.jsp"></jsp:include>
</head>
<body>

	<div class="bg-black	">
			<div class="container-fluid">
					
				<div class="col-sm-4">
					<h3 class="rs title">Facebook Feed</h3>
					<p class="rs description">Paragraph on asdasdasdasda</p>
					<p class="rs email"><a class="fc-default  be-fc-orange" href="http://envato.megadrupal.com/cdn-cgi/l/email-protection#cba2a5ada48ba6aeacaaafb9bebbaaa7e5a8a4a6"><span class="__cf_email__" data-cfemail="c7aea9a1a887aaa2a0a6a3b5b2b7a6abe9a4a8aa">[email&#160;protected]</span><script data-cfhash='f9e31' type="text/javascript">/* <![CDATA[ */!function(t,e,r,n,c,a,p){try{t=document.currentScript||function(){for(t=document.getElementsByTagName('script'),e=t.length;e--;)if(t[e].getAttribute('data-cfhash'))return t[e]}();if(t&&(c=t.previousSibling)){p=t.parentNode;if(a=c.getAttribute('data-cfemail')){for(e='',r='0x'+a.substr(0,2)|0,n=2;a.length-n;n+=2)e+='%'+('0'+('0x'+a.substr(n,2)^r).toString(16)).slice(-2);p.replaceChild(document.createTextNode(decodeURIComponent(e)),c)}p.removeChild(t)}}catch(u){}}()/* ]]> */</script></a></p>
					<p class="rs">+1 (555) 555 - 55 - 55</p>
				</div>
				<div class="col-sm-4">
					<h3 class="rs title">Twitter Feed</h3>
					<p class="rs description">Donec rutrum elit ac arcu bibendum rhoncus in vitae turpis. Quisque fermentum gravida eros non faucibus. Curabitur fermentum, arcu sed cursus commodo.</p>
					<p class="rs email"><a class="fc-default  be-fc-orange" href="http://envato.megadrupal.com/cdn-cgi/l/email-protection#cba2a5ada48ba6aeacaaafb9bebbaaa7e5a8a4a6"><span class="__cf_email__" data-cfemail="c7aea9a1a887aaa2a0a6a3b5b2b7a6abe9a4a8aa">[email&#160;protected]</span><script data-cfhash='f9e31' type="text/javascript">/* <![CDATA[ */!function(t,e,r,n,c,a,p){try{t=document.currentScript||function(){for(t=document.getElementsByTagName('script'),e=t.length;e--;)if(t[e].getAttribute('data-cfhash'))return t[e]}();if(t&&(c=t.previousSibling)){p=t.parentNode;if(a=c.getAttribute('data-cfemail')){for(e='',r='0x'+a.substr(0,2)|0,n=2;a.length-n;n+=2)e+='%'+('0'+('0x'+a.substr(n,2)^r).toString(16)).slice(-2);p.replaceChild(document.createTextNode(decodeURIComponent(e)),c)}p.removeChild(t)}}catch(u){}}()/* ]]> */</script></a></p>
					<p class="rs">+1 (555) 555 - 55 - 55</p>
				</div>
				<div class="col-sm-4">
					<h3 class="rs title">Instagram Feed</h3>
					<p class="rs description">Donec rutrum elit ac arcu bibendum rhoncus in vitae turpis. Quisque fermentum gravida eros non faucibus. Curabitur fermentum, arcu sed cursus commodo.</p>
					<p class="rs email"><a class="fc-default  be-fc-orange" href="http://envato.megadrupal.com/cdn-cgi/l/email-protection#cba2a5ada48ba6aeacaaafb9bebbaaa7e5a8a4a6"><span class="__cf_email__" data-cfemail="c7aea9a1a887aaa2a0a6a3b5b2b7a6abe9a4a8aa">[email&#160;protected]</span><script data-cfhash='f9e31' type="text/javascript">/* <![CDATA[ */!function(t,e,r,n,c,a,p){try{t=document.currentScript||function(){for(t=document.getElementsByTagName('script'),e=t.length;e--;)if(t[e].getAttribute('data-cfhash'))return t[e]}();if(t&&(c=t.previousSibling)){p=t.parentNode;if(a=c.getAttribute('data-cfemail')){for(e='',r='0x'+a.substr(0,2)|0,n=2;a.length-n;n+=2)e+='%'+('0'+('0x'+a.substr(n,2)^r).toString(16)).slice(-2);p.replaceChild(document.createTextNode(decodeURIComponent(e)),c)}p.removeChild(t)}}catch(u){}}()/* ]]> */</script></a></p>
					<p class="rs">+1 (555) 555 - 55 - 55</p>
				</div>
			</div>
			
			<!-- Modal Pop Box for Login and etc -->
			<center>
				<span class="label label-primary">More Newsletter</span>
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Subscribe Us !!!</button>
			</center>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">Email ID</h4>
					</div>
					<div class="modal-body">
						<input id="email" type="text" class="form-control" name="email" placeholder="Email">
					</div>
					<div class="modal-footer">
					  <button type="button" class="btn btn-default" data-dismiss="modal">Subscribe</button>
					</div>
				  </div>
				</div>
			</div>
			
			<!-- End Modal -->
		</div>

</body>
</html>