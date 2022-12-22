Return-Path: <SRS0=6VNb=4U=quicinc.com=quic_sampnimm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E2DC4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Dec 2022 09:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4571C433D2; Thu, 22 Dec 2022 09:36:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EAD1C433EF;
	Thu, 22 Dec 2022 09:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EAD1C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BM8TCYZ025347;
	Thu, 22 Dec 2022 09:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=aNnsmCYE1t5EYmbYXu3bXKmc/i2oqmww3cj7XwMi5rU=;
 b=cSXrvO+jMShj/2h5ExtJxmFTbiS1ixV2P3Fiy3AGbHlnE770HI2WVujtPyq+hI50S+j3
 26yZz+HYRPjqkMBDz2Ga7Z6lUFH74njvR5qXUOfB8CrROMjy0m89xUVSUSgfKJp7yF5q
 5eUIDtcx8Lm2TGV1OTl+JA1iHn9FBIHN0rjXfIL5d7rKkiIuglB47XXjZrhmdiuMyFIN
 gf0DkqyTcZI145ZC1HgRpV4W5VL0MFxfw7o104O7NCzXCEh/efxGRTyVtz9wamI9Vvzp
 Rnntvm5FTiK8/VUerTJIuzmmRdqQVZhmKSKGEhUq2Oaaezwm4cpHNipj/cC+iwKxLaO/ Fw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mmkrx03rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 09:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AB7gdItPTXiS0aoUKkKJoyoL4Ol14dlr5UBeQN5vDijaKYjWM4qz1N/Hej/WnoYJ2uk/B2RwpWm+FxmJd2oq+aViiUbPYUAI1uqoaqaA5JK7mJlCl25WehdYcTZX5rCsPPz5NQyPMhIs16S0SYKHnDoFTKsmzrtyXdZVV+ut0EKwkodTQWg1aAD38AXscSUW3nk7zPJ9LNueWwtyqgTiplgsGGrqvLHEtTOUWB+jyYiATSO3ujAIC4zjcG4EJ2TyQOIOuHwMzTj97zWhoj2tE+utaQDPVPk3VfItX3e/oLU0hXDvVnXOHSRMnhWBZ9r2LbPYzRJvxFJvI9oVVrb5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNnsmCYE1t5EYmbYXu3bXKmc/i2oqmww3cj7XwMi5rU=;
 b=VGZgbyYVr9EI+t08rp9fokW+XZyEgsNEl+UOmXQPmBLv0n0Tz4hDMQ2Llt79LiGwMwzlSxHor5/kxnGuBv2900X/T2dCVpGER1I6+KN+W6YdmxmJV0bha/Tuf293z79Luj1VGr5ZyPjmSgxDQl4KFv3qv0AFoFkN7y+jNab7bnopcV82vZ8z483GVtibo1WtMlWbXQ9yG/DUFmBorc5Tq6E+Gj2Ep7+Nf8q6Wxm4YD+Xr8P0Av5XpFHH71Y5AAZ2Lp3AmHdASiudOVWKa9mJKzms9Z5R8HoHb4au/35daydj4RRBUZwnP2RB1FiiWJn6ZZBA8uH7vVfqQoZTcMlinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from PH0PR02MB7542.namprd02.prod.outlook.com (2603:10b6:510:51::5)
 by DM8PR02MB7991.namprd02.prod.outlook.com (2603:10b6:8:14::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 09:36:28 +0000
Received: from PH0PR02MB7542.namprd02.prod.outlook.com
 ([fe80::8790:67db:9a18:9cd3]) by PH0PR02MB7542.namprd02.prod.outlook.com
 ([fe80::8790:67db:9a18:9cd3%3]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 09:36:28 +0000
From: "Sampath Nimmala (Temp) (QUIC)" <quic_sampnimm@quicinc.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "Balakrishna Godavarthi (QUIC)"
	<quic_bgodavar@quicinc.com>,
        "Sai Teja Aluvala (Temp) (QUIC)"
	<quic_saluvala@quicinc.com>,
        "Atul Dhudase (QUIC)"
	<quic_adhudase@quicinc.com>
Subject: QCA: Update firmware files for BT chip WCN6750
Thread-Topic: QCA: Update firmware files for BT chip WCN6750
Thread-Index: AdkV6KNvkJrX7zCVRh+60V2KFPpa3w==
Date: Thu, 22 Dec 2022 09:36:28 +0000
Message-ID: 
 <PH0PR02MB7542C490A862BFB02670E4C3FAE89@PH0PR02MB7542.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB7542:EE_|DM8PR02MB7991:EE_
x-ms-office365-filtering-correlation-id: 94d4b673-1103-4577-61b2-08dae4000091
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BfDQx72UzdY2jEQ/y61bYSCUH+5AhMEeYD1M/8rdF6S0nRPIsWvMoEihGAgRtkSZqD3RbrCo7KrSZpv9t7QOp18kTXXd+pM5zlPwbcKXXCxuNSc/PP+6+n1/AUTJXMnsHz7D45ZXXEyt7FdyI5x0yLA1eABpudU5C8eBmozzj1r2xukav2N2rScXB85sqDP48tXcIo2BOgL+lrWSoNVBB1B3kj3oLBydKt5uqRnfJrE8MlYIhsuWyh71WudaTzlHSv0FQWKRJ3847oOMct5uRmqcgBpMVI+qfZHJLwdvN//yJ8w/Dz7qTSawCeIrI7v2StKEgwSwI3uwr9+3DO97HAidZp+g8LAoLYhaDthkrtU7qpPaWU0u2h8Zg9Dsl+cbnMfG0+L08tyCvtnRTQtUPEvZQHOMhprLKcFHTBASo36GuiOQMIg6QyIspsddF6yUVubLjYew/p7+wS4dJXTYYdjyNLqmAMrmlQrT3ljyuRj3+Qr9InD3IrMewSzYUFtJodyVUmukZL98aS680SKlIIc+fcO8434KcRCZLlKnFVJclcwZU7voh/jpOHTUbpowd+FUaGLB4ZylX/xHtaigvDprFrQJ48Pwn7G0hsxLck4d/VLpauDWUlNm6JhBCl8/s5WsQY0DL5G0pWqX6/QNppLnbvtXansEzWymx3uEXC4x1D6FVJSisKHdwDGdW4yXFfuKfaCmx0iyPkow3XyK/YX6olci1Luf4qNFPFNmaDA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7542.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(33656002)(122000001)(2906002)(4001150100001)(38100700002)(5660300002)(15650500001)(8936002)(41300700001)(9326002)(52536014)(83380400001)(166002)(38070700005)(86362001)(66556008)(71200400001)(8676002)(316002)(66476007)(64756008)(66446008)(7696005)(54906003)(6916009)(66946007)(107886003)(6506007)(55016003)(76116006)(478600001)(4326008)(966005)(9686003)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?spQL8GE7lFNCnTDiZDOykJQsqpyEXwcvGcOgaCEWtqWU2p2Ge0zm+bD6gOHI?=
 =?us-ascii?Q?Xlvl8Baa+WSR0z8hqu7mKAElG6gK5MHSGNRZZsZ/t3Si86qSqPqv7Z2RODZh?=
 =?us-ascii?Q?SfFmThIi977mwqAqYm1exOdAAe3QDsF9/2Rh/rRy+dRhMBKjy8Qg/rWk5qbf?=
 =?us-ascii?Q?nb/hHOhcE8ifJSbZZdjDeeBF2H3DiQD3vBOBvCS7BY+QgpZ+yNf46mUse7Iw?=
 =?us-ascii?Q?ChIE3P8PiuE9BpZjDeKi/o+5JaBb3v+aTJh3x2otUIF/LThL9u5fEp+wZLH1?=
 =?us-ascii?Q?bpfFhDya2rlkyNo2+m/BVTotOwaiheNi5gLL6AttRXgkOr00xejQhCoRhz9T?=
 =?us-ascii?Q?rgohi/50Aat9KHG+lLNinfkPi266aByowdrQgWVZn0cOGaQwn+HTH5hOuH8w?=
 =?us-ascii?Q?qYurrrvyvR06cOueCw/ahrGUXAxPj45ABZJrvg3+7lYB3Y792tFU7vmd8F7B?=
 =?us-ascii?Q?9SPT1oP//zT7jF/gAVeeoRajT+8oj90g8D9zcOYqssTK68f3D/qordFwLSbx?=
 =?us-ascii?Q?aPx7hrEtL9PGhy8MbOrtQ27edXJQmjhgBVjU91OD7VeRsQ0AtptnCM+lpw3M?=
 =?us-ascii?Q?EabiJb5cM9nmQPcp/lzBILh7u88SUjn+jflomayL3Yd2jqW1et1yTdmzFJoc?=
 =?us-ascii?Q?KlPVEcY6chL2lYeQyLz2+tMyKdTATJ0+Jp/ZNtul4Na28TPFN8pHM2G8Za2G?=
 =?us-ascii?Q?yJzx2QrDhIUYhCgub2POqOhB7JFt+0LZdt6lHfPgRmW9Me71v15fjNC9CoNX?=
 =?us-ascii?Q?DFo88mCrvi37ejVE2q1/o/sNjZOUImxDSiazbrva7+ZKtrJ9UfiFtlFqAZaa?=
 =?us-ascii?Q?y9VtQWDcOIrVRxxgJzjluNc8QM7h2K4c0RYfZRGWefXDlcORhgSpLm6lUNZM?=
 =?us-ascii?Q?gdyCupexlPyjm/62GRNHrQyu7YfdY06n3I0zquVUarhp5cei+3kN7l02m8n2?=
 =?us-ascii?Q?xX8BPPx0TWMBHGSmFL3vjHCLQV0FxHJXZ4Zomb7H2/wlO+3bkHZC5rNE76Nv?=
 =?us-ascii?Q?2XYBafTnyFHLjyy8+WhmhCBfcTWBqHOYKkUE2HO/vRJFv+0VC+8BO7i7FLN6?=
 =?us-ascii?Q?1X54B96t2wcWxBIFLEIZhpEp7uoUbpx7mQkConUThMc0kuw4C/EcQZjTUFzV?=
 =?us-ascii?Q?Hfd0l68NhRpFg6ANCm6B0Ytl5CQZUJcRB4keLK5QC0JU94KX6wB2VMK7p97I?=
 =?us-ascii?Q?9VtPC8KmDbBRO6WCVc89gQKraAl9nkpP3N8o07N4PAyoZ8pfEWdcs71US7a+?=
 =?us-ascii?Q?Ml6cle9+zGR6BA0ggC6EAggP7p+ljii99jdwtIDM0bK0rOBjdtMY2hZRHz9d?=
 =?us-ascii?Q?fqlobmASVAAmEBGNUGxeS6U2XHSdBXV6ghJV4DglcRbDZAQzFda73LoD6AfC?=
 =?us-ascii?Q?eixXCfqawDzgqvQD4/DnknqjRZHCQuONhmKohe2wDo5cfmCBfZ8hjF+fK5xc?=
 =?us-ascii?Q?fYXP9AhtqtbFCHUkrLPfF/zgEkUgOzYSKkPg1qpJuXHVieevUsCWQxcx3mVb?=
 =?us-ascii?Q?os+otulUpEsvU7zU+aF6JM22ktg6+Yw4ul41AcFyq6o6u5ZiPhgqPRN352Nf?=
 =?us-ascii?Q?CafIQHPpF44OyPcOtXZBzoQBMXr4FKhbhCq5qWBg?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR02MB7542C490A862BFB02670E4C3FAE89PH0PR02MB7542namp_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7542.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d4b673-1103-4577-61b2-08dae4000091
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2022 09:36:28.6382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffOc19Y7DoJIkgbb50Mkvr0o1skIMSB6YewzvTFSapULUHm5PCRpURm41Xe9hNzEyRh8RNrIL5TcPgk6c5dH0b6TorChqOkNdxv+NDqImZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7991
X-Proofpoint-GUID: 8vkYH6VrooPDlzV_IUX7JnP1Zr2VmEHp
X-Proofpoint-ORIG-GUID: 8vkYH6VrooPDlzV_IUX7JnP1Zr2VmEHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_03,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 mlxscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=846 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212220084

--_000_PH0PR02MB7542C490A862BFB02670E4C3FAE89PH0PR02MB7542namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Please include firmware bins for WCN6750.


Changes includes updated firmware files with:


  *   Read Buffer Size V2 CMD validation fix
  *   xsco connection race condition fix
  *   LE SET HOST FEATURE BIT command validation fix
  *   fix for BLE adv data truncated during coex abort
  *   Coex NACK status update for QHS
  *   LE scan priority changes
  *   Fix related EDR support for esc
  *   Fix for Race condition during Role Switch


Snapshot of pull request is as below, let me know if anything is missing.



---------------------------------------------------------------------------=
------------------------------------
The following changes since commit 52261d0329b1a2e414ee394aae3c5ca36283730f=
:

  Merge https://github.com/pkshih/linux-firmware (2022-12-16 07:10:10 -0500=
)

are available in the Git repository at:

  git@github.com:sampathnimmmala/bt_soc_FW.git<mailto:git@github.com:sampat=
hnimmmala/bt_soc_FW.git> main

for you to fetch changes up to 4704e256ca4e2e7b4fc94b87d944dd211cf4ae01:

  qca: Update firmware files for BT chip WCN6750 (2022-12-22 14:51:05 +0530=
)

----------------------------------------------------------------
sampnimm (1):
      qca: Update firmware files for BT chip WCN6750

qca/msbtfw11.mbn | Bin 162224 -> 166836 bytes
qca/msbtfw11.tlv | Bin 150012 -> 154624 bytes
qca/msnv11.bin   | Bin 5827 -> 5847 bytes
3 files changed, 0 insertions(+), 0 deletions(-)
---------------------------------------------------------------------------=
--------------------------------------

Thanks,
Sampath

--_000_PH0PR02MB7542C490A862BFB02670E4C3FAE89PH0PR02MB7542namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
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
/* List Definitions */
@list l0
	{mso-list-id:1902986409;
	mso-list-type:hybrid;
	mso-list-template-ids:-2081663220 67698689 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
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
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please include firmware bins for WCN6750.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Changes includes updated firmware files with:<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Read Buffer Size V2 CMD validation fix<o:p></o:p></li><li class=3D"Ms=
oListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">xsco conn=
ection race condition fix<o:p></o:p></li><li class=3D"MsoListParagraph" sty=
le=3D"margin-left:0in;mso-list:l0 level1 lfo1">LE SET HOST FEATURE BIT comm=
and validation fix<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"m=
argin-left:0in;mso-list:l0 level1 lfo1">fix for BLE adv data truncated duri=
ng coex abort<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin=
-left:0in;mso-list:l0 level1 lfo1">Coex NACK status update for QHS<o:p></o:=
p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 =
level1 lfo1">LE scan priority changes<o:p></o:p></li><li class=3D"MsoListPa=
ragraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1">Fix related EDR =
support for esc<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"marg=
in-left:0in;mso-list:l0 level1 lfo1">Fix for Race condition during Role Swi=
tch<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Snapshot of pull request is as below, let me know=
 if anything is missing.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-------------------------------------------------=
--------------------------------------------------------------<o:p></o:p></=
p>
<p class=3D"MsoNormal">The following changes since commit 52261d0329b1a2e41=
4ee394aae3c5ca36283730f:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; Merge <a href=3D"https://github.com/pkshih/li=
nux-firmware">https://github.com/pkshih/linux-firmware</a> (2022-12-16 07:1=
0:10 -0500)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"mailto:git@github.com:sampathnimmm=
ala/bt_soc_FW.git">
git@github.com:sampathnimmmala/bt_soc_FW.git</a> main<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 4704e256ca4e2e7b4fc94=
b87d944dd211cf4ae01:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; qca: Update firmware files for BT chip WCN675=
0 (2022-12-22 14:51:05 +0530)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">sampnimm (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qca: Update firmware =
files for BT chip WCN6750<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.mbn | Bin 162224 -&gt; 166836 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.tlv | Bin 150012 -&gt; 154624 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msnv11.bin&nbsp;&nbsp; | Bin 5827 -&gt; 5847 byt=
es<o:p></o:p></p>
<p class=3D"MsoNormal">3 files changed, 0 insertions(+), 0 deletions(-)<o:p=
></o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
-------------------------------------------------------------<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sampath<o:p></o:p></p>
</div>
</body>
</html>

--_000_PH0PR02MB7542C490A862BFB02670E4C3FAE89PH0PR02MB7542namp_--
