Return-Path: <SRS0=bU0q=YN=quicinc.com=quic_smagar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C9BC19F2D
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Aug 2022 09:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D828FC433D7; Tue,  9 Aug 2022 09:18:36 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA37FC433C1;
	Tue,  9 Aug 2022 09:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BA37FC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2798hUk0012683;
	Tue, 9 Aug 2022 09:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=I0OmPf3bINdFgECktYG3QnZ7AEav3c0TtkNU8pI3lSg=;
 b=Ns0ZIxCDWvWKIgcbtg3u4zZi+MfwVfH3Jtox9a4ZpMI2JrUKhQDqxb6jqp6eXKYEcXqQ
 o1rO+oUL9qBpd3ESrKb7mPKnd2qyew2+FyLniih7tbhOSYwPZM9fsjKW956LDNvyIbD9
 +gaBZ8OVYwSLhjlJTO3eaVxBE4R6/zxXB0GFIXP5nAkALVMYZouVBiLSJg1SorvKjLzv
 tpRJoDJlwBkS8FzPrXCfuZI/ykcWwx6SFFyB3bEImM0E0SKx33T6LNFbZ81xlKB0j14l
 K1kbZ5Z2MgJrQbjjCocX73sJ97bDziXo3pKjsR6iQ2SBGT4HDZblQ5R8RC9QIZBqEVKn xQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hudw2gn73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 09:18:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muqAQ6uXygjy53LJjj7D9txAGv63YsOk4kocLzk9VZXulyAwTqqNb2sMbtP1WFlhQfUwDBbKXNb4b3MR8aCKOocISF6zfsOjyhziI7oRwy4E6QAHynp1GioQ1AeaWgI4kMt+6gkt6POSJv3GxasjMDvMbied87tucCJgE65rmJrLOW/N/jWZ8cAUUERPHyTrP6ivkohJMNqJU+7IQ7A0A4lh8oSeezIRNzR2n8fUg90jzlRb8zT2mFpY37nBeJGhNBMTxFl9w7hWLOoqqbYtMYPKGpCKXZfevSv/UJyrXvHU7+/Bq86yrJbDsvZelSTEtO3dzZccL6PeZ471/VaTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0OmPf3bINdFgECktYG3QnZ7AEav3c0TtkNU8pI3lSg=;
 b=eS1NJoSkPbevMBoxjKVY1WIlWnylfYI/FKTPMQaj/EDl8oS20+VsbP8GhymfKvtl2n0/CuEc5fD4gzF2onZRBlj9SC89A99C2XOYr4f+GiiG4Ovq6JhOzuAdfNYWbljnN2/YA8s3xdkNp7xVuY0SCb/jQaFf+vj6hoKmj13bc0ULaOILr8QgrMHA/xwo53jYWZQEFhNV6R5qEVXvTrY+sRMUJWF61IlNfoig2Ie/WHXikqFnyG+xPWlsFq3dF7KE2pCzOdtoXlYLEu2iZuMf7lrhthaCqU4YnhnN3DdLx2XxPyDEY6vke3MgkCUTDn+Tbm1gTnb/IOmrKd3qngqbeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BN0PR02MB7950.namprd02.prod.outlook.com (2603:10b6:408:168::20)
 by SN6PR02MB4413.namprd02.prod.outlook.com (2603:10b6:805:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:18:30 +0000
Received: from BN0PR02MB7950.namprd02.prod.outlook.com
 ([fe80::3189:3e2f:edd6:5b3a]) by BN0PR02MB7950.namprd02.prod.outlook.com
 ([fe80::3189:3e2f:edd6:5b3a%5]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 09:18:29 +0000
From: "SURAJ ASHOK MAGAR (Temp) (QUIC)" <quic_smagar@quicinc.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "Sai Teja Aluvala (Temp) (QUIC)"
	<quic_saluvala@quicinc.com>,
        Balakrishna Godavarthi
	<bgodavar@qti.qualcomm.com>,
        "Atul Dhudase (QUIC)"
	<quic_adhudase@quicinc.com>
Subject: qca: Update firmware files for BT chip WCN6750.
Thread-Topic: qca: Update firmware files for BT chip WCN6750.
Thread-Index: Adir0Go8R2JejRzlTA2quF3M1nKepw==
Date: Tue, 9 Aug 2022 09:18:29 +0000
Message-ID: 
 <BN0PR02MB7950BE2F9D2FBFF3B1C5E499F9629@BN0PR02MB7950.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbaf6729-4214-4170-3229-08da79e81f91
x-ms-traffictypediagnostic: SN6PR02MB4413:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s+uGe5g+OCO28Z44QsZzmmAxrN/HhQfZsbXuwPQKEKPFgsOl5WtBsB6VJK0Z606SLgRmYW8Ij2CBdVHKU5iGMt8nGnlw1z9IGMAIrmQL+FIrRiOhg0H0X0FXw3KUJEhiJu9UWVN9ps5jnxLxOu/dIMqymlln1l/WSdeMlIXeL3GWE0JB1+GSl/cMghtnKyF3OK0c5u4akQ0cXNmoaftdRVXC+XSlk6qmkUpmAvcJUXHB29xWQjL5hVeMjCfN6E9oxnQpAvH2qMjGCg9Sbmj2osQdHX2CqDtAJKKQNVt9O1NCBeBRIe9sWriUelp6xa9E697b492FGPb2da/mC7FQ63TMYXE/GYJ5GgPXvBqASLUUqK38l6xRSSO5TQtJvqDfrSiZKQ3kXtFAJDWQ+etr2h1lo3wWiIIUpSwpHArBkzYoj6j90Ti9Usig4Oaz+xpOA3IP4CLVGH5PLvsw3jLwtL3KJZX6MAkJohgyf9JbLqicZzK+8OnHXxRMu65kqqZGQqHN8vu7RqV6qwuQItY7gVe6KxiP1gQkh9zhmLcV5v5YvJN3HgoiW6rddTmYIEXDNdqdfjAbBsPD3tVds5VvC2Qg8jdCUpUzWYmy3uMvOwG1GqcG19bWvsGAxxGaIlf7p8Kan3n+lzq+4s1BJCgknNsIcUJYIn3NtXeq4C8kTGuG4Ep2Ot0kst8RrBO98b1Lrr1ClMXcbg4j32Q8OjK0YS0z40j1iZm3zXRUQ32gqL8AbKCpdzwdODY9Z0rEH76YLdmSGySigpYcXJE4EO6K0bBZe6SjfMIXPBfntcQ5/HyLx3queb14xsuvaWjsonhAp15ag4Jp4DbHHoJDDU/b6A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB7950.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(41300700001)(8936002)(9326002)(5660300002)(52536014)(166002)(66556008)(66946007)(76116006)(66476007)(55016003)(316002)(38070700005)(54906003)(6916009)(66446008)(64756008)(71200400001)(122000001)(86362001)(478600001)(966005)(38100700002)(4326008)(8676002)(107886003)(83380400001)(2906002)(186003)(9686003)(26005)(7696005)(33656002)(6506007)(15650500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Gqi4HdHJgx8pr+NZsp//3iOv+FTbxsS+4iMFwHxcSHcYF1DLPa8O+A41J0f+?=
 =?us-ascii?Q?8un4/VSQ7KNyjYlesupnH1ysWHijMKDIznmBcOagY2CTRWrwYA2l4ZfkaorA?=
 =?us-ascii?Q?4AqELZm/rQ587rxFohmO/1MoYK1yZ5/rJcnGCv2t/UuYxh2NfGJ+8LFO0KXZ?=
 =?us-ascii?Q?0eChgw5S23b3A6ARL2fHFicQw6kK0m5eg+/3NbFLaYjnVeS/LMwhnE4iVE4H?=
 =?us-ascii?Q?xL3HEBg/eEdz+C8eUtKK2Lg4c+zWVFT1hA00TGD/ZxaMbIHKG/Gs4lYa659k?=
 =?us-ascii?Q?I7cHSWmraYCAILfAwrGOmpU8iOlMikA8ylBNWx/R/i1oWrejIKCuM+uNCwhQ?=
 =?us-ascii?Q?t+Q6eNr5BuN2HE2r3whUJbWSwN5BqPIPkVM5r0PDu6dr0mj0YQv2KA60oFvR?=
 =?us-ascii?Q?ETk1C4BgHU7FActenjgjV8jpKUpPKDeJrWw5XrfoYcjEbAzD8aukV5Jlpxsr?=
 =?us-ascii?Q?d/BWsrEAKzgHshAUnIAEEs6zReaDmlgrfODqRwald8nzxdTkz7rcJlZhCW9N?=
 =?us-ascii?Q?43TdB/tcJxcChm7rGidkz+fFLn0RY+5JHjVXm+xRDC/+BoBbSoM/tcRGAqQn?=
 =?us-ascii?Q?MCozhbGa2Alm3iwmqBuoqc/iaTT+tTgYFm3siw7P6oPYsLkhVn0VQaL7avsX?=
 =?us-ascii?Q?HjPU47YvD2HetAQQoQ43X1BsAcVCI6s6RP/TaRG4GC4V/e/scqA/LYNDl1OQ?=
 =?us-ascii?Q?2z0cgRPnoU8DAGmW+NNuzZURA3vIezScVlvKmxvM6Z78YuiXPUNKRxGn8ltI?=
 =?us-ascii?Q?XPlLC24WvZrMRGGua2sFJ7dDIWQfuQlI/yiiL8Jkd8yjwShEfkhKYyjuSxv5?=
 =?us-ascii?Q?ejCS4z3N3c0Smz+gdpovv4YQyAHbJp7fgLpDKhZV6AixY0TR8ESsTp5Bdl/I?=
 =?us-ascii?Q?qiKgRJ+dT6+nf5re1ShXiJy/LH/xPRh0oHpj5b4BWdvgohx4oVKjMod2ja3g?=
 =?us-ascii?Q?fPgUTtrhC9B/Wc9csYuAgkgAUcs25tRPLK2es0wBicSdF5REaxbBcgAF2xKs?=
 =?us-ascii?Q?vb6Q0he7zQ/KOr0flblXgL5Cq4LtmHFZUu3m+G8ZjI/wsPkEsc8uYfBq2h4N?=
 =?us-ascii?Q?CT2qKVnK3J7oi+2JidVvmTJwbtMSmwDfOu4dtZLpgx/1zadkK6HDidEIBWC7?=
 =?us-ascii?Q?7qYEE3g3cyVCw/YrTA66S9NtLY3BVubq3zp7VO5u5L5uLs+wR9F5mSsVJ0FB?=
 =?us-ascii?Q?IlzSvAJoTIlbZ9UR4uaUtv5vB7vM0ActOUak4Bx9+A5l2YMkIx3/kWY5MfZz?=
 =?us-ascii?Q?UCnAi0LlRKEVPskW7GoonTmOYbAmy4Qz9Lvlo6SkwDum3NBZrx+OS0YNUqFm?=
 =?us-ascii?Q?l3HyySPjMsmc83sfIWLEYfDsc4nf5rdL/I4po4tXvETipDY4dOHY6KivkGYv?=
 =?us-ascii?Q?+h1INTmB/IzqWj2zKAXwhfJvmr4DPLVjoLpdPPj/2eKmyv92yG9X+WxjsxrG?=
 =?us-ascii?Q?CH4rRnSNdcVxjyR1LlcwQ8kgJW43M7jGBaqyv3O+gafrJSN7f6k+dJMQ5nez?=
 =?us-ascii?Q?qdBwe8YyTg9fDZcMFxi+irPuG4Bvohlfb53e1WfBXZx+UZdKwBjlkxjHazrT?=
 =?us-ascii?Q?H8sbup6RGIk4Mu0RJElVKEmid4eg325O2+WZArpS?=
Content-Type: multipart/alternative;
	boundary="_000_BN0PR02MB7950BE2F9D2FBFF3B1C5E499F9629BN0PR02MB7950namp_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB7950.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaf6729-4214-4170-3229-08da79e81f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 09:18:29.5173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CoOkbsRJ0c6vyQ+p3gOPPIYq4E8894cgL67r4KVj3iQ4u5eJD8gcM2VJJZdn/XDIsyTPK2hQ6BM6FjLMdFK1kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4413
X-Proofpoint-GUID: zixXMVfQE-_t_hXMi6IAP53fltRiXCau
X-Proofpoint-ORIG-GUID: zixXMVfQE-_t_hXMi6IAP53fltRiXCau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208090040

--_000_BN0PR02MB7950BE2F9D2FBFF3B1C5E499F9629BN0PR02MB7950namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Team,


Please include firmware bins for WCN6750.



Changes includes updated firmware files with:

     Add on Features support for QHS and QCM

     Bug Fix for RSSI calculation

     IOT bug fixes related to power level during streaming

     Braktooth issue fix



Snapshot of pull request is as below, let me know if anything is missing.






The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66=
:

  amdgpu partially revert "amdgpu: update beige goby to release 22.20" (202=
2-07-25 14:16:04 -0400)

are available in the Git repository at:

  https://github.com/suraj714/BT-Upstream.git main

for you to fetch changes up to 4f8f67efcdea8b875de75293f57825b32846739b:

  qca: Update firmware files for BT chip WCN6750.      This commit will upd=
ate required firmware files for WCN6750. (2022-08-09 14:31:29 +0530)

----------------------------------------------------------------
Suraj Magar (1):
      qca: Update firmware files for BT chip WCN6750.      This commit will=
 update required firmware files for WCN6750.

qca/msbtfw11.mbn | Bin 155568 -> 162224 bytes
qca/msbtfw11.tlv | Bin 143356 -> 150012 bytes
qca/msnv11.bin   | Bin 5827 -> 5827 bytes
3 files changed, 0 insertions(+), 0 deletions(-)

Regards,
Suraj Magar.


--_000_BN0PR02MB7950BE2F9D2FBFF3B1C5E499F9629BN0PR02MB7950namp_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Please include firmware bins for WCN6750. <o:p></=
o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Changes includes updated firmware files with:<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; Add on Features support =
for QHS and QCM<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; Bug Fix for RSSI calcula=
tion<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; IOT bug fixes related to=
 power level during streaming<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp; Braktooth issue fix<o:p>=
</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Snapshot of pull request is as below, let me know=
 if anything is missing.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit 150864a4d73e8c448=
eb1e2c68e65f07635fe1a66:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; amdgpu partially revert &quot;amdgpu: update =
beige goby to release 22.20&quot; (2022-07-25 14:16:04 -0400)<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"https://github.com/suraj714/BT-Ups=
tream.git">https://github.com/suraj714/BT-Upstream.git</a> main<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 4f8f67efcdea8b875de75=
293f57825b32846739b:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; qca: Update firmware files for BT chip WCN675=
0.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This commit will update required firmware =
files for WCN6750. (2022-08-09 14:31:29 +0530)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Suraj Magar (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qca: Update firmware =
files for BT chip WCN6750.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This commit will u=
pdate required firmware files for WCN6750.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.mbn | Bin 155568 -&gt; 162224 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.tlv | Bin 143356 -&gt; 150012 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msnv11.bin&nbsp;&nbsp; | Bin 5827 -&gt; 5827 byt=
es<o:p></o:p></p>
<p class=3D"MsoNormal">3 files changed, 0 insertions(+), 0 deletions(-)<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Suraj Magar.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN0PR02MB7950BE2F9D2FBFF3B1C5E499F9629BN0PR02MB7950namp_--
