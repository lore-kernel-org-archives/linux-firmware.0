Return-Path: <SRS0=jVXs=BM=amd.com=Aurabindo.Pillai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BBEC7EE26
	for <linux-firmware@archiver.kernel.org>; Tue, 23 May 2023 15:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B01F9C4339B; Tue, 23 May 2023 15:24:52 +0000 (UTC)
Received: from outbound.mail.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2263FC433EF;
	Tue, 23 May 2023 15:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2263FC433EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw+MQtdlLLJ2y6NhDYsEuNy8mbSJTi4x0tLhPuqssgDJ6ABMvGsyiCdtNwJGHIsWd1Ras1W7DskOcIv4qwa/TQVNOPqcYvwc1/JCb/N01wh2S27Sq/fvdX8VW9KcD41xsd05DQd0BnWlecJrSGLNQQnGeKvsSa7nBdBpS3Q0iHICMj1P3i1YXra+UES7o9RPvmg8s1IPJT9e/y9TAj68meywn9+2uGWKktlRW1pA9+OKQTavm9ZltJlOkGA6obWZVNRr8+cNEYLQoX4JfgCu0v3ooV697GAw59p7vXra2K4BRkweAFL78lpOdfKx5BJL4q+/SG24i/+rB+FnMdvsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KpaDe/K4HBSZu9+RbrPdEY/6+4OrIdaX8ns5auHoWs=;
 b=k+EzIlIXpm5K0up570a/z9RuHR0QQV7ZrZOOrEwBjKYLULMr/SXxsOO9ZAv3E6jFUMoOtw4Zw+cpO8fqyRMGlj9BGB8gJJm7RdfgeTfYQK6vwUqK+CxhVZhxvrDvgDXdsXSem6pnGImjviR6kFaFTko8tmvPBJjXizGETDKpUpOXe3he8GpwcrY1BUgPA2VcoKDqkHhzk5nY/F1uJVzV2qjqG9niCOS/69uhyiKBdeycKQadIOLFsy8JllZOrUApFGo6H6x2rJEu1fuWK5n8CJS8n4ts73t5GnebX/zEEZM4PmLLuNV7GVrA+ById3UYDp64/q9l5R+VKEqGk4KV8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KpaDe/K4HBSZu9+RbrPdEY/6+4OrIdaX8ns5auHoWs=;
 b=kMQwAvCavs8i8Aa5QqY7ISrP5j8hmhNYMHZGvBKnoDwO5GybUjHMCU+6acSLheF0dxmi9mtW7DuNJknmqNtoQZyjkJ19opzupoxf2g0t8t+e7WPUNBqz9dSyd8nL1Y5jsEjaFU8j/vcPJaTb5iCPjjohh73DsCJC8q/ot8rSjeA=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by CH3PR12MB8850.namprd12.prod.outlook.com (2603:10b6:610:167::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 15:24:46 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::4d3e:94ab:56ef:6e11]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::4d3e:94ab:56ef:6e11%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 15:24:46 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Siqueira, Rodrigo"
	<Rodrigo.Siqueira@amd.com>, "VURDIGERENATARAJ, CHANDAN"
	<CHANDAN.VURDIGERENATARAJ@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Subject: Re: Updated amdgpu DMCUB firmware
Thread-Topic: Updated amdgpu DMCUB firmware
Thread-Index: AQHZipN7hDuYgP1X8keKqO8/x8wjHq9ktxCAgANI+L8=
Date: Tue, 23 May 2023 15:24:46 +0000
Message-ID:
 <CH0PR12MB52844DF38CC16C98BAF6B64D8B409@CH0PR12MB5284.namprd12.prod.outlook.com>
References:
 <CH0PR12MB5284B5BDC32C5CDB44DB05168B7C9@CH0PR12MB5284.namprd12.prod.outlook.com>
 <290555d2-6bd6-b9b6-121c-3919fd951b75@amd.com>
