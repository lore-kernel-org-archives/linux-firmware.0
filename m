Return-Path: <SRS0=wfkD=UA=gmail.com=ramkeshthakur748f@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ED6E77188
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Jan 2025 14:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DB3EC4CEDD; Wed,  8 Jan 2025 14:59:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA34CC4CED3
	for <linux-firmware@kernel.org>; Wed,  8 Jan 2025 14:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA34CC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2161eb95317so257965575ad.1
        for <linux-firmware@kernel.org>; Wed, 08 Jan 2025 06:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736348356; x=1736953156; darn=kernel.org;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QwjavT+bLtQSJOCez3wFSLTsDNDGSNpKEzB1v8X5vhM=;
        b=K4vECY8g5MMBrSXlM66jcMgGx797rAt0bQIv6+iycCVGxV/kh9k6TpfTtLvIPaXmqU
         q7wMnXc2waNV2bPajmn4sROGDglciPQhw3RxzgybWlQylzqLCP3cpY6QFLdBgnqDnQag
         1bFWgi28qMuQRRwvsym7eH1zoN296JQDuPg8kUjPRwrk7VpjuiCtn4IlTbtvzeDIlNtB
         BMphfr/2sddKqvsDTMGyL6b5N7I64BQrvjdjPb12/hFEsFs0lE//O9vGjI6DtasmXtIt
         oPQ2AUD13IiGVTRz3arRK1KN3Lpal9CuAIT0JVYedDnPTxXUSrymSYhoh3buzZwDjMtL
         8xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736348356; x=1736953156;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwjavT+bLtQSJOCez3wFSLTsDNDGSNpKEzB1v8X5vhM=;
        b=HnfPVR7DsNGhIWqxiDAxdutr3ZQg1gxm4sFTFf03I7H773V56XQENKOb6PHktSX2r3
         p/JQQnWO7OniivSylSkOB9GMdt7bGZfX+q6dnN36piI9kK6y4xUA6RpcWdn9ucUxBMZC
         tUPjRDdpO8cHyxvqZvBv03PltlWoGSVzpplcz7nfwt4YqbRQE7CazDwVI9heZw3bpdSW
         S9w3FDHB9/3aqn8T91aT39dyU9DA8kmd/w6IP8gH1hupf3/Zkg1Wi6tdmJuvUqXi4mNY
         Uo5OGeMyYiro/sUXv4ep/nI7qw1G9vo6sWaW0KJX3A/Ch1jR1KZFgKz6X95cujlQYxax
         3COQ==
X-Gm-Message-State: AOJu0YyVI62MSZan8ym9Rc9gPRWcqfuB1R1g+C1g5YW1mfRyFtZwc0Ve
	nRUfUBlD6KDEcbeKahsfOntTqzMIwFhsPPq5RcUImmRtKeEaz9Pc2VK90g==
X-Gm-Gg: ASbGncvkWCb4/qMH32d/u7raE5AwIT5YaG6yGxtJ70cLbTUm1YzT9ZH7b8qOF0Lm9/6
	sBECt7K73USzQqG68M1nqFSy8SjhrwNXMBo5eNV04D9y1elRZcY1IfFFbLpN1F1hB3sWGQzPhXN
	qxP31eLOxcRTx+sD9Tjbd3oPKZL4+34BhRUe67uGyHbykFZ3HT6OtNl7xqMRGIuhpk2HozDK89l
	8gHAL4jNIsdXjmZlU5Pb12SUT11TJUOAKttr5cPOrr+PyMyG9FvVstdfVQzz4yUnccuE4sX/vQV
	XqBE2w==
X-Google-Smtp-Source: AGHT+IHu3mQfnapwb3oDx3OQwx8fYLcgq41ycCbAwDLBaEQjEhCu7l9FDE7VuYU1W/bZ9bk0YeqwmA==
X-Received: by 2002:a05:6a20:e687:b0:1e5:b082:e38f with SMTP id adf61e73a8af0-1e88d0edb23mr5335205637.45.1736348355879;
        Wed, 08 Jan 2025 06:59:15 -0800 (PST)
