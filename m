Return-Path: <SRS0=PmK2=GX=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFC3C4332F
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Nov 2023 22:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39F8EC433CA; Fri, 10 Nov 2023 22:40:13 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9857C433C8;
	Fri, 10 Nov 2023 22:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9857C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EP11DKMy8w0LP+j+RxP8uHdH4MF9aaWv8MN7liqKeSbK7lCGU3Fu1qyvgveDUB3goP/goY2kCPMGnYYhBvZqBq2Mf0Lkbh5nllnCdEVkqsxnW/LH6g+hLvNpf5PVVrg3Lis63LSs8Qna39bvxjDhXVPa9fmSkqpEKJklAGU2MFDl+65IaWyYQOBoUIZgZbLqGYJiD3Q+vaCKEhwi75FRrRP+yuE77Fk9Imlv5YqLFnIwbIo1FuHhiig+vjtvuslJInFwb6gTa9eHWb8bKnGk4+rnURjD+4ivyGyf0wCZmdnZV5FKpNp0xrQjUONGMllw4vc2MMJPQdXsoPAKtCgqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzIywTqC1Mex9oXmA4JKE558NXhkSNJTcTu3dz3pqn0=;
 b=Q8WHfP+iCTSLVkYiL6J2R9fevB7OD1gXG8gozM5tdy1pXdq3kDD3/sAjm07kFw9JPoGiGoiW36V+PTv5det2QKDvoYfdF52dpzJzko0YMI9jyT9ia/crwvQ5pIGMVzJ5DVlGiZhry0jQ+FxUktCzMxUlwCCOGlB1S153zHS15ZlY3CEr47xzZulQEo4W8fuENdWPHGgXUn5x3nrE6fEeUtP3Ban71oT6GobskYOTbHY71XGHMZ4MeBIUlW+EWZz8oTTiiiCn4Om1m+LQ2EyjtOCznLyqOi3tIGnG4KlJOWyiOw0Q7VCe6R9OwXQNsJ23HRGBrjCN3Wd31ahPOHY2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzIywTqC1Mex9oXmA4JKE558NXhkSNJTcTu3dz3pqn0=;
 b=VXKQYo0ybtCmmgXWTUL+QSkFMN1pUP+D60QI0COvJfhjnIXT7f5yx8YAyegFKF22oTl785c7sqoz1wzm48P4cY2t0H7I68GG7EmNczRJULvnOOrGamiEEx62lE4VwX3KL6HVQXtJ+bvE1eIn9CJzHppzsp24wNFYCPGd5ged4fk=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 22:40:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 22:40:08 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Hung, Alex" <Alex.Hung@amd.com>, Josh Boyer <jwboyer@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v192.0\n
Thread-Topic: pull request: amdgpu: update DMCUB firmware to v192.0\n
Thread-Index: AQHaFBv/IIeTUTcKRk6FQKBvCf2l1LB0JXZa
Date: Fri, 10 Nov 2023 22:40:08 +0000
Message-ID:
 <MN0PR12MB6101A13669851156A5834868E2AEA@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20231110212212.4065995-1-alex.hung@amd.com>
