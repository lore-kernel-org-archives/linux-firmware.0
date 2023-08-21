Return-Path: <SRS0=jzhk=EG=amd.com=Wayne.Lin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00326EE4996
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Aug 2023 02:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B22B2C433C9; Mon, 21 Aug 2023 02:30:29 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2049.outbound.protection.outlook.com [40.107.102.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32ED6C433C7;
	Mon, 21 Aug 2023 02:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32ED6C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbr3IgJIy3/WKAu1ieiiGea4x/Gdg0CqPAYUVcVIVb7fPGXy3ASRyoEt/H0q8HpcgNqpJeW1su46wDHK14SMD2aJ3AXCrLN959/rjhPcd5e1v0VxxP1lBaRX9zlYnVl2bYP/0b5E+NKBwHFVGOgyb99X6ADzgqVpmTCilBvdA3l8hfMLhM4KnZSeopdzhL+PmdweqX4N+22HJKSIKIMXenrEnPOnxW/LPMUIvMipC7zMU70pn5TIXxAiSBg2gAg9RzkGh+qZwBdLazTAH4fcurZ0RXX8HNri1mePq+dZTX2ehZACierXfuG9sOh+0/iV+nDPat6w4gxH2QN80inpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV6UOIWXQ24IoxXIODcHQoZ6nTUh194SwXuuWZ+6EBk=;
 b=AciaF2yXRLSGvgb8lh/6XnUlC0ycbIgRZ6DtcHbvFIIlTR4qLV6UAVQL2sPONKOSD75bioKjg3Xhln6f3WayGlCLFTTjg49XRBBhoQIjhgdhlxHf3RsHrHTmdi/F07wiREhslV2ChV90mooLeqQxgOgBpaUTPTQPEI6ADau4XucdL0lm6iacCNw4lr9paQ+JVovaOu3beziZ8x43bBkp3NWbBMr87pyiekAoO6GUxm/SBL1QKv4+YbeE9xUSYQbFd6itfxDlvUV3qImvXBqSD7W5YuDD44+qrYYW3G0f3sWo7X5FmQ2KYj6c94T8slXYD5tMhB3CZ8+liUbkWoin1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV6UOIWXQ24IoxXIODcHQoZ6nTUh194SwXuuWZ+6EBk=;
 b=4mvb8PMyVnHTGxECNHMEuyX0+mGa8DAKXtLl5Cmk7bJYt6V9j4jsRH33gpKtCEWrpBLCRmtEtUyHHPxTzdprqh9DG8U9kYA9MBN0cJwmVEQ4/Fp9LC/x0XcuFrrCoe8/dc12zeabC6bcz6z3UoVOGXKLso2YBskPxOEHWHrtNEU=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 02:30:25 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::6c8e:fa7a:2604:da9d%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 02:30:24 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "jwboyer@kernel.org" <jwboyer@kernel.org>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, "chandan.vurdigerenataraj@amd.com"
	<chandan.vurdigerenataraj@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Subject: Update of amdgpu DMCUB firmware
Thread-Topic: Update of amdgpu DMCUB firmware
Thread-Index: AQHZ09YT1b3p6a/ywkO1DuD51GNiog==
Date: Mon, 21 Aug 2023 02:30:24 +0000
Message-ID:
 <CO6PR12MB5489D16A4E8E7301B9C43911FC1EA@CO6PR12MB5489.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-21T02:30:26.807Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|MN0PR12MB5978:EE_
x-ms-office365-filtering-correlation-id: a89b1ed9-5b14-4926-5d25-08dba1ee934c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t8HfY9ZDiAX2nEjIvO32JohXkEGA/ZWUThWxgZaGm8NHfuTVGYy139uwtU3nKD4FxTuZUDuByCud9CCprKSDLx377Xr9Z60NzSKUQa2+BXn47vmjGv3A105L96hQ4/UNaTYekj8W0A3nU26y3Qm2WEXiVNh2sq0C6hcbQIZXYarShGXV41zX0ns0WFMqTv1NsuC6Nx5Z32w8F2jSqCmnypFFGbGE3EYVLGGktavq05R44an/d30gV0a9xKZkYWYSNt9VyLMoDFpIN39CWwrOIX/jIUBAfWnVRUvCmetdFTuUYNhfHZJLOZV+d5Wuh3VQHesMArK51QUR+Y4aB56zL5fGKPvn/zPsbHzyIduxgeIFPe8XHuo3ahaAZkp/0H9MygD4FFkqrINTg4vPNY298TghyjHur5cYMwR16wLjdbeUdK67GShjhsX82aDInPNklE+CO8qFK60t85Nup7A+oBgwGCzyvL4CVr1292bxR0c4piIKhB8WQyBKgfrRpTAkQIZ9+KCX/leklzd6kzKmRiSWqN4peW1CEi4j10M4MwryEdi8dY0S2qtcMwNh3NzjbZKzbNWF68prtuKPRhiIF3jc70J15iGb/EHqlQ8zEMQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5489.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(66446008)(66476007)(64756008)(54906003)(76116006)(66556008)(66946007)(316002)(9686003)(91956017)(110136005)(450100002)(8676002)(8936002)(4326008)(41300700001)(122000001)(478600001)(966005)(71200400001)(55016003)(38070700005)(7696005)(38100700002)(55236004)(6506007)(15650500001)(4744005)(2906002)(83380400001)(86362001)(5660300002)(33656002)(26005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+S7g540gd/I2IZW+WL+SDqEvg3RDe/dy8HYythGJjuwfceEf8XjOKLVMz6?=
 =?iso-8859-1?Q?LxVGN/Phk6u1u3pPofuDaYTz+j15pqb8utqXAvpSIlg6cCSbCuxodUPazb?=
 =?iso-8859-1?Q?QJjX9WMtX5XVlyPExc6pRnMw5hTPt/X0ldiDI3P0lpMVGKPiW7htll78BX?=
 =?iso-8859-1?Q?4YF8eQm3qBqTg/3LnSNqliTgZKwHk+V75mub+i4KnX6DyPpJQKMGYC8EQj?=
 =?iso-8859-1?Q?kBalWVFWTnN4BWZ8FgKlZRFpMuw1hNA+t41SdU74UbjV85RY33E+lvt5OO?=
 =?iso-8859-1?Q?+13QcGe3XUkph6GDbg6dwkcqOkR7ET4dP6f39ID+4QQbDyTPW1oZZ+El9n?=
 =?iso-8859-1?Q?jFpdmZS1sIY3aGqOCY3VWi6I/kgLnypP4R/cnag/hdXOPN2y5/CgIwznt9?=
 =?iso-8859-1?Q?uapAusqbKsOUlTcrBcCDq+TfaTC+n/pKaUT2WGeq7AJ5uW5TqaJdncj+6R?=
 =?iso-8859-1?Q?rnVpB0zi9ejuW3PkJ4l34YYsjXkl9OcyatWHOq1eBNvAzZqrCWEH29/vKl?=
 =?iso-8859-1?Q?WPHHei3HjC5vhepM/p70ICPT24k607VmoC7/iaX2TQDvm1jRdaAltM+Eoh?=
 =?iso-8859-1?Q?PkGqxFwbOjMIjzyaYQm3CKVkBexPBI4Bijmor0QR/5fZeTesK95PuxWPhv?=
 =?iso-8859-1?Q?YBelU2bpC+TqLZQsWwE6Zd7TmKZgtq8cWHf1WGn9PdeuxTUNHyAIOM8Opo?=
 =?iso-8859-1?Q?I/U24tM5J2XGbFVeoMROgjENujoiLIzN860Yk3xECDClgvkqoGHyVR5X+/?=
 =?iso-8859-1?Q?G2dIHj3l91IDYiJGw7QrPbUJJUJhWE0sHHlCh12qjbnoPKlK9xIo8qH2mH?=
 =?iso-8859-1?Q?WO6GxiWHcKk7QOFKCmrIlqZvKT50GVoIh7EgwOijSpNxfpEQx4qKHaxOFk?=
 =?iso-8859-1?Q?DMEwjbdYR5Z4NTjvydfCGuXE+8OXtAwBGSXMSdQrkI+UBux/sA4yoDB/xY?=
 =?iso-8859-1?Q?RgOI+5KQ4S4aKchnnH2wjBoidtXZrP9Mkq8XS0gbzmvbHP9sQtCgU1HpUQ?=
 =?iso-8859-1?Q?ykBxayWsuCGrCHkjHd1CQ2jxTzVYF+cZ9GIU2xVCfkLBLLY57+BhN4C6ID?=
 =?iso-8859-1?Q?1HUXBDKkaN0EXkxR1P3U13fTuODGefbelPrXQEuTCjvGCySnXwWXvhSkrW?=
 =?iso-8859-1?Q?YH9wVD2PLzGHkHby5Xsmqdo9iQ1ayRdIGe+SA2fUeJwSFJ6Lx0oWHNZoAG?=
 =?iso-8859-1?Q?v3HJZJKvnA80gQyRV581y79d3Vn7HiWcEMv9M+eXr2lMpDz3BF+xbaaqju?=
 =?iso-8859-1?Q?Ta3lMf9DxfZWmc66EkjZjq1+ix7u8pF84nE5hAaZUEs0SLBbZHVIc/vXcH?=
 =?iso-8859-1?Q?jHP0SzL2okFwxTiWkvIXteyXVZhhdYbbjjoIouOAAEqXEi74LI3/i5nDeM?=
 =?iso-8859-1?Q?BxdOwZkfNFpb/swjPdcHSTcx0c0iQTno/DBy2TFiRecp2GQnZAQe7W06aj?=
 =?iso-8859-1?Q?a0MKfDzKmULfrUQWwmsDJt75lAD4gMtyQQAWBP7bftky+FWCAZEHKIj0oq?=
 =?iso-8859-1?Q?VtoZCAU0LEBqJLEeumwZWJwmlpMCpC1b7/NM+tdlCR/C6QWLfjY9sN71Fd?=
 =?iso-8859-1?Q?GdVWKTQTMq8ID32+YkW2PUrBWRXJA4qdC6uXtPBKB9Orn28OUcVuSkrXBH?=
 =?iso-8859-1?Q?9jVsDavuKbpDs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89b1ed9-5b14-4926-5d25-08dba1ee934c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 02:30:24.8363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUmEQKAa0l8Ce+3wxBR7nW1/pQZMb4Mk14//4Eje/ZX1sX+W5Z3l0OK7Tj50NF9YKsIJLYJI9S3E5tmsiiZLFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978

[AMD Official Use Only - General]

Hi Josh,

DMCUB updates for various AMDGPU asics.

The following changes since commit 0e048b061bde79ad735c7b7b5161ee1bd3400150=
:

  Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmw=
are (2023-08-14 13:03:41 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-18

for you to fetch changes up to 5eeda20da0d7c79ab38ea3337bf402ce90246e8c:

  amdgpu: DMCUB updates for various AMDGPU asics (2023-08-18 10:59:22 +0800=
)

----------------------------------------------------------------
Wayne Lin (1):
      amdgpu: DMCUB updates for various AMDGPU asics

 amdgpu/dcn_3_2_1_dmcub.bin | Bin 232224 -> 232352 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