Received: from DESKTOPN6C1R4E ([106.207.13.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81622dsm35295342b3a.30.2025.01.08.06.59.14
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:59:15 -0800 (PST)
From: "Ramkesh" <ramkeshthakur748f@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: =?us-ascii?Q?Virtual_Assistant_Services.?=
Date: Wed, 8 Jan 2025 20:28:33 +0530
Message-ID: <042e01db61dd$e2220a70$a6661f50$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_042F_01DB620B.FBDBA600"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adth2z/KKIfiCIUBQUe3hsnU3k26aQ==
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_042F_01DB620B.FBDBA600
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

I sent you a mail a few days ago regarding Virtual Assistant Services. But I
have not received any response from you.

 

This is just a follow up in case you missed the previous email.

 

I am waiting for your feedback.

Thank you

 

  _____  

Sent: Friday, January 03, 2025 16:53
To: 'linux-firmware@kernel.org'
Subject: Re: Effective Virtual Assistant !

Hi,linux-firmware@kernel.org

 

I would like to connect with you to discuss Virtual Assistance (Remote
Employee) we provide.

 

Our Virtual Assistance is responsible for appointment setting and
confirmations, calendar management, data entry, and any other task that is
thrown at them.

 

Virtual/ Administrative works: -

1. Cold calling / Set up appointments

2. Email management / Correspondence

3. Lead Generation / Digital Marketing

4. Social Media Management / Facebook Ads Manager

5. Website Research and Data Collection

6. Run and respond to text campaigns

 

Shall we schedule a quick call or a Zoom call for further discussion? 

 

Thanks,

Ramkesh


------=_NextPart_000_042F_01DB620B.FBDBA600
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><!--[if !mso]><style>v\:* =
{behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:0in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:10.0pt;
	line-height:115%;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:298189209;
	mso-list-type:hybrid;
	mso-list-template-ids:-43979112 67698689 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:393937848;
	mso-list-type:hybrid;
	mso-list-template-ids:-742466870 134807553 134807555 134807557 =
134807553 134807555 134807557 134807553 134807555 134807557;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l2
	{mso-list-id:1300375211;
	mso-list-type:hybrid;
	mso-list-template-ids:1039707976 67698689 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l3
	{mso-list-id:1351226792;
	mso-list-type:hybrid;
	mso-list-template-ids:-549279768 67698689 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l4
	{mso-list-id:1537230510;
	mso-list-type:hybrid;
	mso-list-template-ids:1978579200 67698689 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l4:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l4:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l4:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l4:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l4:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l4:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l4:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l4:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l5
	{mso-list-id:1687245792;
	mso-list-type:hybrid;
	mso-list-template-ids:-267988790 67698689 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l5:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l5:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l5:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l5:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l5:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l5:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l5:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l5:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l6
	{mso-list-id:2041936273;
	mso-list-template-ids:104632428;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level1 lfo1
	{mso-level-start-at:0;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p style=3D'margin:0in;background:white'><span =
style=3D'font-family:"Arial",sans-serif;color:#222222'>Hi,<o:p></o:p></sp=
an></p><p style=3D'margin:0in;background:white'><span =
style=3D'font-family:"Arial",sans-serif;color:#222222'>&nbsp;<o:p></o:p><=
/span></p><p style=3D'margin:0in;background:white'><span =
style=3D'font-family:"Arial",sans-serif;color:#222222'>I sent you a mail =
a few days ago regarding Virtual Assistant Services. But I have not =
received any response from you.<o:p></o:p></span></p><p =
style=3D'margin:0in;background:white'><span =
style=3D'font-family:"Arial",sans-serif;color:#222222'>&nbsp;<o:p></o:p><=
/span></p><p style=3D'margin:0in;background:white'><span =
style=3D'font-family:"Arial",sans-serif;color:#222222'>This is just a =
follow up in case you missed the previous email.<o:p></o:p></span></p><p =
style=3D'margin:0in;background:white'><span =
style=3D'font-family:"Arial",sans-serif;color:#222222'>&nbsp;<o:p></o:p><=
/span></p><p style=3D'margin:0in;background:white'><span =
style=3D'font-family:"Arial",sans-serif;color:#222222'>I am waiting for =
your feedback.<o:p></o:p></span></p><p =
style=3D'margin:0in;background:white'><b><span =
style=3D'font-size:10.0pt;font-family:"Verdana",sans-serif;color:black;ba=
ckground:white'>Thank you<o:p></o:p></span></b></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:normal'><o:p>&nbsp;</o:p></p><div =
class=3DMsoNormal align=3Dcenter =
style=3D'margin-bottom:0in;text-align:center;line-height:normal'><b><span=
 style=3D'font-size:10.0pt;font-family:"Tahoma",sans-serif'><hr size=3D2 =
width=3D"100%" align=3Dcenter></span></b></div><p =
class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;line-height:115%;font-family:"Tahoma",sans-seri=
f'>Sent:</span></b><span =
style=3D'font-size:10.0pt;line-height:115%;font-family:"Tahoma",sans-seri=
f'> <a name=3D"_Hlk160635850">Friday, January 03, 2025 =
16:53</a><br><b>To:</b> =
'linux-firmware@kernel.org'<br><b>Subject:</b><span =
style=3D'color:black'> Re: Effective Virtual Assistant =
!<o:p></o:p></span></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:normal;background:white'><span =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>H=
i,linux-firmware@kernel.org<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:normal;background:white'><span =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>&=
nbsp;<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>I=
 would like to connect with you to discuss&nbsp;<b>Virtual =
Assistance</b>&nbsp;(Remote Employee) we provide.</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>&=
nbsp;</span><span style=3D'color:#222222'><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>O=
ur Virtual Assistance is responsible for&nbsp;<b>appointment setting and =
confirmations, calendar management, data entry, and any other =
task</b>&nbsp;that is thrown at them.</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>&=
nbsp;</span><span style=3D'color:#222222'><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>V=
irtual/ Administrative works: -</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>1=
. Cold calling / Set up appointments</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>2=
. Email management / Correspondence</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>3=
. Lead Generation / Digital Marketing</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>4=
. Social Media Management / Facebook Ads Manager</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>5=
. Website Research and Data Collection</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>6=
. Run and respond to text campaigns</span><span =
style=3D'color:#222222'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>&=
nbsp;</span><span style=3D'color:#222222'><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:11.75pt;background:white'><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222;ba=
ckground:yellow'>Shall we schedule a quick call or a Zoom call for =
further discussion?</span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>&=
nbsp;</span><span style=3D'color:#222222'><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:normal;background:white'><b><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black'>&nb=
sp;</span></b><span style=3D'color:#222222'><o:p></o:p></span></p><p =
class=3DMsoNormal =
style=3D'margin-bottom:0in;line-height:normal;background:white'><b><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:black'>Tha=
nks,</span></b><span style=3D'color:#222222'><o:p></o:p></span></p><p =
class=3DMsoNoSpacing><b><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#222222'>R=
amkesh</span></b><span lang=3DEN-GB =
style=3D'font-size:12.0pt'><o:p></o:p></span></p></div></body></html>
------=_NextPart_000_042F_01DB620B.FBDBA600--

