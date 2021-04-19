Return-Path: <SRS0=IBTb=JQ=chelsio.com=rajur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64208C433B4
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 15:22:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3CF2261007; Mon, 19 Apr 2021 15:22:17 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2092.outbound.protection.outlook.com [40.107.93.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15486113C;
	Mon, 19 Apr 2021 15:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15486113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chelsio.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=rajur@chelsio.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBqkHQeZFrewxY4qK69qhSANQc7tlK9EffMDS3jkCrKa3RfLuKvgMkT7RN/JQ8khDSIeguTv+dJBP51jk+9vVaywLLGUUSCNf4ZxtU+Jrzecyj5GOI2B7lT5g1oQCg1NaKfvBlqgB9RN8EdN6DzWwYjGO1V6PBGnMovrvxW8KCp4qeZns7Lwbh+e8WKZh/FUH01+TzWiXWvGQ/w1TY5yDcpb8Fo7CEpTrjhCNHZkbDyyRSv9D2R9SWEw1Y8I4HubEXvj6MscYR3csSWx3o5m32SsxqyScT77TrjE6/rDp+hkIiTNOL0jhksG3OqUz3y+JomKGxd7H57euQ6wVRtgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i30NjjsBYSp1XMIosdfkQfWEjLuh99a8aLhgvZalZrI=;
 b=OZSEgt0cFidgzsbCCEdo68cIkDb7Qy4TRzJ1qufFsQDbFfBwwM1dUKf1wot6O+zJ2crQWwKCoCTJcXIPf6Cz8+2qEbjRRBXnIOyGxyXpdt/SzrLt0selKC1uhM9QN2ESYUSd6/VifEg67M0mVde5EGX5T4EF18Jl+lVuMH2r36VYYi3DpAdG3XP2W8rUMz2x0BRJFAaOgBMRbLgxVBz6Yj/tzE4Z9y7VNuZgRXytscCAkmn328FWpF9Ky+IT3yTjuvHVf7tRZWCEAuSXiaGD97RpA64NlIxIelSMgZ4UFIV8DDkg/8M8OghUqeYvummOXku3r+W/TVG3kcMICLFZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chelsio.com; dmarc=pass action=none header.from=chelsio.com;
 dkim=pass header.d=chelsio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chelsious.onmicrosoft.com; s=selector2-chelsious-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i30NjjsBYSp1XMIosdfkQfWEjLuh99a8aLhgvZalZrI=;
 b=akTTW+JGevQ64VnR/N2hUY/m/UYhXZW/RzIpzFCrFjOQRgcMekbQjkgS0RKCc0vguZk0zrxTHgfGv7UdMxdAitPYR/phKLdfasLuxF7P04qCPm4FNuY5Oz7JKw59/kBUZCauUN/jflNdfCB62egJxyT0Q0M121PzvU8TZ8GQkMg=
Received: from MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24)
 by MWHPR1201MB2477.namprd12.prod.outlook.com (2603:10b6:300:e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 15:22:15 +0000
Received: from MW3PR12MB4475.namprd12.prod.outlook.com
 ([fe80::f1fd:22ed:7fb5:983d]) by MW3PR12MB4475.namprd12.prod.outlook.com
 ([fe80::f1fd:22ed:7fb5:983d%9]) with mapi id 15.20.4042.018; Mon, 19 Apr 2021
 15:22:15 +0000
From: "Raju  Rangoju" <rajur@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ramaraju
 Yelavarthy <ramaraju@chelsio.com>, "Raju  Rangoju" <rajur@chelsio.com>, Rahul
 Lakkireddy <rahul.lakkireddy@chelsio.com>
Subject: pull request: linux-firmware: update cxgb4 firmware to 1.25.4.0
Thread-Topic: pull request: linux-firmware: update cxgb4 firmware to 1.25.4.0
Thread-Index: Adc1L+//vtmaYHvBQOuRuXNsMW8Hlg==
Date: Mon, 19 Apr 2021 15:22:14 +0000
Message-ID:
 <MW3PR12MB4475138F913DAE5A22325E0EBC499@MW3PR12MB4475.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=chelsio.com;
x-originating-ip: [175.101.22.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5831515-21f9-4128-c889-08d90346e985
x-ms-traffictypediagnostic: MWHPR1201MB2477:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <MWHPR1201MB2477B367F05DAE7F459BCB22BC499@MWHPR1201MB2477.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /THHlVhfAuneb7B8cnJmc3/i3Nr6tu7dLQoSG+DQr1My2iFAmcVfdqUKmX/eYwFFnyeKpQUyECRLgPBOcdmLDurY4pErrShwsJH9OPWYpzJkFUx/7I44El8O0Alcg/kXFDY8pf1J6qwfF8sI8cEZBZM5qyZ9tFAjhgiZLCfUAh/kxNFqgjcYgYDCqtdyDaP7Pw/AAdoAcQVH16ZWOrSfhu0eXEOmjopMDqPG/5/yoZKsDvUMr2DHZdgVsvKATFl8mDRwZX2vPiNFRFIq2vih+HoS1BPsT7i9DOeTcHzT5jshoMURSxIyzcWKvRd7G8tc2Ffhz0ogWFcZwGAzC2Xcm9lTQsrxBTJseasTaJk/qq9nmYEo0d1dqaI9Fe5KOpNcW16LWmhpQ4zghQpQstkPV/A3Q6NoO45uw520+9pCAi4RoZ+1xc6w/ye5ybVMwbARicp2KZmO+x8mYPfLpAV5c2V5VCmmQZEYxd1TZAZNffGmhZTOtm/kQEbBQJFqd7K1DB3/OcValmHcRz+8CUtbzYnkn+R0ICJBDvIMUl5LPC6rfFMYriu/QrnKuql4vZ++16OBgQcpc9VK2by0Yp17x0/IV0mceR09D6M+We4VIwo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4475.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(376002)(39830400003)(122000001)(52536014)(478600001)(64756008)(83380400001)(66556008)(66476007)(9686003)(66446008)(76116006)(66946007)(71200400001)(7696005)(38100700002)(26005)(2906002)(6506007)(86362001)(107886003)(8676002)(110136005)(5660300002)(54906003)(186003)(55016002)(15650500001)(9326002)(316002)(33656002)(8936002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?FylSW61DqFLt1o3kn55rSawNkOIKp8+SYDLP3qEIFhTkFxwUagPBrudA5+Px?=
 =?us-ascii?Q?sZ2bhH95znnZqnfc0qP/kn1w1jA/qb5YIVheTV0hi/sOFN1PmsapI+afYoJW?=
 =?us-ascii?Q?+ldKPkgAlYrkU1Yn2wrUUY1tpDdobqLbnXE9PA880Q7m0xKxZc1KTDVFxhnU?=
 =?us-ascii?Q?RZd3izh/CZB+rlMkkHoajdmFQfr3+3czo3KKS5kpTDg5OD0TL23TIAwWg3TD?=
 =?us-ascii?Q?L4PiRoKms23b6uARjU5IkQXdrlxuftmfW/p62BRoELWezuXlFmSra/8/i7w7?=
 =?us-ascii?Q?uCg1ZbaLO9FwLCdRKb1dGWP05IPr8xf2KfrYCK5YS4eXCj2DeuaUSomKombv?=
 =?us-ascii?Q?VS4snPWjTnkAgi7gz9CynS60/ZPok1waU3P2/WwCQ1h4K7oI5kNOhMGwnUE3?=
 =?us-ascii?Q?4BNyf0Qlup1BlY37AM5pU6CLYGl3BRWeJD9LLG7U4cNZn7IyuB+5UUGfFkzN?=
 =?us-ascii?Q?afngH9ZDsOcVgkk83EDACI8TCIA4djluyApGvEUIcd2LQDV+J8/qxLuKup+B?=
 =?us-ascii?Q?eAuAEOyL3NiOE7gcADVBtCYt3aArPaNLsMJaKP1tWfgs2WqwcQDw7NM+juhn?=
 =?us-ascii?Q?XwNgx3lUAlOvAaVBP/Qbpz/pktHMRAIo2yaPHgB56QnWQYf+O1XSvQy4sPvm?=
 =?us-ascii?Q?kO6/9EOUdKOoUzCVeg9wjFxhYVOegHunnzulJ42mEM8a44P89Lk5TwPzI/eV?=
 =?us-ascii?Q?9uqG5h3yJgxkRX/5+V3hIvx3R6pOHgn+r8DXwvHvlo4hiYQ7bNi1DXenFymH?=
 =?us-ascii?Q?gN8wkZdejnYBz47ccGL+vaxaIxTHyuchVVliJHRiYUc6WqVsH1mIF4OLfTdl?=
 =?us-ascii?Q?iuth9/VAgaFIXklTk6zG9TUKfrdR8qX53W7AXX3tuFzChnmi3yGemcLiI+qN?=
 =?us-ascii?Q?vG2LivfDweuS3lt551T3OQGkLI6KfofA4tf+Z3xcM3+I/Fh17llIEgK/4g/v?=
 =?us-ascii?Q?P0tgA7TrPiHhevC375U7CEv5gf6TCiZhKi1dXcx/IBgClfagNC9kmSmwxgtE?=
 =?us-ascii?Q?VoCEh3MTuUz3oNycozSAUymzwTEGpLnCCCUJScp4bDIKaJ3/C4/DaGsgmEFo?=
 =?us-ascii?Q?a50gYu2LBP9MRSOzXvaE5oFUGaKz+ElHZj5oq/Wo+SBvrSAT22vqR5ZQ7ti7?=
 =?us-ascii?Q?qe3GWxCltkZWUcgeZdtGXl8SReFVyK30VAiWr/0+M5ouyFHtJC+0FZVc/bWe?=
 =?us-ascii?Q?pX+ZKeEURrPNgPVbXqdfd8upU35sTeJ/02vyz5sCs5u7KGd7e2dZx+MIriMR?=
 =?us-ascii?Q?yal8RuE4AZJikp1/aeCqnXJERrm67b3H+ajauykHeBdl7MA9iCrS8MTucP7H?=
 =?us-ascii?Q?7b33ox1BjR0YNt0Fqg1IqPfC?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB4475138F913DAE5A22325E0EBC499MW3PR12MB4475namp_"
MIME-Version: 1.0
X-OriginatorOrg: chelsio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4475.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5831515-21f9-4128-c889-08d90346e985
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 15:22:14.9332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 065db76d-a7ae-4c60-b78a-501e8fc17095
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ZD6tePxuXIpFzSu42AX85ZkhWXSUnUVVC/4taO0gtklIwa3fXnEVkQf2i9tQyh8NlLLFtqpSugqep6MsBtLlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2477

--_000_MW3PR12MB4475138F913DAE5A22325E0EBC499MW3PR12MB4475namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Josh,



I've adjusted the actual file entries now. Can you please pull the new firm=
ware from the following URL?

git://git.chelsio.net/pub/git/linux-firmware.git for-upstream



Thanks,

Raju



The following changes since commit f66adc3cde7ee0607ea9198ca460031d3564fb33=
:



  Merge branch 'main' of gitolite.kernel.org:/pub/scm/linux/kernel/git/maks=
/linux-firmware into main (2021-04-19 10:07:57 -0400)



are available in the git repository at:





  git://git.chelsio.net/pub/git/linux-firmware.git for-upstream



for you to fetch changes up to 940b7f42d45de247eb9a2c4874985a400cb936c4:



  cxgb4: Update firmware to revision 1.25.4.0 (2021-04-19 07:44:20 -0700)



----------------------------------------------------------------

Raju Rangoju (1):

      cxgb4: Update firmware to revision 1.25.4.0



WHENCE                              |  12 ++++++------

cxgb4/configs/t6-config-default.txt |   8 ++++++--

cxgb4/t4fw-1.24.17.0.bin            | Bin 568832 -> 0 bytes

cxgb4/t4fw-1.25.4.0.bin             | Bin 0 -> 569856 bytes

cxgb4/t5fw-1.24.17.0.bin            | Bin 672768 -> 0 bytes

cxgb4/t5fw-1.25.4.0.bin             | Bin 0 -> 675328 bytes

cxgb4/t6fw-1.24.17.0.bin            | Bin 727040 -> 0 bytes

cxgb4/t6fw-1.25.4.0.bin             | Bin 0 -> 728064 bytes

8 files changed, 12 insertions(+), 8 deletions(-)

delete mode 100644 cxgb4/t4fw-1.24.17.0.bin

create mode 100644 cxgb4/t4fw-1.25.4.0.bin

delete mode 100644 cxgb4/t5fw-1.24.17.0.bin

create mode 100644 cxgb4/t5fw-1.25.4.0.bin

delete mode 100644 cxgb4/t6fw-1.24.17.0.bin

create mode 100644 cxgb4/t6fw-1.25.4.0.bin


--_000_MW3PR12MB4475138F913DAE5A22325E0EBC499MW3PR12MB4475namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi Josh,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I&#8217;ve adjusted the actual file entries now. =
Can you please pull the new firmware from the following URL?<o:p></o:p></p>
<p class=3D"MsoPlainText">git://git.chelsio.net/pub/git/linux-firmware.git =
for-upstream<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText">Raju<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">The following changes since commit f66adc3cde7ee0=
607ea9198ca460031d3564fb33:<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp; Merge branch 'main' of gitolite.kernel.org=
:/pub/scm/linux/kernel/git/maks/linux-firmware into main (2021-04-19 10:07:=
57 -0400)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">are available in the git repository at:<o:p></o:p=
></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp; git://git.chelsio.net/pub/git/linux-firmwa=
re.git for-upstream<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">for you to fetch changes up to 940b7f42d45de247eb=
9a2c4874985a400cb936c4:<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp; cxgb4: Update firmware to revision 1.25.4.=
0 (2021-04-19 07:44:20 -0700)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-------------------------------------------------=
---------------<o:p></o:p></p>
<p class=3D"MsoPlainText">Raju Rangoju (1):<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cxgb4: Update firm=
ware to revision 1.25.4.0<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 12 ++++++-=
-----<o:p></o:p></p>
<p class=3D"MsoPlainText">cxgb4/configs/t6-config-default.txt |&nbsp;&nbsp;=
 8 ++++++--<o:p></o:p></p>
<p class=3D"MsoPlainText">cxgb4/t4fw-1.24.17.0.bin&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 568832 -&gt; 0 bytes<o:p></=
o:p></p>
<p class=3D"MsoPlainText">cxgb4/t4fw-1.25.4.0.bin&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;| Bin 0 -&gt; 569856 bytes<o=
:p></o:p></p>
<p class=3D"MsoPlainText">cxgb4/t5fw-1.24.17.0.bin&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 672768 -&gt; 0 bytes<o:p></=
o:p></p>
<p class=3D"MsoPlainText">cxgb4/t5fw-1.25.4.0.bin&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 675328 bytes<o=
:p></o:p></p>
<p class=3D"MsoPlainText">cxgb4/t6fw-1.24.17.0.bin&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 727040 -&gt; 0 bytes<o:p></=
o:p></p>
<p class=3D"MsoPlainText">cxgb4/t6fw-1.25.4.0.bin&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 728064 bytes<o=
:p></o:p></p>
<p class=3D"MsoPlainText">8 files changed, 12 insertions(+), 8 deletions(-)=
<o:p></o:p></p>
<p class=3D"MsoPlainText">delete mode 100644 cxgb4/t4fw-1.24.17.0.bin<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">create mode 100644 cxgb4/t4fw-1.25.4.0.bin<o:p></=
o:p></p>
<p class=3D"MsoPlainText">delete mode 100644 cxgb4/t5fw-1.24.17.0.bin<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">create mode 100644 cxgb4/t5fw-1.25.4.0.bin<o:p></=
o:p></p>
<p class=3D"MsoPlainText">delete mode 100644 cxgb4/t6fw-1.24.17.0.bin<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">create mode 100644 cxgb4/t6fw-1.25.4.0.bin<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MW3PR12MB4475138F913DAE5A22325E0EBC499MW3PR12MB4475namp_--
