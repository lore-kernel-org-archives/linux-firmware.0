Return-Path: <SRS0=sTQH=V2=verified-infosolution.com=cindi.reynolds@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF1CC433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 18 May 2022 23:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D00BC385A9; Wed, 18 May 2022 23:06:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DB0FC385A5
	for <linux-firmware@kernel.org>; Wed, 18 May 2022 23:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DB0FC385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=verified-infosolution.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=verified-infosolution.com
Received: by mail-pf1-f180.google.com with SMTP id p8so3483993pfh.8
        for <linux-firmware@kernel.org>; Wed, 18 May 2022 16:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verified-infosolution.com; s=google;
        h=return-receipt-to:from:to:subject:date:message-id:mime-version
         :importance:thread-index:content-language
         :disposition-notification-to;
        bh=AjhDrXEf5NzWeAVYaajOkk0QTBePcL0xttfeyPgwipY=;
        b=YjDERt2LTTObVZojzZ0uyYc76RQhJqK2hnBg1MIifdEwjPKo52xVzAuewD6OlNxeLG
         z6m3su64CvmDeYX76qJQVhsWXI5Xr50gPqLOsnNQnrghLBGoXOqbv5+sqnlAxAHIr5uC
         yY0IHH1VLJboo/lPmH7Tn/2IRRHG1/3DGe5BFM7xJuMDhxTaWMlpaiYfTlLQBCG2OUo/
         PA7InM0yzQ2CZrVuW/0z9aBwIjlKPcz+Kqe+6wBOi037r25/enKUNF9WEe1hVv0pgGBy
         1BWaR3lL/M1R+p1wrA+0dD+BtLtq10fWTO3qunLoiWq1Rmju859kGAqfQWFRCKmmL5dC
         jEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:return-receipt-to:from:to:subject:date
         :message-id:mime-version:importance:thread-index:content-language
         :disposition-notification-to;
        bh=AjhDrXEf5NzWeAVYaajOkk0QTBePcL0xttfeyPgwipY=;
        b=JsibQnpEfq6Fq8cGi0h+TefPaRyyQe5nsW3tuMgZBXG2aM+EcLYTAomGnTyZ4pzaGc
         9D01jxSWN1gUyMCroXXxZZrd7m/ooWDLb9jdAXfwFEV8XNj6S0Xp8I1fH+SSDJkl+aTW
         Fis4hIdsxzR9vfqSfo2Z/NasxkuFnF5RcBE1X0IbFzZxQ2OGBt41ogKglVXCDOabkTso
         W7poxyWnaM1whhcGlTNuLEtYIfUnfn0+PZAZgHBA4VNv/4F/xA49r3K+l4DZAg+do6sW
         Vgo2mdr8zzXojRbNiFIFRN4Pw5JPF4Ol6sMVmNlZ0XxwwDFXhiBwMk68wbvn1or5B7WO
         0zJw==
X-Gm-Message-State: AOAM53353zJ7K3TyDJ5BXl17owsLexJ4Hckmi04PUUErtfp3O3pmpWb1
	9IulSQZJaV/hqkx46ZbVCNXdNsLwW/qelw==
X-Google-Smtp-Source: ABdhPJzTCmbE09kMhhWad4a7Xy/HHXSeHRiVGgbujCnHkcULORNUMlQ2TUAc7h9LiotQ+OXIZRbrWw==
X-Received: by 2002:a63:4549:0:b0:3db:5130:d269 with SMTP id u9-20020a634549000000b003db5130d269mr1425972pgk.101.1652915164694;
        Wed, 18 May 2022 16:06:04 -0700 (PDT)
Received: from WS1013 ([119.82.123.26])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902eac300b0015e8d4eb2b9sm2245126pld.259.2022.05.18.16.06.03
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 May 2022 16:06:04 -0700 (PDT)
From: "Cindi Reynolds" <cindi.reynolds@verified-infosolution.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: Update on RSA Conference 2022
Date: Thu, 19 May 2022 04:37:16 +0530
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAEEw3tukPC9JkqsWFo+aCOLCgAAAEAAAAHma7u1NxrBJukk1e8MIz1MBAAAAAA==@verified-infosolution.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_06F8_01D86B3A.222D9F00"
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 16.0
Importance: High
Thread-Index: AdhrC+30tpdQ6OmAR3iRrPxfe8AYTQ==
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_06F8_01D86B3A.222D9F00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

We are selling attendees list of RSA Conference.

 

We have verified contact database of people who are going to attend RSA
Conference 2022.

 

Date: 06 - 09 Jun 2022

At: San Francisco, USA

Total Attendees: 39,950 from 140 countries With Emails and Phone Numbers

 

Each record will contain details like: Contact Name, Title, Phone Number,
Physical address, State/City, Company Name, Company URL and most importantly
verified email addresses.

 

All the contact counts mention above are opt in contacts and verified by our
energetic data team and are GDPR complaint with all the rules and
regulations with 100% opt-in contacts.

 

If you are interested to get the list, please let me know your thoughts, so
that I can send you the pricing.

 

Thank you and I look forward to hearing from you.

 

Best Regards,

Cindi Reynolds - Database Manager 

 
If you do not wish to receive future emails from us, please reply as 'leave
out'

 

 

 

 


------=_NextPart_000_06F8_01D86B3A.222D9F00
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
style=3D'word-wrap:break-word'><div class=3DWordSection1><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span style=3D'font-size:11.5pt'>We are selling =
attendees list of <b>RSA Conference</b>.<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span style=3D'font-size:11.5pt'>We have verified =
contact database of people who are going to attend <b>RSA Conference =
2022</b>.<o:p></o:p></span></p><p class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><b><span =
style=3D'font-size:11.5pt'>Date:</span></b><span =
style=3D'font-size:11.5pt'> 06 - 09 Jun 2022<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><b><span =
style=3D'font-size:11.5pt'>At:</span></b><span =
style=3D'font-size:11.5pt'> San =
Francisco,&nbsp;USA<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><b><span style=3D'font-size:11.5pt'>Total =
Attendees:</span></b><span style=3D'font-size:11.5pt'> <b>39,950 from =
140 countries</b> With Emails and Phone Numbers<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><b><span style=3D'font-size:11.5pt'>Each record =
will contain details like</span></b><span style=3D'font-size:11.5pt'>: =
Contact Name, Title, Phone Number, Physical address, State/City, Company =
Name, Company URL and most importantly verified email =
addresses.<o:p></o:p></span></p><p class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span style=3D'font-size:11.5pt'>All the contact =
counts mention above are <b>opt in contacts and verified</b> <b>by =
our</b> <b>energetic data team</b> and are <b>GDPR complaint</b> with =
all the <b>rules and regulations with 100% opt-in =
contacts.<o:p></o:p></b></span></p><p class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span style=3D'font-size:11.5pt'>If you are =
interested to get the list, please let me know your thoughts, so that I =
can send you the pricing.<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span style=3D'font-size:11.5pt'>Thank you and I =
look forward to hearing from you.<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span style=3D'font-size:11.5pt'>Best =
Regards,<o:p></o:p></span></p><p class=3DMsoNoSpacing><b><span =
style=3D'font-size:11.5pt'>Cindi Reynolds </span></b><span =
style=3D'font-size:11.5pt'>- Database Manager <o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If you do not wish to receive future =
emails from us, please reply as 'leave out'<o:p></o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNoSpacing><span =
style=3D'font-size:11.5pt'><o:p>&nbsp;</o:p></span></p></div></body></htm=
l>
------=_NextPart_000_06F8_01D86B3A.222D9F00--