In-Reply-To: <290555d2-6bd6-b9b6-121c-3919fd951b75@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-23T15:24:45.906Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|CH3PR12MB8850:EE_
x-ms-office365-filtering-correlation-id: cfedb026-2b40-4af0-6a39-08db5ba1d74c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sLynAv0wLwdze1IOUb2TSUKZ4LnliMn+6gItbs5oAsfpn7FvRzks6Bm8qEpv++Fj8g5SKDiTP6WLlzG45sYEnHgtOH01bE+SCp/L1ShCy3Fz+M9Dcr2iJZJfNKyP3iYMqY29R0kKXHp6S2MfG1BBB2OOn8CgtxwxBK0oi0Dp8xb7aZSBcxCxCnO9+C71BvdrczDH3M35Qn/0Gu9DsjBYhDwDXu81Sg2vfVdcjjuRIgU8xBWDMDy/tN4eEFxUg093Ji4CSFM8w7fa4Q+EcPDY4CqACw3XNoo6BkS9C6cokkGKpDwCoBadBtiT8FuHHo+8Emjj2QlukUoRPUiBUiCvmETTSybMBBLgmB+V60Gh3sK4xe+OcRfwGNCxmUksrM/agBiIrENto527/0tnqv5jkEeuxMpP1LERbARq1EEF3p45RR5Mz3DLBfzuejOnPGMPia+BDWWIrf/l5Y8nYEbeg+81bzirbrrhwz3EVR99IFfdg3mhIqxD6a5cJpri2CIv3WlUbtmTcgpw3KoX8JqHxD26zcgdV1Z4zV9QyHcA6MfHviuIrZPUYZ2m4N1J66OyaBLeq5OIlK7lvphKt/cWzjoEyeqlZpf+lXzS9IJiez8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(33656002)(186003)(6506007)(26005)(9686003)(122000001)(15650500001)(53546011)(38100700002)(3480700007)(83380400001)(2906002)(55016003)(316002)(71200400001)(166002)(66556008)(450100002)(76116006)(66946007)(66446008)(4326008)(66476007)(91956017)(64756008)(966005)(41300700001)(7696005)(86362001)(54906003)(110136005)(19627405001)(478600001)(38070700005)(8936002)(8676002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?T4xEL0Koc/Ixfjx2iwDPgkCP+LHKsUkauRs0UGYb7XU+hFnHhc4jcqC3dTbF?=
 =?us-ascii?Q?sK9PYXqU5bXRlRzG8idyVURFDCJOXgpuji+TlWjFDpTlgda403Np6RUPedcZ?=
 =?us-ascii?Q?caqQQizZ94apTfdL036boEhxP7wPcVUVTr03SlDPEMdnDlyiV6T2NJuRDlGR?=
 =?us-ascii?Q?yT7GDqC6x2zCZ0KWXjadM6hIVtqHvO09i+FlZPid1tyuwoN7KUfp4UNHg+8/?=
 =?us-ascii?Q?uDd0NK0TMziau9CZJk8uQYL8HtVMWMwHrhnI9usTaKTbyJS3rveMaQEiNuPx?=
 =?us-ascii?Q?YAymNXX6YA9s53y6zYrk+T+7Bi4bu4fAXqFIh7xpUF8NxvxGt7xQIvvQGpDd?=
 =?us-ascii?Q?1A3E7gV7hhg+iSyCEkSrYl6ke0xz2+tenOjmvJHxYl0z0GpryqGBgoN5KUjI?=
 =?us-ascii?Q?0ZT5lXZZnSafcmHjFMF5SpnzhsYGsO/uQzlx7BIl4pmBtTgUUv24JRXTP3HS?=
 =?us-ascii?Q?p68C8TOuIe6v0ycTu5FjzRcVvP8rIZWp8gEGv7O8ITpKN6fcKidcTVgLRrVy?=
 =?us-ascii?Q?hG0Aef/4XN/1nUrWlsQbnkMRWYg+BP5USJB1gIV4U4zRx/pQBt/mincvFjtA?=
 =?us-ascii?Q?wJ0v/qKOcCmNg03jNn8shKrSYdx3s+HxVbduk3kidnVLa6xM7DmsxT5BgchS?=
 =?us-ascii?Q?nqu/AzR1Gn+RVbV6OzKz5P8COC+8GeHrdyb/Gzlf1/O7cWJb8l6OfcrIHBdH?=
 =?us-ascii?Q?8NxQMdoV8IVEMCxD2AqFd5HFg/OaRe8u75X2GenrOGebyKlw+8zSp3moUyxx?=
 =?us-ascii?Q?4fSJpEiRNOeivJNhPl36zEKapXwbjdFpkkrfUjrooeCtQcQcpk7XeUsBlyCH?=
 =?us-ascii?Q?WmuwlGfDHryewOTxh6xlHOtdyRRBKgDSpw0Nm89PJkAAy+6/OPG9+Stw34L7?=
 =?us-ascii?Q?Hyi7ZXF2i9M/Fv0Rn1Zkh++4/SUEdgQtFVgm7O0qv09Pjsk//fQjRPrswQFt?=
 =?us-ascii?Q?F9/f1dWkPvGxGfONZ3KgWXUXeXiDwxcbpUpqflgA2jMQRufnKgJEmpWLYAkW?=
 =?us-ascii?Q?v24DQ+wwHLyyyfT2kcA5BW2MwWCRNPuASKEckY8hvrI4eujTiyzs5Uo6MVHi?=
 =?us-ascii?Q?ntiK3cjCrLlpFZ+e/Fe/W68FGS1dSd2BIWcuRf+WR8ubCNjB7NHN2QnDncfW?=
 =?us-ascii?Q?zJo3gQ36jjvjs0kedRE/XhW6gKLTVj7RQcAHlv/zv73lOyBzLOzhfNlwM2Lm?=
 =?us-ascii?Q?XqoDQ9jNfH1EFnhUU1JOROZmYlfPvzW6pgBGWIyBjtRKts89F2JaYcYOHMo/?=
 =?us-ascii?Q?N5mRRm+JrKaUQ/BLnfqyZ5EFKs8rergutCuvlmVBjLylmXh2W5srZw+860fn?=
 =?us-ascii?Q?tmDzOuZVhuTipcPcsSUpHkWHXeWa8QUUiR09euIXItHaulkLwEAqAq6CHmxD?=
 =?us-ascii?Q?0fLrtxwPfQrtVdNUnsmto1cbAot77+hFT27cXYnm/Fm6qD8pJysiZzCBKf/q?=
 =?us-ascii?Q?w4ROgq/4enm+Zo0xTepE9I32gX7uWmete4Qgzv1wA2ecHAQEwp0rde0f8pP1?=
 =?us-ascii?Q?oaaqrTVHSzHwUq+5Ha7L+x1B8AaaeHxCUdjCnrFWtHC2ewrjv7J/MTrF2ZKG?=
 =?us-ascii?Q?3BAJInIy+KzDL9A8TRM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CH0PR12MB52844DF38CC16C98BAF6B64D8B409CH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfedb026-2b40-4af0-6a39-08db5ba1d74c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 15:24:46.2794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imHAOyocOjp6GqYTb3c/jroxELQnYwt7Mr7lLZcOhrJGB6Y1uy6n4A4u3rJ0RTnjB826fHnQExNTQXnC7tzCEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8850

--_000_CH0PR12MB52844DF38CC16C98BAF6B64D8B409CH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

> Also, is there an update for DCN316 too that should go at same time as
all the others?

I believe this was updated recently, but we've it for next round, which sho=
uld be available in a week or so.

--

Regards,
Jay
________________________________
From: Limonciello, Mario <Mario.Limonciello@amd.com>
Sent: Sunday, May 21, 2023 9:14 AM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; jwboyer@kernel.org <jwboy=
er@kernel.org>; linux-firmware@kernel.org <linux-firmware@kernel.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Siqueira, Rodrigo <Rodr=
igo.Siqueira@amd.com>; VURDIGERENATARAJ, CHANDAN <CHANDAN.VURDIGERENATARAJ@=
amd.com>; Sharma, Deepak <Deepak.Sharma@amd.com>
Subject: Re: Updated amdgpu DMCUB firmware

On 5/19/23 15:53, Pillai, Aurabindo wrote:
> [AMD Official Use Only - General]
>
>
> Hi Josh,
>
> Updated amdgpu DMCUB firmware for various display IPs. Please apply.
>
> --
>
> Regards,
> Jay

Jay,

I don't believe linux-firmware@kernel.org is an alias for
linux-firmware@vger.kernel.org.

You should resend this with the correct target so this submission and
conversation is archived at
https://lore.kernel.org/linux-firmware/

 >    DMCUB Updates for Navi2x, Yellow Carp, DCN321, DCN32, DCN314, DCN315
 >    From interal git commit cb0677a0552d880383b1ab787377d26c550c32d6

Also, is there an update for DCN316 too that should go at same time as
all the others?

Thanks,

--_000_CH0PR12MB52844DF38CC16C98BAF6B64D8B409CH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&gt; <font size=3D"2"><span style=3D"font-size:11pt" class=3D"ContentPasted=
0">Also, is there an update for DCN316 too that should go at same time as
<br class=3D"ContentPasted0">
all the others?</span></font><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I believe this was updated recently, but we've it for next round, which sho=
uld be available in a week or so.<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Limonciello, Mario &l=
t;Mario.Limonciello@amd.com&gt;<br>
<b>Sent:</b> Sunday, May 21, 2023 9:14 AM<br>
<b>To:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; jwboyer@kern=
el.org &lt;jwboyer@kernel.org&gt;; linux-firmware@kernel.org &lt;linux-firm=
ware@kernel.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Siqueira, =
Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; VURDIGERENATARAJ, CHANDAN &lt;CHA=
NDAN.VURDIGERENATARAJ@amd.com&gt;; Sharma, Deepak &lt;Deepak.Sharma@amd.com=
&gt;<br>
<b>Subject:</b> Re: Updated amdgpu DMCUB firmware</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 5/19/23 15:53, Pillai, Aurabindo wrote:<br>
&gt; [AMD Official Use Only - General]<br>
&gt; <br>
&gt; <br>
&gt; Hi Josh,<br>
&gt; <br>
&gt; Updated amdgpu DMCUB firmware for various display IPs. Please apply.<b=
r>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; Regards,<br>
&gt; Jay<br>
<br>
Jay,<br>
<br>
I don't believe linux-firmware@kernel.org is an alias for <br>
linux-firmware@vger.kernel.org.<br>
<br>
You should resend this with the correct target so this submission and <br>
conversation is archived at<br>
<a href=3D"https://lore.kernel.org/linux-firmware/">https://lore.kernel.org=
/linux-firmware/</a><br>
<br>
&nbsp;&gt;&nbsp;&nbsp;&nbsp; DMCUB Updates for Navi2x, Yellow Carp, DCN321,=
 DCN32, DCN314, DCN315<br>
&nbsp;&gt;&nbsp;&nbsp;&nbsp; From interal git commit cb0677a0552d880383b1ab=
787377d26c550c32d6<br>
<br>
Also, is there an update for DCN316 too that should go at same time as <br>
all the others?<br>
<br>
Thanks,<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH0PR12MB52844DF38CC16C98BAF6B64D8B409CH0PR12MB5284namp_--
