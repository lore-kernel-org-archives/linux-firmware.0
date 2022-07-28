Return-Path: <SRS0=/mSl=YB=cirrus.com=prvs=120867bca9=vitaly.rodionov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA898C04A68
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Jul 2022 12:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4F3EC433D7; Thu, 28 Jul 2022 12:47:27 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CF1DC433D6;
	Thu, 28 Jul 2022 12:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CF1DC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26S86NBl014905;
	Thu, 28 Jul 2022 07:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=PODMain02222019; bh=FnYxE+f5OHtmjRZ3V/9/YXFgVh/rx88q4Ynw0XmnAYI=;
 b=OFIQsaBxhG8Q5mAkjyS1phrS3uLPQxFb23o5XhXMe5OYcu7KwxLmfKZRXXmUtD4ZAqAD
 Cpzupg3zVaAwxCfia3zT5bHi5a7B6W0QwBcAfLzaUmsacc02JkOuLIjMFu3MWfWSFE7R
 qmw88oLlx7zCFsLmAYpHhuMQcKvR/I3owDaui+UZ8saDqapLh4ueNeY3WeuUC36+WK04
 b5GmUSakmtH7G6frc3lut48N5PUctm5dx5b0bHPp4bHqMVuNIHYn3wOyx83uesIUJsGA
 ZGSb+fs18r4SHWH5cRBjanJVxe7rt9FHE5MdR6sT37OXKx2jrkeohFu8I/VtZwrnFZds Dw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1xxyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Jul 2022 07:47:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs92Th2YxVEwJqnoNuvHh/zFJ+Avg+ZCjDcg6aN7pEXKCUDcdAaIuN8P67aqqa1dXoMIm65uJfS3grI0aIcll3gDSekb9F/GUsPzeotGr+tNLWQ27V8nDVpundPeQchwBFAb/uqbCT6uEkf0nezGxn/lNJUJX0QHOeGG+hKDVvoUUOYs4YedpSq1fkNW6x/1E+IiuEOJ/VsgQu0A4E0O2XCe+HGxwLPWLyXbAQnd84MPzASqpGxBMVp1W3xLt1r+p11WQkR+/E4uk6gBBV+VKmIKC90di7g1SpxDanVhcf4o0Iaf/SYjx8L0MTEY5r5KtOiau28SDgGViT/Bp93sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnYxE+f5OHtmjRZ3V/9/YXFgVh/rx88q4Ynw0XmnAYI=;
 b=NaMuPQpJ1yBoXGj5MqmdVM+qFSuyhUhP4XvYs8P5GzQ+FZWtF3DKwhBYi1IiZIlFD74wDSSxPXAbB1k4GfflU5VWV9YaVAeddn32X1hPD+CYnD3U8tKu/Cb56DsLTE0KbKfrfE1nvUx8bcPslPPIRMr6okQuH9W3VAiGy4tvOSj+L155wVVfhmJsKGJTTTF24rhlMVzj0TiiNX3J28ekaSvFwftwcuNIOpuqpuGuzpvwwuH90YqeZV+B7jlKjV1nC/yzk7gJnSf+A/uL8GmXdwp3h/EvBhMcm842PtaVuRakG2WngUxfwCn3xzm6HPefpYaBXcS+I5BLyAifpIXdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnYxE+f5OHtmjRZ3V/9/YXFgVh/rx88q4Ynw0XmnAYI=;
 b=k1gfsYlL+BKTrxES675WsiMMgCMo0e3vpQ7jBrAgtQYVAfG0LneAQ36LmY+XeOiJY01GFqjVlndIO67YSmBLTDUQPahxm1gCkL5Eq1WAvxShVB+bRX+B4SUEvQqViL5s0k9eWZVeLFNUe77LqD70OzpwoFO1sk7vx1PPKAaVcLs=