In-Reply-To: <20231110212212.4065995-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-11-10T22:40:00.8904734Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DS0PR12MB7928:EE_
x-ms-office365-filtering-correlation-id: 78337bb3-4b4f-435f-edda-08dbe23dfde9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 W6AAfE11xzP89Zn4G8Id3ys7ZsTxi329/ER6YS7cweP3H2QJzTO729IcBrW+JC71zLrjB73ZBqRzctjX3Xog42ucJFDDe69ORo4n47PhUOB7xUrJLZ2ayaeq1cKlVyWEUAa4G1yo7+jarvs9Gj9TMCYc88XlHmarmkT72fpzBxJHXWGJOISaGI2Mu8ae2HPTSkG6yNvDZ6EIxbn2AWtgr0LMfSbPaKWHM8+Rim0pwn2fheCMdHKiLKQ7m2wM4+oRJ08N/Z257CNK6DXCq2giUS/aq4Ckvf6HJ5G+cT9UoI9eZvxacL+di9LUGAYpFEweFP66mjmWPzj6k1q1h+GALDZSPjM4kXzKkmYuLiHd9ZvgR4wM6XuAIcMz8ye4XXoeRA+o6IedOFEDtdV7sgrMFOHZFnYwp56f71P4m9en4hBAaFwlay0Fp78dkfQ5hvvoc4oU/FLZta45G876rhum3wDKIfGlRemdUJD7jWh+rgBvF7ETlCZ/ZUSyKC8x1IYNlkEJcVLSsTtlvHwtp7VsSmdRyyJRZSXBrO7gEm153fxj211PwHxlsQ0/cv5DmZmEwezHwBJoHHwWfx+hkzRD8P4B5Y8pmy/mysEzRdzP690=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(478600001)(9686003)(41300700001)(7696005)(966005)(71200400001)(6506007)(83380400001)(450100002)(4326008)(66446008)(8676002)(4744005)(53546011)(15650500001)(316002)(26005)(76116006)(5660300002)(52536014)(54906003)(110136005)(66556008)(66476007)(64756008)(2906002)(66946007)(166002)(38100700002)(4001150100001)(122000001)(86362001)(55016003)(33656002)(38070700009)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gGO0r8KcCRVxfA0aSQ3RY/DMlTMGeQA0EWiX6JbyREQ5BFhlSJdedhOlYJdd?=
 =?us-ascii?Q?SjIBFwEtRQVpE6ZcHfNNncU09yutLjpuyOELFPj9wd/cK2HF8T+X+x8J+iAP?=
 =?us-ascii?Q?XOVYqnRZB/nMJOjJ2yKXu0aUnYh7x1zAjKbb8b/QI99Ty/HHuKJ393bidlZ5?=
 =?us-ascii?Q?8JkLBIbQ7lhR2WGzEZEr/sKLZKWcazDJuCaFfnTRh/7+Pd95C/ZpS8b4zvLL?=
 =?us-ascii?Q?rWPAHp/npp882jrbJYba6LFKzDjRItu5i4ibaSZp6efXN70q+rSp4bpnrGE/?=
 =?us-ascii?Q?DEQ2WzNotpiB8z4Z2GLRvJvhYMpr8DwZKhdOnE8xKm4N0G+5oAljb0EtXXur?=
 =?us-ascii?Q?WqtD/X2TmLi8i9RZG8j1+Vcf12IFA7xtv3tVYoJT7vxqzNhOpeJOIzlGOHhW?=
 =?us-ascii?Q?DmIhsZbcq2w6xR52+mawvuGFsrY52VB6JEDik+jwsiqN2vVRfVBaZBrkoQsg?=
 =?us-ascii?Q?lBPRkmeTzNsR/jcPEhavmmc/U9tDj4sy5wk/w2wUdh3HblJMVj24AeyRvZAp?=
 =?us-ascii?Q?JwrCJ5ybvdamaEOyNSZdzSsAaX76Cu2RBxxUy7f5vUF+9xsIcf3Q5EADR/oj?=
 =?us-ascii?Q?6Ib8RvCByaKmcKaKZO9tPi15FMzKznDUCH9j4VjfljdufpAcjINCBNyeUiyX?=
 =?us-ascii?Q?ziEdIpKrpsnVxYjrtkPJE/mb9gruEHXAZ+lkf73/QWXdJ1HsJNQEQhxQjmDY?=
 =?us-ascii?Q?qIXNe7zaw7RfxPSs+dFOlytT9Z6ArtFFYFse+SL8o+OgUlVo5T1xH2cht1p5?=
 =?us-ascii?Q?lALinLYWz1eIbPqeaxM02GnrqGA7N8NjanS6YZd4j4tYaXGZkXQdx27Yd1NN?=
 =?us-ascii?Q?yhgJhVV6EaDXs0yF6DofB0AWDSRIK3XgQjY8v8B7dA8qR5zQ4OuZIKGFsgw1?=
 =?us-ascii?Q?x1UOqx4PGOvT0YqwlPxVtZXy6cKGZqazNxyDSST1EEgNJkBnnNdx6H6Vfi3m?=
 =?us-ascii?Q?0xfy+LErVDFu3ZlS8nVN0tOeOBtaS75u4zsgUv+WDL1oTl2Uecdw9Rd5q9VY?=
 =?us-ascii?Q?IACe3OSNJbaRJ+nEY4tAQJRen7owipVEiUxKbf4Y9kB71Yln/KiryOaXqBNU?=
 =?us-ascii?Q?AjpnO8A/FPUp+Bkf9O8eLIwSmcQ/wMVjNUWNzyS/5j/qNA24mV88qtvRquHa?=
 =?us-ascii?Q?cVSJWnbnevB04jD+I/zwjGCc7B+Op7weLb0np7t006iKu3ufTfIZQxWCS6Se?=
 =?us-ascii?Q?2rWlWoxZ2seeTnt79YMIji5bcIIYfIGOkJ89/CVAqrpTuWFOTeBL9aYvFn6c?=
 =?us-ascii?Q?xDQIhr0hn3uwXYi4ArfOF7Vg2mc5YpJYOg41r8aSgaYrvUZf/z6ji33NNqsp?=
 =?us-ascii?Q?tAECsiGoqYzjDUPtB/2mjy2c3xoUbkd7tYAKm5tm8May7+cNXQVqk6IQaMbl?=
 =?us-ascii?Q?QY4zN3wFvsz1W4Yr/fSrjCsWvHWfaZWwbbsRGdh95miyE0VJQzqNWozsyjXY?=
 =?us-ascii?Q?QqRWXleWesG5ymXY8YJE/5gIrsnlxCXa27PV8XhHmiXfvDxvETy6SLx3kiYW?=
 =?us-ascii?Q?0kElj1ywnLJiz7SRB7pMI+wCAahtAbLYpOLKwhuq6jH3/fk/QhhUgIpd48NC?=
 =?us-ascii?Q?CU5v7DZx4lfe72lDR6b6FhLXrsqU0dPhmk29u3Wn?=
