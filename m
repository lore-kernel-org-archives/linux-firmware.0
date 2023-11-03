Return-Path: <SRS0=nr9H=GQ=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C97C4332F
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Nov 2023 21:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B3D3C433C9; Fri,  3 Nov 2023 21:59:25 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52F27C433C8;
	Fri,  3 Nov 2023 21:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52F27C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5AHcSqnK0ORV8ruLRMo8hJJ2LaJHseijUjoNOMr2A2xXX7yYMo2YLord7Og1MS4APHETlUaVQ82FhvuztJc5xPdHisjwocDXYk9QFK8KJbnXZf9KDKdm9KzvQZIS/pCCrvBunmIPg75X95bUqhW4ykLv92wo2pmsY0iSAHCD+3WiuiTDfO/VSYXwPGUxUuqzY+7Pp0w0upj4ukSI0HrGR9sNu9tGuAPPrmztzR1io3nbkja/Tg0298bd6j+c/Cw0vVA4a1d600j/B7+NVOPyeSV77FhcCgn9D5G2i6HVngDEvpZEKCgbK0TALt3/SZSMLzqEA9MOg/xVlKaJoc/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD5956ejdaIktiKAzMYmGj5fAc0tlnPZ34QgAbsFbLM=;
 b=Q5wzxkeL6oIiRCFvsoY3vzc+a5eBuD4hZrrPA8pEBJwd5TBNcei0skbwOnNnaEc/hIF7zZtURcKvkUCd0vKSxdgzo8WZe1UmoLoLCwRxp70BhmqyYzy65Vj6iHy+eqDMVuMQktLLpsc0wo6T49jpjlMQB900TtBshdIjnT5EGaRt8IK2Dz/Q49AaGpMlUfE2lcuXjnc2WYnR8RwUy7Fi/ofHcTxbIvPMX/jTFJjYWu2LgY3eFM/0qcTTPmdhOXBY6XBoGfRiJCN26zK6KjCijKXlo4Ikr0qEiNaUgSZM6pnkMNt/EeS4uHCdiO8ieVlXzDyYLlG+ACv3/aM9iD0p/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YD5956ejdaIktiKAzMYmGj5fAc0tlnPZ34QgAbsFbLM=;
 b=skOhjqxGY4JXgs57w+q7DNWUE8OHy1i7ygflgIRzFDYJOhbonZDVkQNMvf9OhBYrYEf1+IcCVBXYVQnYP7mzXcpq4GZo0YfSbIE2/fWoptHZOvkOiBZdKLedYgZhp6fTal5/nhdZoNzpoIqecpNzieeQNGkdSt2T4Ro6/ZLS2ko=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB8132.namprd12.prod.outlook.com (2603:10b6:806:321::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 21:59:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.024; Fri, 3 Nov 2023
 21:59:21 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, Josh Boyer <jwboyer@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: pull request: amdgpu: update DMCUB firmware to v0.0.191.0
Thread-Topic: pull request: amdgpu: update DMCUB firmware to v0.0.191.0
Thread-Index: AQHaDpMXu/DK4lfV/EeW7M6StF029LBpJMDQ
Date: Fri, 3 Nov 2023 21:59:21 +0000
Message-ID:
 <MN0PR12MB6101825A5920E5586B33B4EBE2A5A@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20231103201932.502070-1-hersenxs.wu@amd.com>
In-Reply-To: <20231103201932.502070-1-hersenxs.wu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=923d5f7f-2bde-443d-b92b-b2709a2fbf10;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-11-03T21:59:14Z;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SN7PR12MB8132:EE_
x-ms-office365-filtering-correlation-id: c9a36a60-3e32-48bc-6fda-08dbdcb822ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GlJkvkZNbxydOdnU2RbOdIGNwlIZcRuoYCQTxT/Tb1rrrDNuq0JUiCn8/J5R0O753m+1B8g3o4Ip1eO6alWfCwsD7GB6FmzyuE6p/xaJm7bWDMI1HgytR8kQH263XaATuUh1+U7Zt72tbC3gDo3hHdPHyPUGpNzACnji0RaQuMVhsIWLRgygbIiUwoGJPraVopQ2rJivo34krzopEI93mMN+7dOdgz/aTe8wW/qKPxjJwOek/rMBHMjS/0bnDrQY80WJAe5l+NLWcTnVjg/LymDUSdip7qbZHSXxhBer1Vqp91eEVcc5u3JIVIwHdGFrGb89qYBdEC2pYKYIM9pqrc2safCZvExFMSlKv0RK03hTJ+oupIlpkHhmKKsV9ozlb+6GSFkLl2HzYTnGB054Ue/aVNcB2i/0qtN/TOxH/QQkrSjMTxsng/cK+cyijBgzUERIxo6h2xuVMzTrTPoB94j0TO0NFAWOmju4F53CWb3UaSh9TJiHtEUGSsIi87bK4QcrFHeRN5HzsBzOmtWEPwCsjLDfHfPb0ZuuFfg/rLMXJRB5I3KsLt1YB26zesIXItiYZS1qSxyoFlblZVMAzCtEXwTpjSN0S0FWBrymuoUoBdNkgcTylhM0wlgiH/Il
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(9686003)(26005)(7696005)(53546011)(54906003)(478600001)(71200400001)(450100002)(5660300002)(15650500001)(4326008)(2906002)(6506007)(83380400001)(4744005)(41300700001)(76116006)(110136005)(66946007)(66556008)(8676002)(66446008)(52536014)(8936002)(66476007)(64756008)(316002)(38070700009)(38100700002)(122000001)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J8cEJjk0RLNvSzJmVoBfM+A8gV8Jmfa2k6Q1iy/7YPE4fZg09J7fOvNUb7ZS?=
 =?us-ascii?Q?ZoqUSbmudNE59MPzScZ/NBVqHlj1RDK4Y2KcuW5PFfpNw+dc8lvGopOMA6R1?=
 =?us-ascii?Q?gn552IKedRcP8oeGqzX2zu3QjDdKGg7peHdydl5nb2mKXYcbniAFRMmcWkF8?=
 =?us-ascii?Q?Zj5pTVwYDi2aR/zXu7FEzSA5AV+X26DYtty+o4N6yEjAR++1wRCnvaj/ww3v?=
 =?us-ascii?Q?lXDzFtbwtQhlGQoirUuVTDGIjWn/ZaDKOW+12LDK/ZgvbR0aEzBuTqWVRTNY?=
 =?us-ascii?Q?AJpSa7tEYeHdqBqoTBDjlu4DNqGaD4BlYa8tsF8oQQJ5DeEBbwinVcSX8LDO?=
 =?us-ascii?Q?H0QQTGHmai0CsGzj/nVXP9vAcUBV56/ZuEDOxaLI7Y88QVD360GCoKvN/bnm?=
 =?us-ascii?Q?4dC6FOQyjsgmDnIL3hSXCxnWz2KEf1hX1P75NWEDHXIevoaGx6widbjjk5p3?=
 =?us-ascii?Q?W7lQHuA31V+Usf7L/bAFTL/9E7jPTE5/wSbsQXutYB4oPeh3YnBCOCNYl3uz?=
 =?us-ascii?Q?ZBRHR1EnCvuYI2QIU7LdOkMdzoF/rm+lZkk/hBWoWmFB9wyKpFsyU6jNylxk?=
 =?us-ascii?Q?j3vOF7awr3Wux54BvpJKS1w7Al4YOYyl0nNlvXtJ5vSIfjUzI7GKn3YvR29i?=
 =?us-ascii?Q?87w8in+l4QH30WJdHx6RXGDuZUCUnekYnemt8E3V7LPg2DnfzN8E6/8GAC9l?=
 =?us-ascii?Q?L+0Bw339EIm+iAmOkFB4O8uxLqecVGbYuf6x6SQvzuUzacp8ITTol2ygSVN7?=
 =?us-ascii?Q?Pb360ssB8ETuC9hgBOESWKy13+IUcD8ZhMqqV516yijXdmsRNR+L0CBYxXte?=
 =?us-ascii?Q?IGlyfhfsx4fEUzahPEKbxP8DLwK8EM+l1ZAE+eBxdoXcr07AtzkPvpActbYf?=
 =?us-ascii?Q?Lg+94cKJLRuP2RbnEbaiqbr/SWm8HqoHjYdbM+JCfcsSPf4eAZZWgJiqlqEK?=
 =?us-ascii?Q?ZGn9ksfwclBLSdWC3+Z0nS8JbHMSeWjZiZIaQNOrKQXo+Zbv3uNr/E1OmOJb?=
 =?us-ascii?Q?sW8IniVLS8g0NQnueJ7uGroACag4apNCEw5yEO3EhGPa8dOYpS6gd8vqIT20?=
 =?us-ascii?Q?ezEIDrtb+crZQ7TCNOkrsJx6FjiA2CnMPqb6ZNvryShc1ayjHGQY7j8CFR0b?=
 =?us-ascii?Q?d+x808FeSXLtGHcEwPZ4QF20aI8agzt/zj8p4r+Tl3P0FEbd4eIQ1OdtaIUm?=
 =?us-ascii?Q?ITKCLwXPe5XIUa0OVyoo+/kyVKFVr8bt+LuTNch3n7CA3I27ByjDXNueUtAP?=
 =?us-ascii?Q?wYVGUD0IvzHCGQXxhFv6U9lAQx070KpqMPXPclgbPuOlLU8YyOtL5nvZqsYB?=
 =?us-ascii?Q?paz3KgmnKPOgtwbuhB+yg0k6xdHcEkodaiYs5yN8kpkVEgy+hbwcL6IukH6i?=
 =?us-ascii?Q?CcLeJ7kqVnJjdpp0B0Fn+WtyTuVAJsslN29bzMuWvqv7lSsLIrlkhXj9m4tT?=
 =?us-ascii?Q?nS9Znl+rvBlYiTiimJbkoxvzYETTkdCDhJaNbAVZ2cyi7h3NVLZc0hJ2kJ/1?=
 =?us-ascii?Q?S7iBRH/j33RI2iNqvru6LuDzNkHTrBH/5ZqmsG03i+O8hCcoWR8a2ElA79oe?=
 =?us-ascii?Q?khYtktqipZbqJqq3Tb8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a36a60-3e32-48bc-6fda-08dbdcb822ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 21:59:21.6624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzS7yoJOKfkc0ni1yR1tMLj8CgQoowcecRQHC9PCCUeLCMSODXtgbBSSbODB2fFCPHpFKsyiiCgZLQ+2xVSm1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8132

[Public]

> -----Original Message-----
> From: Hersen Wu <hersenxs.wu@amd.com>
> Sent: Friday, November 3, 2023 15:20
> To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>
> Subject: pull request: amdgpu: update DMCUB firmware to v0.0.191.0
>
> The following changes since commit
> 65a89b16fd43a955ac05fb67f2be5f3870fee520:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-03 15:28:59
> -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-03
>
> for you to fetch changes up to
> 65a89b16fd43a955ac05fb67f2be5f3870fee520:
>
>   amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-03 15:28:59
> -0400)
>
> ----------------------------------------------------------------


It's merged, thanks!

