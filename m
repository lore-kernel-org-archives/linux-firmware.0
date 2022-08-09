Return-Path: <SRS0=DV9h=YN=qti.qualcomm.com=smagar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557ACC19F2D
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Aug 2022 09:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 123D9C433C1; Tue,  9 Aug 2022 09:05:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE8F5C433D6;
	Tue,  9 Aug 2022 09:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE8F5C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2796po2R014515;
	Tue, 9 Aug 2022 09:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=ZeMo2WPbbvWGUNm/vyvM4u+RXq3ed7Vm5nIYtP5G/mY=;
 b=XzZK+BLj1hEAQx28ABSffo4yC3NCVKFrGumWVi1FzGIO8B6G5Vyne4beY1eCw+LB77kB
 fq5qIG82Pxrq46BmU8U8dl76p6NE69Vxd0ERz26FBSz+pEivefNMvY6PQrUAR/mY79bX
 k4QMEjw4aaBeTk2O/83/v0NlWlB7/crf6KT0B/wllcfvsnY0OD7ZT5Y5UHjMi8+n/p5a
 7/GcB4Bz2fSZ+Bqe1XXkTcc51GoyH89+6V37Bbf52DGAIcmPLFvDd9vJcdr/oIXa+9hI
 Bq/Ra+HxiR8MAO63uLdbKW/OOhCMbkli+NEPgZo/qVXyB34kdKBSQBpJVqYx3R/+RyrI LQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hudw7gn07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 09:05:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgBcHZ9XhxUNu45bHNYZRWt1NTwWNCbnV39Y9JwdlBlGPD27+iQDiL4lTGEs3zknIkNs3+GEOhO+29qhwjxnA72eEbMHuFxhorkj24RS18lpnKrQ+JG/Gf2T/7n5cT5Y3/4c7t2SwVHKMmy3aR69I9PYlmcMMmADxHZ0Uq1mplcYWXmqLerMF+4Gn23gDaEftz1c4lGxF/8gSeGFIIhXvYDq+n+vPagHef4FXH+fkBVpwnK17oiKDrEOMBHW8yZSLPl9fSRopG8ExjAf2kj56LEnNCVgGk69NAeXNkeqzzJD03FAsVAERBpdybIz9kQM5wpEeYzmkxAQMFzClp1KdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeMo2WPbbvWGUNm/vyvM4u+RXq3ed7Vm5nIYtP5G/mY=;
 b=NxdKp8DnZNZAWmlz+DmfAz37aPD5NokYHLMu9O99EMHpF/YoiC+zBbladSKaLwF0Ohfz9+SsG875t/TZsSOn8N8cb0DdHNHvC9YdKxAQuYhFjg7JSUod7UKJRkVVCb3hsv3lbyT8OtT533hlD1Fw3nBFDxso2B8NElVM3pguchuG0DrTAL0lvly2DmdCalga8NHneuCJn/R7uCSgvhuaVFW3u5/0WLfKKKudh/12bB4LwMsZ91DpvBWqweGXA/7nbLY1unFF3Er29A8GS0AnzaTSjVyx+xeYYpTwetv+riEQjFGU8D74gRAm5eFA75hC0k60B88gKjZ2n5p8+fuN0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BN0PR02MB7950.namprd02.prod.outlook.com (2603:10b6:408:168::20)
 by SN6PR02MB4192.namprd02.prod.outlook.com (2603:10b6:805:31::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 09:05:25 +0000
Received: from BN0PR02MB7950.namprd02.prod.outlook.com
 ([fe80::3189:3e2f:edd6:5b3a]) by BN0PR02MB7950.namprd02.prod.outlook.com
 ([fe80::3189:3e2f:edd6:5b3a%5]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 09:05:25 +0000
From: "SURAJ ASHOK MAGAR (Temp)" <smagar@qti.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-bluethooth@vger.kernel.org"
	<linux-bluethooth@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "Sai Teja Aluvala (Temp) (QUIC)"
	<quic_saluvala@quicinc.com>,
        "Balakrishna Godavarthi (QUIC)"
	<quic_bgodavar@quicinc.com>,
        "Atul Dhudase (QUIC)"
	<quic_adhudase@quicinc.com>
Subject: qca: Update firmware files for BT chip WCN6750.
Thread-Topic: qca: Update firmware files for BT chip WCN6750.
Thread-Index: Adiry9A5UoKA2pkCSUWP9V5/vAxJ5Q==
Date: Tue, 9 Aug 2022 09:05:25 +0000
Message-ID: 
 <BN0PR02MB79503DA4BE3285E35D9B3376F9629@BN0PR02MB7950.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68553f77-e805-427d-41a4-08da79e64c31
x-ms-traffictypediagnostic: SN6PR02MB4192:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NB9rn3Qyq42s0E8THpcsATvHp3LsFGxw5ZSRGu8gQtXobdX0ZarLJsfRyH0YlxOy7eLEHE3EQGXgCRQC4UjmZmZki6AxBZeRr5Uw+v7gWI2BPpCAvRFf3vP7BEpcCrGzsKKcT2aD3nHJ1jn9kd/HVjxkEvG3bd+q1RE1w6spZmB2JiWX++wXK0P1uLsmRIU401RNeRNVMUR4QVeWI1xqG1NE3DG2hus9EUMCBCAjeiCtVj9hZyGTUKMjgjKeL4YOyWyaZMZDrOofddb87gX9JevOU9nfmSfRYY/h9CNH5CnY3XOv8dP+kIY2Yb7lePGqpsqMsaz+1i4QBtvR1bnkjFjdPo7DrshmpOnTGt+R+O74E62HfyiUiChmEXFYDwyPZSS0xQQKAFboIkYCgUwHG3rUsZHNnFR27w03ugjNV0BwNRu2Md0bfXXio5h4OfW7scZUajoN9ZwPkM0KZ2jUeWihMHYLs+9STOzCb9uFKaou7Es1hhUppzYd6q07wZ7KmN3cssGATCY8S4yxfUWDxrkgQLlUkZomX9zejBb+xCDj2j6K7b/HaEqX5UIYO14PBOxZSlMGYr0FPc9q2zBVVAv2OxtNchGHoPxQ+jbnlEhsCB3mlcgmk89GFV3zKTXLpa0gfE9PTsNyq/qqH3NheLXoeLyHd9PiWmZ+U/8e+cG6YQO0t5TWQry0oHRhPh14wL4yx93fmVRdJV2FdBblghtWPQXT8WeNvM56nxZKzbl3N8bbxjfYTuBhby7iWgq0+Hmzkg9cIZQDgQnWAibo8zN+gFI2zIt40XqrtBZhs9u+ZEBz/MLhicEofFyAjpuB+g6je07om/pLA0yF5nYuwJzXl0mtXSJnB4WM062g2ywGv8aweLQJPrJMUwA1dCdl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB7950.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(478600001)(38070700005)(71200400001)(966005)(33656002)(83380400001)(186003)(166002)(86362001)(6506007)(107886003)(26005)(54906003)(41300700001)(8676002)(316002)(66476007)(76116006)(5660300002)(64756008)(66946007)(6916009)(66446008)(9686003)(7696005)(66556008)(4326008)(55016003)(38100700002)(52536014)(15650500001)(8936002)(122000001)(9326002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VkC/fi7cJe49WXqWQ1MXTdypikR0lGmSbd0/ftQAbsRl+b/7Ss8NFsPMcKKN?=
 =?us-ascii?Q?HUJQOl4qJSexQlccCzaQim9tLHRs8a+qLq8SNzXNusQ0gprwNgMtOTCciyFm?=
 =?us-ascii?Q?W9B0Cxc5mw8dCTpFDtBgpWfE9o5032nwpJgSphh2PQzNxtP0zV7twG/QRrVs?=
 =?us-ascii?Q?Nxl7o9IwrIrtT4OnoJabgAgDe0BfQuvpIEfld/p6FUD9mWqzib3G2tzRdxlP?=
 =?us-ascii?Q?OBZeIuFX6WXCd4pgM1y0Nn+d2gVx5EvMazIzB8bydwEoq/ZCcJDKEWHs10D6?=
 =?us-ascii?Q?6l5qzNfCPdDh3R/sqjLjyBxP0FwQ9iZRDPskKXYZf94zwlysF4Ci1H4c0TR9?=
 =?us-ascii?Q?BdqtBf/+Ncxj8kewuTAnD9MZIK+KPhC4xcXGKiugZdaPOLkssTG9Lo7MJAS5?=
 =?us-ascii?Q?govZ1UAjttQA6ctb3xVFuCNYsF+CLghJo8n/dT0COpUfskggetLi0gq0bRRF?=
 =?us-ascii?Q?MharHDwZmtvixj+cYd7HrwdEkkZ1n0LhwdlEdrz7HG2tTQ3RH/mv1qrmBt1R?=
 =?us-ascii?Q?vT/nMmNGufBp+GLj5DT5ZB7aRdiYB94HKSXdAglb+9n/GXJ/CwMDvUkC353w?=
 =?us-ascii?Q?mScjyfKoAyS1ga1VDPDK6w9ANP4d/kT4PUroGgdcZjbmhDcCaJu1HJz37O37?=
 =?us-ascii?Q?sVnwI+lenKkrL8pFlvNZ7pcNuVHNSw2BTsW6eWYeKGGAfyGs0UvA2kKTIP2s?=
 =?us-ascii?Q?+aWVaOxDcrXdhSy8eOnt9u3YB4H05xfQnIPDB94+eVrLiLn4bk9nT0A8mF50?=
 =?us-ascii?Q?HtqkmsmLf5MMHInmcH4D9xY9DU0AyE0xPhbVEPmgMcy8RS7jHRdfpmqooEGA?=
 =?us-ascii?Q?poKgV1RrNtZ4vI2dXQr3GUOiyUDgZqtBTLrA2/PTXx7LBbQUG5fYkCCwA6/T?=
 =?us-ascii?Q?2TofMCEcNKoDXImVdV4k73/83BhakuKSOQX/8qdPMHZ7uhgzLokORNlx+3wL?=
 =?us-ascii?Q?kE1QeSmnlWmtcjoAv6i1mqPaHuQNRk8BXLAyHkIAfEoxFykpIIu95k+7/olD?=
 =?us-ascii?Q?X2bP631rhSbxCYPE9+rgSMNhF7PmifSmj5z/NMQHWapklW0Uo+QD2jMcNYcG?=
 =?us-ascii?Q?LKYP2fP3AeAm84IGCqdtlqGsz5ABoZYmYpqtjnUvML7cG2zFYC1YTJcDjCGk?=
 =?us-ascii?Q?6jWBw7TsJW0pAkyaqrlQrn/be3zGhl2MPMwhGqmc5jrqzqtMFusU60f3itCT?=
 =?us-ascii?Q?p+nF6CnXJ7U1evl8xzUlXVQDP/tkWKYXQHumpypb+CcaB3XhN1LuUvHEws0/?=
 =?us-ascii?Q?WHxbenyydfnri6pzKi0ZdZb3MosUnKZYxRw7G/zBGX+Sq3dSGymMoLEi/IR2?=
 =?us-ascii?Q?6mEPV+0YhE6+j6D8UZ80IAvIAuJofN3OxfHEk2MaYPhf8KNRXDAQvZPtWUx0?=
 =?us-ascii?Q?Q+lRUutphp9006eJhOdSFQL1Xvvpx+VOM+Byp+SSY+mn3vjKqeFfnvfwk9Lg?=
 =?us-ascii?Q?0V3AdBin539rm8Y3LQEo1QkFKIdUBzGHdBn4Vp6vZegd8XB8FcRrAj4kbycJ?=
 =?us-ascii?Q?nUmJ4GKDUDBBGyeBDeQ2TblEUBEFa5ztJSSl3kNYiUgfTYi/vNq/koiqHLRV?=
 =?us-ascii?Q?lHcpU3ahx4n9xqRIyQHKDPnGROXWLNjN0CR2i3FO?=
Content-Type: multipart/alternative;
	boundary="_000_BN0PR02MB79503DA4BE3285E35D9B3376F9629BN0PR02MB7950namp_"
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB7950.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68553f77-e805-427d-41a4-08da79e64c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 09:05:25.3769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OS0N0gCKgKgUiFgkAi4qS2L+/Qtl0WVEhJhd6tcke14UWceGSpVPYR0aMNH9PJTZehoAoFZHmIHsIbOaAOpaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4192
X-Proofpoint-GUID: OE8iBg_OhmC1Qw_Fu-3dbwXAoKiMVXSr
X-Proofpoint-ORIG-GUID: OE8iBg_OhmC1Qw_Fu-3dbwXAoKiMVXSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208090040

--_000_BN0PR02MB79503DA4BE3285E35D9B3376F9629BN0PR02MB7950namp_
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
Suraj Magar
Engineer II
+91-7385156155
India
smagar@qti.qualcomm.com
www Qualcomm.com<https://www.qualcomm.com/company/about>


--_000_BN0PR02MB79503DA4BE3285E35D9B3376F9629BN0PR02MB7950namp_
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
<p class=3D"MsoNormal">Suraj Magar<o:p></o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"color:black">Engineer II<o:p></o:p=
></span></b></p>
<p class=3D"MsoNormal"><b>+91-7385156155<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>India<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b><span style=3D"color:#5B9BD5">smagar@qti.qualcomm=
.com<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"color:#4472C4"><a href=3D"https://=
www.qualcomm.com/company/about">www Qualcomm.com</a>
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN0PR02MB79503DA4BE3285E35D9B3376F9629BN0PR02MB7950namp_--
