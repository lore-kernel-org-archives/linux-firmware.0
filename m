Return-Path: <SRS0=KASK=ZA=modi-ent.com=support-modicare@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DABC71136
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jun 2025 17:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2E00C4CEE7; Tue, 17 Jun 2025 17:06:24 +0000 (UTC)
Received: from mta-out5.pod18.euc1.zdsys.com (mta-out5.pod18.euc1.zdsys.com [188.172.138.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37B83C4CEE3
	for <linux-firmware@kernel.org>; Tue, 17 Jun 2025 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37B83C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modi-ent.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=modi-ent.com
Received: from zendesk.com (unknown [127.0.0.6])
	by mta-out15.pod18.euc1.zdsys.com (Zendesk) with ESMTP
	id ceca758c-2e6f-4cca-be13-7e6a10f58403;
	Tue, 17 Jun 2025 17:06:21 +0000 (UTC)
Date: Tue, 17 Jun 2025 17:06:21 +0000
From: Modicare Support <support-modicare@modi-ent.com>
Reply-To: Modicare Support <support-modicare@modi-ent.com>
To: Info <info@thebeautyboxx.co>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Drgeetika <drgeetika@isaac-wellness.com>, 
 Info <info@clinicdermatech.com>, 
 "info@skinnsmiles.com" <info@skinnsmiles.com>, 
 "contact@drgeetika.info" <contact@drgeetika.info>, 
 "contact@isaacluxe.co" <contact@isaacluxe.co>, 
 "tarunrajput1978@gmail.com" <tarunrajput1978@gmail.com>, 
 "drspoint@gmail.com" <drspoint@gmail.com>, 
 "EmailInfo@drspoint.com" <emailinfo@drspoint.com>, 
 "booking@tangentinc.in" <booking@tangentinc.in>, 
 "dramitbhasin@hotmail.com" <dramitbhasin@hotmail.com>, 
 "jstory76@naver.com" <jstory76@naver.com>, 
 "eureka_skin@naver.com" <eureka_skin@naver.com>, 
 "kiran.k@intel.com" <kiran.k@intel.com>, 
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "ravishankar.srivatsa@intel.com" <ravishankar.srivatsa@intel.com>, 
 "inquiry@berkowits.in" <inquiry@berkowits.in>, 
 "moniqua@spaceyogastudio.com" <moniqua@spaceyogastudio.com>, 
 "info@reconfacialsurgery.com" <info@reconfacialsurgery.com>, 
 "rcobo@imbanaco.com.co" <rcobo@imbanaco.com.co>, 
 "termoplasticos@alpina.com.br" <termoplasticos@alpina.com.br>, 
 "info@vr-sap.de" <info@vr-sap.de>, 
 "info@vr-boardinghouse.de" <info@vr-boardinghouse.de>, 
 "cd.ggn2@clinicdermatech.in" <cd.ggn2@clinicdermatech.in>, 
 "cd.amritsar@clinicdermatech.in" <cd.amritsar@clinicdermatech.in>, 
 "digital.doctoriduniya@gmail.com" <digital.doctoriduniya@gmail.com>, 
 "info@doctoriduniya.com" <info@doctoriduniya.com>, 
 "callcenter.bangkok@mission-hospital.org" <callcenter.bangkok@mission-hospital.org>, 
 "doctoriduniya@gmail.com" <doctoriduniya@gmail.com>, 
 "clinic.arc.in@gmail.com" <clinic.arc.in@gmail.com>, 
 "appleskin.skin@gmail.com" <appleskin.skin@gmail.com>, 
 "info@medklaire.com" <info@medklaire.com>, 
 "info@lifeessentials.co.in" <info@lifeessentials.co.in>, 
 "aphroditecosmeticcentre@outlook.com" <aphroditecosmeticcentre@outlook.com>, 
 "info@smilestudiogurgaon.in" <info@smilestudiogurgaon.in>, 
 "Info@drspoint.com" <info@drspoint.com>, 
 "info@dentistgurugram.com" <info@dentistgurugram.com>, 
 "emergencies@dentistgurugram.com" <emergencies@dentistgurugram.com>, 
 "dramit@priveclinic.in" <dramit@priveclinic.in>, 
 "dramitbhasin@priveclinic.in" <dramitbhasin@priveclinic.in>, 
 "garekarsmd@gmail.com" <garekarsmd@gmail.com>, 
 "emily@urbanedgebeauty.co.nz" <emily@urbanedgebeauty.co.nz>, 
 "info@v6clinics.com" <info@v6clinics.com>, 
 "info@spaceyogastudio.com" <info@spaceyogastudio.com>, 
 "lorraine.discoverygardens@gmail.com" <lorraine.discoverygardens@gmail.com>, 
 "mooshimtkd@gmail.com" <mooshimtkd@gmail.com>, 
 "moni.malviya@clinicdermatech.in" <moni.malviya@clinicdermatech.in>, 
 "gmeditec@gilmdc.com" <gmeditec@gilmdc.com>, 
 "info@dermatechclinics.com" <info@dermatechclinics.com>
Message-ID: <E4RE2Z7RN12_6851a08d6c55f_4a157012255c_sprut@zendesk.com>
In-Reply-To: <PN3P287MB3142B4222A069DC5273C893FBC73A@PN3P287MB3142.INDP287.PROD.OUTLOOK.COM>
References: <E4RE2Z7RN12@zendesk.com>
 <PN3P287MB3142B4222A069DC5273C893FBC73A@PN3P287MB3142.INDP287.PROD.OUTLOOK.COM>
Subject: =?UTF-8?Q?432297_-_New_SR_Created:_=F0=9F=8C=9F_Partner_with_The?=
 =?UTF-8?Q?_Beauty_Boxx_=E2=80=93_Your_One-Stop_Destination_for_Advanced?=
 =?UTF-8?Q?_Skincare,_Beauty_&_Training_Solutions!?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_6851a08d78adc_4a15701225627";
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Delivery-Context: event-id-27468749259154
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All
X-Mailer: Zendesk Mailer
X-Zendesk-From-Account-Id: e533738
X-Zendesk-Email-Id: 01JXZDP91STTBM9G1X0WQTERW9
DKIM-Signature:  v=1; a=rsa-sha256; c=relaxed/relaxed; d=zendesk.com;
 q=dns/txt; s=zendesk1; t=1750179981;
 bh=Uhmu0U7FTFHs3VtblhZcsQUEuma3PghGr/beLebVHuE=;
 h=date:from:reply-to:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:content-transfer-encoding;
 b=MaBwbvnij91s6woosvFjlzT/uCATJ+djbsavKaeSh0zRoRoC5xquBQCLvXjg7Hqqjl6QCSBFDbPPQaeS6I8VPnLvfxzMxJ6XOOMbmLI9fPt4M+y0G0ZCBduGYCDaPBPjB0S+3kduT/Mfy6BNWlgQeuoWkhyLCWN/oBqrVJq0ofGC+M2QJ5q5vD2FGuIHZk8S7cCjLK2x4GbAGOig6fXCh1CRPr5/zYBahF72ns3Eg6OPErTqRWJ46N4gNoJrw617mmvRKBcpsVMR8CTDIJI7wK+66EcwnG/jV7CNIrE1kMTlBQ0L19IguCRQTepDhHPzoQ6rcO5bZvu2/cYiFERtmQ==


----==_mimepart_6851a08d78adc_4a15701225627
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear Consultant,=0D
=0D
Greetings of the day!=0D
=0D
We thank you for writing to us and acknowledge the receipt of your email/=
concern for your unique Service Request number is SR 432297. =0D
=0D
We assure you, we will do our best efforts to resolve your concern at the=
 earliest possible. Please note, in case we find document/information pro=
vided in your communication is insufficient for processing your request, =
we will revert to you with status and shall specify complete requirements=
 in our response email or call. Please do track the same for faster closu=
re.=0D
=0D
In case of anything urgent, please feel free to contact Azadi Call Center=
 Number 0124-6912900=C2=A0 from Monday to Sunday between 10:00 am to 10:0=
0 pm.=0D
=0D
Alternatively, you may also refer to the appended list of most common que=
ries and links:=0D
- For raising complaints online (Order Related), please log in to www.mod=
icare.com,=0D
Go to Dashboard->Support->Generate New SR, wherein a unique Service Reque=
st Number will be generated and our representative will reply to your Ser=
vice Request Query within 48 working hours.=0D
=0D
- Query Specific Response time is as follows:=0D
1.Order Tracking =E2=80=93 48 to 72 working hours.=0D
2.Short Shipment/ Damaged Products - 48 to 72 working hours.=0D
3.Transaction Failure-48 to 72 working hours=0D
4.TDS Certificate =E2=80=93 7 working days.=0D
5.Pan card update =E2=80=93 7 working days=0D
6.Information Change =E2=80=93 48 to 72 working hours=0D
=0D
Also, it is important to note, In case of any clarification/follow up/res=
ponse, please write on the same email without changing the subject to avo=
id generation of multiple Service Request numbers for same matter and for=
 tracking complete correspondence.=0D
=0D
Once again thank you for giving us an opportunity to assist you.=0D
=0D
Yours Sincerely,=0D
Customer Services Team=0D
=0D
--------------------------------=0D
This email is a service from Modicare.=0D
=0D
=0D
=0D
=0D
=0D
=0D
=0D
=0D
=0D
=0D
=0D
[E4RE2Z-7RN12]=

----==_mimepart_6851a08d78adc_4a15701225627
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html dir=3D"auto"><head>=0D
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8=
">=0D
  <style type=3D"text/css">=0D
    table td {=0D
      border-collapse: collapse;=0D
    }=0D
    body[dir=3Drtl] .directional_text_wrapper { direction: rtl; unicode-b=
idi: embed; }=0D
=0D
  </style>=0D
=0D
          <style type=3D"text/css">=0D
            @media only screen and (max-width: 768px) {=0D
              .simplified-email-footer .namecard {=0D
                display: block;=0D
                min-width: 100%;=0D
                padding: 0 0 16px 0; }=0D
=0D
              .simplified-email-footer .content {=0D
                padding: 16px; }=0D
            }=0D
          </style>=0D
        </head>=0D
<body lang=3D"en-in" style=3D"width: 100%!important; margin: 0; padding: =
0;">=0D
  <div style=3D"font-family: 'system-ui','-apple-system','BlinkMacSystemF=
ont','Segoe UI','Roboto','Oxygen-Sans','Ubuntu','Cantarell','Helvetica Ne=
ue','Arial','sans-serif'; font-size: 14px; line-height: 1.5; color:#44444=
4;">=0D
    <p dir=3D"ltr">Dear Consultant,</p><p dir=3D"ltr">Greetings of the da=
y!</p><p dir=3D"ltr">We thank you for writing to us and acknowledge the r=
eceipt of your email/concern for your unique Service Request number is SR=
 432297. </p><p dir=3D"ltr">We assure you, we will do our best efforts to=
 resolve your concern at the earliest possible. Please note, in case we f=
ind document/information provided in your communication is insufficient f=
or processing your request, we will revert to you with status and shall s=
pecify complete requirements in our response email or call. Please do tra=
ck the same for faster closure.</p><p dir=3D"ltr">In case of anything urg=
ent, please feel free to contact Azadi Call Center Number 0124-6912900&nb=
sp; from Monday to Sunday between 10:00 am to 10:00 pm.</p><p dir=3D"ltr"=
>Alternatively, you may also refer to the appended list of most common qu=
eries and links:<br>- For raising complaints online (Order Related), plea=
se log in to <a href=3D"http://www.modicare.com" rel=3D"noreferrer">www.m=
odicare.com</a>,<br>Go to Dashboard-&gt;Support-&gt;Generate New SR, wher=
ein a unique Service Request Number will be generated and our representat=
ive will reply to your Service Request Query within 48 working hours.</p>=
<p dir=3D"ltr">- Query Specific Response time is as follows:<br>1.Order T=
racking =E2=80=93 48 to 72 working hours.<br>2.Short Shipment/ Damaged Pr=
oducts - 48 to 72 working hours.<br>3.Transaction Failure-48 to 72 workin=
g hours<br>4.TDS Certificate =E2=80=93 7 working days.<br>5.Pan card upda=
te =E2=80=93 7 working days<br>6.Information Change =E2=80=93 48 to 72 wo=
rking hours</p><p dir=3D"ltr">Also, it is important to note, In case of a=
ny clarification/follow up/response, please write on the same email witho=
ut changing the subject to avoid generation of multiple Service Request n=
umbers for same matter and for tracking complete correspondence.</p><p di=
r=3D"ltr">Once again thank you for giving us an opportunity to assist you=
.</p><p dir=3D"ltr">Yours Sincerely,<br>Customer Services Team</p>=0D
  </div><br>=0D
  <div style=3D"font-family: 'system-ui','-apple-system','BlinkMacSystemF=
ont','Segoe UI','Roboto','Oxygen-Sans','Ubuntu','Cantarell','Helvetica Ne=
ue','Arial','sans-serif'; font-size: 12px; line-height: 1.5; color: #aaaa=
aa; margin: 10px 0 14px 0; padding-top: 10px;">=0D
    This email is a service from Modicare. Delivered by <a href=3D"https:=
//www.zendesk.com/support/?utm_campaign=3Dtext&amp;utm_content=3DModicare=
&amp;utm_medium=3Dpoweredbyzendesk&amp;utm_source=3Demail-notification" s=
tyle=3D"color:black;" target=3D"_blank">Zendesk</a>=0D
  </div><br>=0D
  =0D
<span style=3D"color:#FFFFFF" aria-hidden=3D"true" class=3D"zd_encoded_id=
">[E4RE2Z-7RN12]</span>=0D
=0D
<div itemscope=3D"" itemtype=3D"http://schema.org/EmailMessage" style=3D"=
display:none">  <div itemprop=3D"action" itemscope=3D"" itemtype=3D"http:=
//schema.org/ViewAction">    <link itemprop=3D"url" href=3D"https://modic=
are999.zendesk.com/hc/requests/432297">    <meta itemprop=3D"name" conten=
t=3D"View ticket">  </div></div></body></html>=

----==_mimepart_6851a08d78adc_4a15701225627--
