Return-Path: <SRS0=CQda=ZB=modi-ent.com=support-modicare@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F59C7115B
	for <linux-firmware@archiver.kernel.org>; Wed, 18 Jun 2025 07:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77C48C4CEF1; Wed, 18 Jun 2025 07:47:02 +0000 (UTC)
Received: from mta-out14.pod18.euc1.zdsys.com (mta-out14.pod18.euc1.zdsys.com [188.172.138.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17819C4CEED
	for <linux-firmware@kernel.org>; Wed, 18 Jun 2025 07:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17819C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modi-ent.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=modi-ent.com
Received: from zendesk.com (unknown [127.0.0.6])
	by mta-out15.pod18.euc1.zdsys.com (Zendesk) with ESMTP
	id 4670ea38-6aa0-41a0-ac4f-8cd40c602584;
	Wed, 18 Jun 2025 07:46:59 +0000 (UTC)
Date: Wed, 18 Jun 2025 07:46:59 +0000
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
Message-ID: <E4RE2Z7RN12_68526ef339455_6f1570494c_sprut@zendesk.com>
In-Reply-To: <PN3P287MB3142B4222A069DC5273C893FBC73A@PN3P287MB3142.INDP287.PROD.OUTLOOK.COM>
 <E4RE2Z7RN12_6851a08d6c55f_4a157012255c_sprut@zendesk.com>
References: <E4RE2Z7RN12@zendesk.com>
 <PN3P287MB3142B4222A069DC5273C893FBC73A@PN3P287MB3142.INDP287.PROD.OUTLOOK.COM>
Subject: =?UTF-8?Q?432297_-_SR_closure_Notification:_=F0=9F=8C=9F_Partner?=
 =?UTF-8?Q?_with_The_Beauty_Boxx_=E2=80=93_Your_One-Stop_Destination_for?=
 =?UTF-8?Q?_Advanced_Skincare,_Beauty_&_Training_Solutions!?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_68526ef34c036_6f157050ba";
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-Delivery-Context: event-id-27478474645010
Auto-Submitted: auto-generated
X-Auto-Response-Suppress: All
X-Mailer: Zendesk Mailer
X-Zendesk-From-Account-Id: e533738
X-Zendesk-Email-Id: 01JY102R1GTZFH093MDX2616XY
DKIM-Signature:  v=1; a=rsa-sha256; c=relaxed/relaxed; d=zendesk.com;
 q=dns/txt; s=zendesk1; t=1750232819;
 bh=3mkYbWV/NdJhsQmabepOOHOBqImJcW2vS/n2iYN12D4=;
 h=date:from:reply-to:to:cc:message-id:in-reply-to:references:subject:mime-version:content-type:content-transfer-encoding;
 b=RLkoHEQnECZgZoEbPoV/G11N8AC0ntfDDgvZDVt8xbcMnUSHjXGNXSdJ/0+IoSX459Ib9RWqQlAGvWPQVdq4hQBhNKk5HJ52QlU/2FN1LJU/tobvyyhcteFG1r7dvLHYfFfIDqrpCYsTYC6syQwwCZxDj2ozt5ermYN2ZWx1iT2k6+dou/4z/3fRuDN+8xrs1fEdO8mNRQsFllpvXI1wxpae96jm/sOfgf6ciPxn6PWkbVzkkZBf1Q28lDp/50H7zQBcVBopc8KZJIoegfKz7cAFiFmZb5OwdObSyIHe0zWns/Qo0miI3Nl+GeAcI3kEBm/iccq6xEiBtJ0PDKPzVw==


----==_mimepart_68526ef34c036_6f157050ba
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear Info,=0D
=0D
Greetings of the day!=0D
=0D
We thank you for writing to us and acknowledge the receipt of your commun=
ication (Call/email) for Query::General Enquiry::Promotional Email/Spam/I=
nternal Email; Service Request number 432297 dated 17 June 2025 at 10:36=E2=
=80=AFpm IST.=0D
=0D
We have attempted to resolve the matter as per your requirement and have =
informed you the status of the same in our communication (Call / response=
 email). Please do track our response communication for any document/info=
rmation requirements and respond on the same email without changing the s=
ubject to avoid generation of multiple Service Request numbers for the sa=
me matter and for tracking complete correspondence.=0D
=0D
We wish to inform you this Service Request is being closed.=0D
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

----==_mimepart_68526ef34c036_6f157050ba
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
    <p dir=3D"ltr">Dear Info,</p><p dir=3D"ltr">Greetings of the day!</p>=
<p dir=3D"ltr">We thank you for writing to us and acknowledge the receipt=
 of your communication (Call/email) for Query::General Enquiry::Promotion=
al Email/Spam/Internal Email; Service Request number 432297 dated 17 June=
 2025 at 10:36=E2=80=AFpm IST.</p><p dir=3D"ltr">We have attempted to res=
olve the matter as per your requirement and have informed you the status =
of the same in our communication (Call / response email). Please do track=
 our response communication for any document/information requirements and=
 respond on the same email without changing the subject to avoid generati=
on of multiple Service Request numbers for the same matter and for tracki=
ng complete correspondence.</p><p dir=3D"ltr">We wish to inform you this =
Service Request is being closed.</p><p dir=3D"ltr">Once again thank you f=
or giving us an opportunity to assist you.</p><p dir=3D"ltr">Yours Sincer=
ely,<br>Customer Services Team</p>=0D
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

----==_mimepart_68526ef34c036_6f157050ba--
