Return-Path: <SRS0=T9rm=WA=quicinc.com=quic_smagar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB039C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 24 May 2022 09:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E424C34100; Tue, 24 May 2022 09:12:48 +0000 (UTC)
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73183C385AA;
	Tue, 24 May 2022 09:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73183C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1653383567; x=1653988367;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=LEtcn9y/se/ysHowYogA/N4V1ghGnmnuKh7L6P+n0ss=;
  b=FSLXg1YNLhh1BGUfmnrK5/DZM3KnIVcct4/ac6jYXDTE7ZberEDuRDIi
   K/H75oV8RC4JyUDBFc4TjUrSdRON0OLAC3RTmyHDA9NWuEkCHJRUHXbRZ
   6rPQHpJlLMuT4Ks1dEE7QC+G2fd/eFp/GdN9zOjRtnpKja6mmeOarQeCO
   A=;
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 09:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXPVRouwJV+xOXWne5JfWJu1YPayQgn79XcfL5WvU/1hnleBJcxVUa4ZKh3EuLPO9NLT61Fo5y/FUg/IQjEZMgbqSWr26KJdS6I/qm2ja18i+YkxoJUcxiVqydlKQ+OwRFY8RtxIVJAJ8C2RDU6Z9p4TYP1epWY3xx1gxYIyThnGaJLCJuJSczV5P8anXJ5VskH2ONhDj4KWxjQOPncFL4Y8k9XmQXC3OIWqrgprU5nIfdLAeCITecku7GT45cVdRQMtiWPV1ysOX+k6czyKSdzmZnsHLxJmpB9D+f2tVCaU0SdEa1e6x8b9l46fAhD+XwLWFRB3RyDxN3HrouRyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEtcn9y/se/ysHowYogA/N4V1ghGnmnuKh7L6P+n0ss=;
 b=mL8YMkVk4rKQPrHyKRFXqwF7zhX/lFtbV37GQV+7qEA6b+uL4W9SbZ0EeHcVTE5f+MO2rVVDWUQCCIMr67BX4qcVscLqiX/YdO3LCamuIJ6aYKYtBDv8qztAFsszTGJNGXo671ytISgt+r5MGR+X9zpTzVbQU3IT1pLRtLqRttQbsjcb9mmN+0Hq/ieZfeJYlpIHcyQ623Ob5xTgGwwJbb1LjGM67rlJYZgT/AHObivGfC1ID0PQHrWmtJmesQGtrU1T2A1ta713GLZ3ISI8G0DWZMji/jLRKtU+YDv1b3hDv/1+3gKIUNNqkhwdl50/PVT49+29FHx8LjIAYwp2hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BN0PR02MB7950.namprd02.prod.outlook.com (2603:10b6:408:168::20)
 by MW4PR02MB7395.namprd02.prod.outlook.com (2603:10b6:303:65::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 09:12:39 +0000
Received: from BN0PR02MB7950.namprd02.prod.outlook.com
 ([fe80::51ee:5316:ce68:b733]) by BN0PR02MB7950.namprd02.prod.outlook.com
 ([fe80::51ee:5316:ce68:b733%3]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 09:12:38 +0000
From: "SURAJ ASHOK MAGAR (Temp) (QUIC)" <quic_smagar@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"jwboyer@kernel.org" <jwboyer@kernel.org>
CC: "mka@chromium.org" <mka@chromium.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-bluethooth@vger.kernel.org"
	<linux-bluethooth@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "Sai Teja Aluvala (Temp) (QUIC)"
	<quic_saluvala@quicinc.com>, "Balakrishna Godavarthi (QUIC)"
	<quic_bgodavar@quicinc.com>, "Atul Dhudase (QUIC)"
	<quic_adhudase@quicinc.com>
Subject: qca: Add firmware files for BT chip WCN6750	
Thread-Topic: qca: Add firmware files for BT chip WCN6750	
Thread-Index: AdhpIB6MU+5/g0nCTJqnkH+FPhjNsw==
Date: Tue, 24 May 2022 09:12:38 +0000
Message-ID:
 <BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79@BN0PR02MB7950.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694c29c2-92ef-495d-5407-08da3d658c6d
x-ms-traffictypediagnostic: MW4PR02MB7395:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs:
 <MW4PR02MB739555F4C792C5DAC234EDCE85D79@MW4PR02MB7395.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MxxwU2KPiEdQlOS1SSwiRubPpoyucIe50m/gujDfQ4Sbp+i3WhHN+wKwi9kIHf7fvZqfa9Hzi+Ezo076k0F360qDIinfyKx2elDGXlxR0ufZ7wRXMxVqqGC5/xj5dK4PnhjQv9UTUItDSWKa1U3Yh5w7Wlxff77oHoJ+z9opBfZLanP71lWl32bScswoSKxQzHL7kZZpPBZZKEa4XnqPxVwVw8W/KzvIABktlZmPWNlDPaobW9Ye6OoZB1Vxla/B7Z7wjSUGp6kxjucV14o6nwBHNwcqEayirDYdHgxxs1hoEMdKX+WuEo9wNFydFkvMa0tT7fkDSaQQEfLUWpTers9U+Wc6ivJMgGuEmP1s1uU6NxnlE2tikwAXuR179HOIcE0u089LPTxY7vJUvE8sLwRkSIybLbYZG93hSnNdxHWEaGZXPC3ybzJ1jt3U0anWSfQKYaC4UqBZ/t1o76UZ0r/jQ2hBGe1ypj+ACFXOUOB9A+XM73KjyRK+7Fg3/bc82CQb9U71nKhGT16y7YO2976+XXWjvQ00W8baACihKo2PfmVGUgc8K+HMvxGCQ3+wj5eGwIUhd2zw/27Cf5qiMR0zaCcuqM529brCJ50ccoFycU9vcM3yTnxvPL9WIbf5dEkfXzMtudzdZdeNPE/3+0rhDFOu2n3jmwkzhYyHkv6tfpejOeitd9PVQWn3500KZP0/mRCVAZabWHW0Z364HeQdtNAlupEl0PPc0H3/OoF2mPKFeDJks8v3hi8JXCHRE/3nC5hYuJPvO27Gw0+AHr4A6JmSlWDMYAtuOx0VrSs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB7950.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(38070700005)(38100700002)(5660300002)(55016003)(2906002)(110136005)(6506007)(54906003)(166002)(26005)(4326008)(8936002)(122000001)(316002)(107886003)(71200400001)(66446008)(66946007)(66556008)(66476007)(64756008)(9326002)(186003)(33656002)(86362001)(508600001)(9686003)(52536014)(966005)(76116006)(83380400001)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?boXEF/3Pk7j6IyPiPv6XlLZkbmXjxfDpRPNFaBYuIurX46xo+DIunyDb3Y7C?=
 =?us-ascii?Q?O6tUdk/09nXrDliGef0CV+JV2FLdBbcDAtqRAcgtBIpbk/bFONvfF+LlQb6s?=
 =?us-ascii?Q?SMChe5tR/dwf15g9zr+uA8TgR5gIh7U5v0f/NxrrRlaWAHBJDZX5JwFcNRHF?=
 =?us-ascii?Q?ny/zIwliAvzW64SvNrnJ6rI08ff2aqd2FK0rC0x5dLRJFMLGDyDX3FiqlfWt?=
 =?us-ascii?Q?1qGKpu63aScFAVASpTG1Va/xSk4w4NNuk7djYx+dYWrU6v8YnWNA6Q61ZTX9?=
 =?us-ascii?Q?buf//ovMZrIXts7N6qxCEXDMpviJ7aj0Xwsc2z3dTyDBTlm4YrIhDTs2AbOQ?=
 =?us-ascii?Q?pJq3/8lTAMnb85EzNI2kc+fLt2YbSNAoMaOC5mVUb2EMzvkDX46DR6x8V3S/?=
 =?us-ascii?Q?qZhwc2LdflEQD9fnUPf5poX1KoyjtnAWhyjEY5F/uDiccorVscW+PcpgRlcR?=
 =?us-ascii?Q?tFwUkmvz5K1XITFSxMC0iyVNQ7lD+1pL8e1VOYpVOXFDGa5csp8C5vJdHLok?=
 =?us-ascii?Q?D1PTbMmrIjPeJvBRVCXtaugKipQemeTVIStpFKdwP0D11RCkmdq/oOfOpMbu?=
 =?us-ascii?Q?ALe118h65EcEYRDZ8XsnDwuBzz0AF/6kBaqOqcKX0mags9oKb2PeN7B2TEb3?=
 =?us-ascii?Q?LZFe+zbcwKar7PmIwgdaT+6c8ExMDTEo1iB6xMTt7iTt7mBXndrckO8cN3Ke?=
 =?us-ascii?Q?b19HV9F5tJCRTeJVS0zRkkAXAQw+5fCVCiA7SozKA07gPqRSebnQCD0PbCfq?=
 =?us-ascii?Q?RTh7DzKkBQ6lcJ5QFV26PTb315w9+mtDpEaIBcGbci7wc1eIVApK2j5ndd3G?=
 =?us-ascii?Q?V4vhpm1lhq7Jh6jCynJanxZYB3Z/emmHF311ZBa5WPOmQSGQl8p1Il1kA/ud?=
 =?us-ascii?Q?FJOd47wJ63eNkC2gvJw6uVXFHoDkgUCgrx1vwFYiToT1oyLSoBAi2JFyz5Lk?=
 =?us-ascii?Q?BhzHljT0Jb+pNgNZduK0fhb1bd/T1G1geCI4OIT3OWuQVeVNvxHD4P8jlqNW?=
 =?us-ascii?Q?5hrNHN4gbdaJE0qQsGPkxl9+Qf/x5JtY6jb9+hR2ZxQlp0UeZXBHLKKhjKs9?=
 =?us-ascii?Q?lHomigamxNCDHZmJwKOPtA7RCPe6DgeV7dhaa+tNaxuYeHH3z+CZNPyvm0+1?=
 =?us-ascii?Q?p9wdHBmgGR6l5jkyeyhJdjaNnGliErjfXmema/a0gedyaUM0hHYpcP3SgeOV?=
 =?us-ascii?Q?utYRiumPw3kY1D+SZiP3rhxsg23s8mOP03l441oUOgYaEcyH6RaoJxhcfVHm?=
 =?us-ascii?Q?SIeMnuotuP+Ia0Ia8xHRpqhKHBi4AFLYN+S7RGqMMNAiqc0pdJX15DdEZHSs?=
 =?us-ascii?Q?Lb0L5+nhwyziLQXzJuZ3P4DLRNmbRRSotlu1xZtl/yzVxiIWxS6oF6HHF2py?=
 =?us-ascii?Q?iDSYT2p8mCvFzkGeJASOnPPYwDf2J21/0jTwVqWmmaeeG68lTPHekCuPbPEG?=
 =?us-ascii?Q?3OAYYeZya8gSI1BFqUlzcwGi8WJdr0rbi9AHcKlxsYlEfGcH2opnMiJKcHWz?=
 =?us-ascii?Q?uMGXgtphtQoozCJsxvl7U4aoiOH675Vuhbg1OlboMzQmDCJ4tFBrDTfCwxjs?=
 =?us-ascii?Q?8yL6p1PIlkr8nq+rSQXYnLmoNsVi1KmZM8FqCK64tu6jYwJUnwvkSmftUrzR?=
 =?us-ascii?Q?ZNQ47SQg7DNuHsDBx+KEb+GBTuWYOikpnLsq4aHQHUsJR2+KbDTo7lIJ03Pt?=
 =?us-ascii?Q?XU6H93L2P2pU2XXI/IV5ozngVh6L94RMkX4qb5bjbxvnu9gHEr2yekuCDB43?=
 =?us-ascii?Q?i2IeiS3Tkg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79BN0PR02MB7950namp_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB7950.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694c29c2-92ef-495d-5407-08da3d658c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 09:12:38.2988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcKBz9Iedyr8sAwRzgg2JRiYZyx0rmsf/q4PkTJ6Jr1KMD7yJRE10MJjazDQUZIErEy7enXkqP+xIpqWDWjS0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7395

--_000_BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79BN0PR02MB7950namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Team,

Please include firmware bins for WCN6750. Change includes updated TLV files=
 to fix BT SSR.
Snapshot of pull request is as below, let me know if anything is missing.




The following changes since commit 251d29004ffce3462779dbd08073a2cd8dfd2087=
:

  amdgpu: update beige goby firmware for 22.10 (2022-05-16 15:25:38 -0400)

are available in the git repository at:

  https://github.com/suraj714/BT-firmware.git main

for you to fetch changes up to dc13213e37cf49bc88e024b37a23e39d22b3d5fa:

      qca: Add firmware files for BT chip WCN6750.     This commit will add=
 required firmware files for WCN6750. (2022-05-17 15:46:00 +0530)

----------------------------------------------------------------
Suraj Magar (1):
      qca: Add firmware files for BT chip WCN6750.
      This commit will add required firmware files for WCN6750.

qca/msbtfw11.mbn | Bin 129348 -> 155568 bytes
qca/msbtfw11.tlv | Bin 117136 -> 143356 bytes
qca/msnv11.bin   | Bin 5633 -> 5827 bytes
3 files changed, 0 insertions(+), 0 deletions(-)


Regard's
Suraj.

--_000_BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79BN0PR02MB7950namp_
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
span.EmailStyle18
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
<p class=3D"MsoNormal">Please include firmware bins for WCN6750. Change inc=
ludes updated TLV files to fix BT SSR.<o:p></o:p></p>
<p class=3D"MsoNormal">Snapshot of pull request is as below, let me know if=
 anything is missing.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit 251d29004ffce3462=
779dbd08073a2cd8dfd2087:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; amdgpu: update beige goby firmware for 22.10 =
(2022-05-16 15:25:38 -0400)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"https://github.com/suraj714/BT-fir=
mware.git">https://github.com/suraj714/BT-firmware.git</a> main<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to dc13213e37cf49bc88e02=
4b37a23e39d22b3d5fa:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qca: Add firmware fil=
es for BT chip WCN6750.&nbsp;&nbsp;&nbsp;&nbsp; This commit will add requir=
ed firmware files for WCN6750. (2022-05-17 15:46:00 +0530)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Suraj Magar (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qca: Add firmware fil=
es for BT chip WCN6750.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:=
p>
</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This commit will=
 add required firmware files for WCN6750.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.mbn | Bin 129348 -&gt; 155568 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.tlv | Bin 117136 -&gt; 143356 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msnv11.bin&nbsp;&nbsp; | Bin 5633 -&gt; 5827 byt=
es<o:p></o:p></p>
<p class=3D"MsoNormal">3 files changed, 0 insertions(+), 0 deletions(-)<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regard&#8217;s<o:p></o:p></p>
<p class=3D"MsoNormal">Suraj.<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79BN0PR02MB7950namp_--