Received: from BY5PR19MB3666.namprd19.prod.outlook.com (2603:10b6:a03:1b9::16)
 by DS7PR19MB4471.namprd19.prod.outlook.com (2603:10b6:5:2c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 12:47:20 +0000
Received: from BY5PR19MB3666.namprd19.prod.outlook.com
 ([fe80::95a8:771e:a5db:6445]) by BY5PR19MB3666.namprd19.prod.outlook.com
 ([fe80::95a8:771e:a5db:6445%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 12:47:20 +0000
From: Vitaly Rodionov <Vitaly.Rodionov@cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        "jwboyer@kernel.org"
	<jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: Re: [PULL v2 linux-firmware] Add firmware for Cirrus CS35L41
Thread-Topic: [PULL v2 linux-firmware] Add firmware for Cirrus CS35L41
Thread-Index: AQHYooAt2ajsn9coBE2dabIJ9jZijA==
Date: Thu, 28 Jul 2022 12:47:20 +0000
Message-ID: 
 <BY5PR19MB3666244067A84C195AB7EB0880969@BY5PR19MB3666.namprd19.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a33b72f7-a556-7510-fd44-ee31264ae352
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22405606-a776-4332-2e33-08da70974f99
x-ms-traffictypediagnostic: DS7PR19MB4471:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UG163ZfsENHWbaY0+hC6foERjn7gadhtvUURgZzP6+GL4WzDtOaP97OCGcxWlcpzs5c6ZF81NUPGlOUmiR0lOFgpCfePZNPYeCbhHEQEajnokbwbkvcDOdN5+5oC9fYF0nWPGMpmcBFwlHxddWk4UZTftUylOJ1NGeYSPCOvoH3SlGmmL3dBNtIDYs4836Fs64Gkh9n+D9lV/6f0j4LlSDdLf8z+qvpFylG6LF/9gxdFDp1v79BEXIuea27ZUuMZVZ1uP70ouhXC5Ge4bdwrXU5B+/BU3h4jfx5tUVnoVUK5INXTIM3JWvQef2UQApMEla0eElfEWLQZll2hbXAG5+iF0rkNXu5vgpevYPZtTcxNtCutJ1pdmSsBKzv3v2BOQLt/d9KQSvR/9jAQJAyqcQBwf/+3epHxXoM3zYRunBS1yLggm5aZx3XncPuW6DK18vI8gK3xejpOFltEuSdFFvxMwTh9gfScASVKJ5o2CMrUlRNBzmD8I5Hx+65cbzfJa9PospxGztU2IrHpjJ7/c5mp/IiX5FAH3M0IUFv0U07R+/Yn0YkKpM6xSAEJ/9uk+GdyC/Wyo1lBqR1a0jpZoVpqnwzsK03C955LBjvIADw7Bd3J0kt8nmH/fEQi+jO82mqtuf++q9J9Knw43ZWdj8wIurLfTXk7XfPe2M7fsjYVunp2Grlo1IhZP9lBUQTo01Gabu7+H18CWhvEdKxRJFJwV2JqAkIPoBszFSkK8gohTwuecTdb1kPt4lyb5jOfRqUoNeKYIyOL0Idj9xWE9NZCygh95D82C6fYk4l/AOYb6n/th9Mow+z7rW7Pvjyf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR19MB3666.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(366004)(39850400004)(40140700001)(8676002)(6506007)(450100002)(7696005)(66446008)(66476007)(91956017)(8936002)(66556008)(5660300002)(478600001)(76116006)(9686003)(33656002)(4326008)(64756008)(52536014)(66946007)(38070700005)(71200400001)(41300700001)(55016003)(2906002)(83380400001)(86362001)(122000001)(26005)(316002)(19627405001)(110136005)(53546011)(186003)(54906003)(107886003)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Gh2uRJ6+EZ6DfUf1fuShW+Thng2h4xreGunxrsv3cmZnTZBl5OZcBIfFup?=
 =?iso-8859-1?Q?C1wvM4YGExwoVirY4WZ/YGgWHoTQyJEAe0RJ39iEUtMGDDG+n90O6nsQS7?=
 =?iso-8859-1?Q?9RUqW+uRXP6FrIrzI+272iaUwznYhiOXaoet7M24LbbmQbDvXF9SzEZ2uv?=
 =?iso-8859-1?Q?3PhKs6RkaVzU50d50ssAFPdCBoW1P3oREHEQbZXyWv9K+TQqbSEH9dnJIj?=
 =?iso-8859-1?Q?AcmXbaTxeDKqkaNVb6CrOf9axV2XJEnxPxIn9D9evbErLQBJSlyf3JPvxD?=
 =?iso-8859-1?Q?lUOV8D91n30M6bVt8KDrFjXjjZaOiadaINX0ZY5LDEUpYC7cjz9Msk6TsB?=
 =?iso-8859-1?Q?iHbMdwQfeV5+I4A+m7nSlKDcSHtjSVMIhyhNwzBTr63IWsF8dcnWHuG6h0?=
 =?iso-8859-1?Q?6qmGBpW/0cL7r5/FlrHyac9n3vC9PEzkeiW0m+T1v5L2jYk28C0UWMmBPY?=
 =?iso-8859-1?Q?nXDsXEH+70U0OktRZcZknQtGA076HnXlKLc0IBEb4r2+sdU6YnC/zrnpRm?=
 =?iso-8859-1?Q?Jk+LQoLUYxeXd3FFQ0uPE503P5uBpHZaTa66yC02hxy0joKJwYRoDjhMLW?=
 =?iso-8859-1?Q?YkDEyzF+lEZ7vPER6ExLuK9MkN7UXw7IHcdnPt8GYXs7UJhdABzpVprI+p?=
 =?iso-8859-1?Q?Ity3KLpyD+qp1DfogM8m27f2jEAWOI9vJ1q80ZF6NzSO2GgJR5R9u082aY?=
 =?iso-8859-1?Q?QyrBEknv8hkcgzt9ASuM/q2wHBEQ+vHOv9MWPBOlpJYHKj3cZ0S1tQ/mo9?=
 =?iso-8859-1?Q?I61U7tnBIOiPq7Fz8+GNxnybNM7vamp0ULQ/9otNuOhVA5QTzt1+742PLO?=
 =?iso-8859-1?Q?4w/okSTQnxXIOXMaHpxETs7z5rMUPvQeMnS5XdsmuTzHD6lnJMSX6FvdQQ?=
 =?iso-8859-1?Q?MuyX40nX0S/pVCmattTFXDtO9Iv+doOX6YFwPq26mcMBz/GRcKTeZqpPRf?=
 =?iso-8859-1?Q?KcFtDjUjAH0Upz54fwcSeT1Bg7cpaiaqg0mNbgPcW8cVGCMoh/0TOtjaC2?=
 =?iso-8859-1?Q?dvZGyDJYGommse9ifwGUkxScALK2e9uSrM+LRprzld1yOln6nUouwohGfg?=
 =?iso-8859-1?Q?/ZxvIALPynMg1tiCfPeovJ+7fe6PeFnhBw25B/oiBA1PuxoCLS7GB6otqp?=
 =?iso-8859-1?Q?BLWYpcCzwNuLW4ISqqNMOMiYV34aZosJXWr6sdTMbhOUWqxl5+lkpU7A23?=
 =?iso-8859-1?Q?GXBPlyTyh8flBJdNgylNw3GtOsqIf9R2IkuCzVttfwgn9kGErtzu0fsbxq?=
 =?iso-8859-1?Q?lckHZK/z68vAFSCcqFirLf4Gje07rPSF8GWETyJYnrDDWwp6vXLLjBZ5Tj?=
 =?iso-8859-1?Q?GwUF4xYyH9RbchojtcZDZ6h/cWZ0cZam5R7v9AnPBef1sFUdqi0zESmz05?=
 =?iso-8859-1?Q?V72uJjmALXb6GJ/dKMJPUleYFGuFtI9YksiXI+gwX1Ulz7tVoqQ7peuZor?=
 =?iso-8859-1?Q?dTXwLPm7JZlGyQr8/RsipsQhKzCbVK5l7VjOWRTaeD6LoFdR5iEhWiPGcp?=
 =?iso-8859-1?Q?I84hJBQHfUYXL34X05jIIX8Won/vzZDCEbtw4sE1ddW/6nrj10qCA2Kx3F?=
 =?iso-8859-1?Q?PnlBewQMSheT9NZtvGHdXzp4s4xPUBGVUpIVrpAtxccamsXkdlnorIllx9?=
 =?iso-8859-1?Q?ry7ruxq0/FyM8Jtqck7Sxy6PYcRV7lzHd/?=
Content-Type: multipart/alternative;
	boundary="_000_BY5PR19MB3666244067A84C195AB7EB0880969BY5PR19MB3666namp_"
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR19MB3666.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22405606-a776-4332-2e33-08da70974f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 12:47:20.3689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIzWUeEgozewInVmOLENGhNeSJ4xrzCkVEDvQ72e9pq4UFVOZ8MZFXVR+vWBqH8oiEwcSMzc8CZ6oYWwItcOi30mBT15HlJkpe5CgF8wARg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4471
X-Proofpoint-GUID: Zo0nSSoMH57m84xkEYucJVw2K7LCOdy5
X-Proofpoint-ORIG-GUID: Zo0nSSoMH57m84xkEYucJVw2K7LCOdy5
X-Proofpoint-Spam-Reason: safe

--_000_BY5PR19MB3666244067A84C195AB7EB0880969BY5PR19MB3666namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Charles,
Thanks for the comment. We just realised we did not update license file cor=
rectly. Please, ignore this pull request for now. We will send version 3 on=
ce corrected.
Thanks,
Vitaly
________________________________
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Sent: 28 July 2022 12:59
To: Vitaly Rodionov <Vitaly.Rodionov@cirrus.com>
Cc: linux-firmware@kernel.org <linux-firmware@kernel.org>; patches@opensour=
ce.cirrus.com <patches@opensource.cirrus.com>
Subject: Re: [PULL v2 linux-firmware] Add firmware for Cirrus CS35L41

On Thu, Jul 28, 2022 at 11:37:46AM +0100, Vitaly Rodionov wrote:
> Hi,
>
> We are adding firmware files to support Cirrus Logic smart amplifier
> CS35L41
>
> Please, let me know if there are any problems.
>
> Thanks,
>
> Vitaly
>
> changes since version 1:
>
> Corrected LICENSE.cirrus
>
>

This still seems to include the problematic clause, lets make
sure we review this internally before sending a v3.

Thanks,
Charles
This message and any attachments may contain privileged and confidential in=
formation that is intended solely for the person(s) to whom it is addressed=
. If you are not an intended recipient you must not: read; copy; distribute=
; discuss; take any action in or make any reliance upon the contents of thi=
s message; nor open or read any attachment. If you have received this messa=
ge in error, please notify us as soon as possible on the following telephon=
e number and destroy this message including any attachments. Thank you. Cir=
rus Logic International (UK) Ltd and Cirrus Logic International Semiconduct=
or Ltd are companies registered in Scotland, with registered numbers SC0898=
39 and SC495735 respectively. Our registered office is at 7B Nightingale Wa=
y, Quartermile, Edinburgh, EH3 9EG, UK. Tel: +44 (0)131 272 7000. cirrus.co=
m

--_000_BY5PR19MB3666244067A84C195AB7EB0880969BY5PR19MB3666namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Charles,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks for the comment. We just realised we did not update license file cor=
rectly. Please, ignore this pull request for now. We will send version 3 on=
ce corrected.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Vitaly<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Charles Keepax &lt;ck=
eepax@opensource.cirrus.com&gt;<br>
<b>Sent:</b> 28 July 2022 12:59<br>
<b>To:</b> Vitaly Rodionov &lt;Vitaly.Rodionov@cirrus.com&gt;<br>
<b>Cc:</b> linux-firmware@kernel.org &lt;linux-firmware@kernel.org&gt;; pat=
ches@opensource.cirrus.com &lt;patches@opensource.cirrus.com&gt;<br>
<b>Subject:</b> Re: [PULL v2 linux-firmware] Add firmware for Cirrus CS35L4=
1</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, Jul 28, 2022 at 11:37:46AM +0100, Vitaly R=
odionov wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; We are adding firmware files to support Cirrus Logic smart amplifier<b=
r>
&gt; CS35L41<br>
&gt; <br>
&gt; Please, let me know if there are any problems.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Vitaly<br>
&gt; <br>
&gt; changes since version 1:<br>
&gt; <br>
&gt; Corrected LICENSE.cirrus<br>
&gt; <br>
&gt; <br>
<br>
This still seems to include the problematic clause, lets make<br>
sure we review this internally before sending a v3.<br>
<br>
Thanks,<br>
Charles<br>
</div>
</span></font></div>
This message and any attachments may contain privileged and confidential in=
formation that is intended solely for the person(s) to whom it is addressed=
. If you are not an intended recipient you must not: read; copy; distribute=
; discuss; take any action in or
 make any reliance upon the contents of this message; nor open or read any =
attachment. If you have received this message in error, please notify us as=
 soon as possible on the following telephone number and destroy this messag=
e including any attachments. Thank
 you. Cirrus Logic International (UK) Ltd and Cirrus Logic International Se=
miconductor Ltd are companies registered in Scotland, with registered numbe=
rs SC089839 and SC495735 respectively. Our registered office is at 7B Night=
ingale Way, Quartermile, Edinburgh,
 EH3 9EG, UK. Tel: +44 (0)131 272 7000. cirrus.com
</body>
</html>

--_000_BY5PR19MB3666244067A84C195AB7EB0880969BY5PR19MB3666namp_--