Content-Type: multipart/alternative;
	boundary="_000_MN0PR12MB6101A13669851156A5834868E2AEAMN0PR12MB6101namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78337bb3-4b4f-435f-edda-08dbe23dfde9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 22:40:08.3699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4oWiwHYDJDJq+Cl17tMTN5hwVre0p4aNfi7nzfH3pRDtDfHP0Y2P/Tr9FbPv+fOozpT0MXPLiE2S+UeVlwkZ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928

--_000_MN0PR12MB6101A13669851156A5834868E2AEAMN0PR12MB6101namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Applied as https://gitlab.com/kernel-firmware/linux-firmware/-/merge_reques=
ts/55
________________________________
From: Hung, Alex <Alex.Hung@amd.com>
Sent: Friday, November 10, 2023 3:22:12 PM
To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org <linux-firmw=
are@kernel.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario <Mar=
io.Limonciello@amd.com>; Sharma, Deepak <Deepak.Sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v192.0\n

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-10 12:12:59 -0700=
)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-10

for you to fetch changes up to c57c83846676f41a7fb4165b7fad8018b2f5d617:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-10 12:12:59 -0700=
)

----------------------------------------------------------------

--_000_MN0PR12MB6101A13669851156A5834868E2AEAMN0PR12MB6101namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div dir=3D"auto">Applied as&nbsp;<a rel=3D"noreferrer noopener" href=3D"ht=
tps://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/55">https:=
//gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/55</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hung, Alex &lt;Alex.H=
ung@amd.com&gt;<br>
<b>Sent:</b> Friday, November 10, 2023 3:22:12 PM<br>
<b>To:</b> Josh Boyer &lt;jwboyer@kernel.org&gt;; linux-firmware@kernel.org=
 &lt;linux-firmware@kernel.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Limonciell=
o, Mario &lt;Mario.Limonciello@amd.com&gt;; Sharma, Deepak &lt;Deepak.Sharm=
a@amd.com&gt;<br>
<b>Subject:</b> pull request: amdgpu: update DMCUB firmware to v192.0\n</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&nbsp; amdgpu: DMCUB updates for various AMDGPU AS=
ICs (2023-11-10 12:12:59 -0700)<br>
<br>
are available in the Git repository at:<br>
<br>
&nbsp; git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-10<br>
<br>
for you to fetch changes up to c57c83846676f41a7fb4165b7fad8018b2f5d617:<br=
>
<br>
&nbsp; amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-10 12:12:59 =
-0700)<br>
<br>
----------------------------------------------------------------<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN0PR12MB6101A13669851156A5834868E2AEAMN0PR12MB6101namp_--
