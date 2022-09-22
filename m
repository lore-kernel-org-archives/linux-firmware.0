Return-Path: <SRS0=io7e=ZZ=tradeshowvisitors.com=diana.christopher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059F6C6FA82
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Sep 2022 14:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEE82C433D7; Thu, 22 Sep 2022 14:19:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C542EC433C1
	for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 14:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C542EC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tradeshowvisitors.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=tradeshowvisitors.com
Received: by mail-lf1-f48.google.com with SMTP id o2so14915582lfc.10
        for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tradeshowvisitors-com.20210112.gappssmtp.com; s=20210112;
        h=content-language:thread-index:importance:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:from:to:cc:subject:date;
        bh=j7PKTqmQuVIrhAqMdTHYsshoZG6yyS2AXMAoEY1AGyM=;
        b=N5ExlDv9qqPcZ58b+2fbbMVcCQtpiSmX+X1KQDclsif3mEfQtB4GknuAezNf76SsLD
         riCCOQeq7RMXcIn1amYteecZNo49THGYEdNj800oeFNAdCzzWpH3Y3j/DN4J80vOMkMj
         aDKOLsRCFsahOTXUKjAZNl93dKlPZah2X59IR44n9QUdIYPN5aC2SPCOOMqvEtPRNOqY
         +6enmC876AiGk+Mgn/JsdI5PFOLYi8j30fjsVYB8b02DbPEgbcEWXJLt0giECtxx31Ql
         2w1F3cjpvGYbkCuWjEAGoA45oroyp7/XV0hiLjwpmcuSi7RcePdMMqPlO/nGhfVwWeqK
         ThQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:thread-index:importance:mime-version:message-id
         :date:subject:in-reply-to:references:to:from:x-gm-message-state:from
         :to:cc:subject:date;
        bh=j7PKTqmQuVIrhAqMdTHYsshoZG6yyS2AXMAoEY1AGyM=;
        b=xoi1wF1UHIzb22wlP78Ecax1pewgHMQPxhcpH6YimkfaXk/Un74JRv99bEgxQ+nxgJ
         Wm9dQoemoGhH35zSUsaVVeNxgs8VFnDl1wrz3tCnNYwdfYxLmCsdusTBnxLgwoy3zotR
         jbNp2r608YgifDJdQrdl+gpWMC5xbQ2F0iN4pyNu+SpV43/81vMryXUbFcWPaw/J8/Ho
         n7nZqo2T8f3hO+EvD3369n91eqgLLZOpFurSzFfjupol6GijzmRgcy/9yhN/4YxbNFPI
         YJgQcntB4TGc9qnvoXctK34r6cs+nWWtfe0S1H1w04x7n8NYN2enWmAP6+qWesksywNg
         rxCg==
X-Gm-Message-State: ACrzQf0B35rlxI/uUSUZgaXnPkOSD6gF0jfw7qdLjunm4X1D3OsouMD1
	xzT5c+3N/PJ804RCCMMNnfjVq+MldDeeww==
X-Google-Smtp-Source: AMsMyM5ODZUxtd+q2/yphiHkqy70tw5AqOrdPajA4syweDjM4t/+5KeeH+pWFMhh2TemxxPpxm2I0Q==
X-Received: by 2002:a05:6512:2308:b0:497:a290:cef6 with SMTP id o8-20020a056512230800b00497a290cef6mr1396301lfu.488.1663856343338;
        Thu, 22 Sep 2022 07:19:03 -0700 (PDT)
Received: from UserPC ([49.207.204.37])
        by smtp.gmail.com with ESMTPSA id p7-20020a056512138700b0049482adb3basm961960lfa.63.2022.09.22.07.19.01
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:19:02 -0700 (PDT)
From: "Diana Christopher" <diana.christopher@tradeshowvisitors.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
References: 
In-Reply-To: 
Subject: NAB Show 2022 Attendees Info
Date: Thu, 22 Sep 2022 09:15:47 -0500
Message-ID: <040a01d8ce8e$4509fcf0$cf1df6d0$@tradeshowvisitors.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_040B_01D8CE64.5C34DF50"
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 15.0
Importance: High
Thread-Index: AdjN5IfA+7IF+jt5QCqj68NzJvyJJgAqGC/QAAAAE1AAAAANQAAAAA7QAAAADXAAAAANkAAAAA0wAAAADlAAAAAMgAAAAAtQAAAADBAAAAAMEAAAAAsQAAAADNAAAAAL0AAAAAygAAAAC2AAAAAMIAAAAAsgAAAADSAAAAALEAAAAAwQAAAADqAAAAAQcAAAAA1gAAAADjAAAAAO8AAAAA6AAAAAD1AAAAAOEAAAAA7gAAAADqAAAAAMoAAAAAygAAAADMAAAAANwAAAAAzAAAAADPAAAAANEAAAAAxAAAAADEAAAAAMQAAAAA2gAAAADzAAAAAMwAAAABjAAAAAExAAAAATsAAAABVwAAAAFDAAAAAVYAAAABYgAAAAFIAAAAAVcAAAABRwAAAAFTAAAAATkAAAABQgAAAAFeAAAAAUoAAAABRwAAAAFWAAAAAVYAAAABWA
Content-Language: en-in

This is a multipart message in MIME format.

------=_NextPart_000_040B_01D8CE64.5C34DF50
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

Would you be interested in acquiring the pre-registered attendee mailing
list from National Association of Broadcasters Show 2022?

 

Attendees: Distributor/ Dealer, Representatives, Industry innovators, Tech
visionaries, Broadcasters, Educators, Manufacturers, Sales & Marketing
Corporate Leader, Technical Engineers, and more....

 

Please pick the number which describes you:

 

1. Yes Interested, send me pricing and other data information.

2. Opt-out

 

Thanks,

Diana Christopher | Marketing Coordinator

 


------=_NextPart_000_040B_01D8CE64.5C34DF50
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
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
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Would you be interested in acquiring the =
pre-registered attendee mailing list from </span><b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'>National =
Association of Broadcasters Show 2022?</span></b><span =
style=3D'color:black;mso-fareast-language:EN-IN'><o:p></o:p></span></p><p=
 class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Attendees:</span></b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'> </span><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%;mso-fareast-language:EN-IN'>Distributor/ =
Dealer, Representatives, Industry innovators, Tech visionaries, =
Broadcasters, Educators, Manufacturers, Sales &amp; Marketing Corporate =
Leader, Technical Engineers, and more....</span><span =
style=3D'color:black;mso-fareast-language:EN-IN'><o:p></o:p></span></p><p=
 class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Please pick the number which describes =
you:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>1. Yes Interested, send me pricing and other =
data information.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>2. Opt-out<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Thanks,<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F4E79;mso-style-textfill-fill-color:#1F4E79;mso-style-te=
xtfill-fill-alpha:100.0%'>Diana Christopher | Marketing =
Coordinator<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_040B_01D8CE64.5C34DF50--

