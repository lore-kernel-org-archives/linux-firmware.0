Return-Path: <SRS0=LiVz=PH=amd.com=Pratap.Nirujogi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28881C3DA4A
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Aug 2024 14:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3D61C4AF0F; Thu,  8 Aug 2024 14:38:00 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EC5AC32782;
	Thu,  8 Aug 2024 14:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9EC5AC32782
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/URxSgnhKfmqFkr5ub9sXGlFFFjHMeG2plhG1FqDdRrgDSC4n1yLbXrmlwNct06vBUCINxgjyHF9MShXt7De8M32esmRyK126WDcEgOCGGznCiGa+4b++qfJYoAgC9HxLLQSEbxpYy6xp1eRalW8OjBu7yDMbo75vgKZkCZRbJ7UohLudmUpS7US3rq8HcWCilJOAe1q74FOPGeAegEOWDzJ/MbWkSuqLE1HMvZYIcG698Yh6bp4E3K1txrNaflbE2UOjZX38zOnQ9JmTmKuJ+68AaHI3/1Zk4j+H6gVzvrY9OyzfbXs09pDS+Axu/IbRnXvcq37SKRVqlbPmx3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgkLIoBD34DkloTytlLxgHPJfCuOpEtgd6RNL5JSckk=;
 b=rOIeeNoTrVgedS3PAzGTTV/OJ3G5g+bsGKwU28InsmGNBnnXeEwHDT0bsdLGzYGo1z7GTUuIrzzj23KBZoIt6TnMLjY1+pkFAWeHJHrKIQ2AweH1A1IOAtZC688em5Z832gA9iAlum2mR6txeHuCo6JV9hW/EmNii9m6ScvIpBrIxZxEgRj2+QzxV3Y2/33lGP30lg/RRmTEvDLIiJlNNp7JhaqOQQRI41CpLVjJ0p427y0uu2Del2ipY42hOfsgWw92ifJNx4DeKpXVCERMKCpzB8vzWhqcDi1T5jpXS7/3ZNdOCk3rWTsbF3oqQsOihiO3BzDOGF4QdEfEigovbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgkLIoBD34DkloTytlLxgHPJfCuOpEtgd6RNL5JSckk=;
 b=IRcISb6LZ9HXLouWAs6ZRaj/EalVQWFD+nLrGD7ZjwE3Uv2WIw3DuXHsDNUCFRDYSeppg5sg/llA/jSxThKlvUbbN4EEmGdce6RAQlUEd7MP+vRz81nTSN3y2AoNXP+05TYeOZR7bD7I7p5y0/QOKNBmDd6CbC7jQhICYp2Wq64=
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CH3PR12MB9098.namprd12.prod.outlook.com (2603:10b6:610:19e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 14:37:53 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 14:37:53 +0000
From: "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, "Chan, Benjamin (Koon Pan)"
	<Benjamin.Chan@amd.com>, "Li, King" <King.Li@amd.com>
Subject: RE: pull request: amdgpu: Update ISP FW for isp v4.1.1
Thread-Topic: pull request: amdgpu: Update ISP FW for isp v4.1.1
Thread-Index: AQHa6YkzanBWSp5SSUy37KzSLNV647Idbf8Q
Date: Thu, 8 Aug 2024 14:37:53 +0000
Message-ID:
 <CY5PR12MB6429A4FD1DB859BA68E803A5FEB92@CY5PR12MB6429.namprd12.prod.outlook.com>
References: <20240807202233.246768-1-pratap.nirujogi@amd.com>
 <CA+5PVA62Vi2x4+pNLYjsOQm2KBsGfYHqAiG5M-ioNuj_BFzjhQ@mail.gmail.com>
In-Reply-To:
 <CA+5PVA62Vi2x4+pNLYjsOQm2KBsGfYHqAiG5M-ioNuj_BFzjhQ@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=66cae8ab-36db-4e80-94b2-c2ccecfacaf1;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-08T14:37:45Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6429:EE_|CH3PR12MB9098:EE_
x-ms-office365-filtering-correlation-id: 617c5361-f2db-4682-a4d5-08dcb7b7af7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MTBmQ1c4VFppOTRXOTYvTUNnQ1BITWdWcjZYNXJ5QktyK0VwZjJDb2NlRDNH?=
 =?utf-8?B?dHNPWFdnVnk4WnF5dzZKRVFkTnFoNGZiOUF1QThZTnRKMzdsaVJZQVdXWXJV?=
 =?utf-8?B?QXBZVFJsT2h1a1ZKbmJWR1JPUnh1WktObldOOW8zbTFwR01heURNSDdkS3Q5?=
 =?utf-8?B?alI4OVNkSCtId3J6R1Z6ZHRBclc0aGFoZm1qQUxWcThzTEUrTVB1TzdEV043?=
 =?utf-8?B?TktEbzE1YjB0K2wvdjlNUUcyY2NvSTJISHh4VzM2K2VEN1d5UlVPeGRJZURt?=
 =?utf-8?B?VUMzejBKWHkvQ0wrZzBCbW5XNlZiUklSNUVCeHJnMU01d3NxcGliUGRRWCtt?=
 =?utf-8?B?YWpEZlpNYlVOR2JoeXpHOVFIL0dHMnIwT0hRQmFZR1o0RlRwTXliVXFQVlZV?=
 =?utf-8?B?VFpTSkpnSEdLZlhFTFNCSEh4VWhYSzRiUkRQYU4rS0l6WlFuMzBIL2QwWmE4?=
 =?utf-8?B?b01jZ0U1QmxKNEt4N1NkNDFwUWxtSFhIYm1UM3RXN0tXa290bHIyc3pYTE1D?=
 =?utf-8?B?SzhPRVFHZ2VKN0M4UjhqL3NkbVJJajZNMUFCVks4Q2FQZXUra0EzQ01DNEVa?=
 =?utf-8?B?SkJSMjBleHZRbXl5bFpCbVcwa0gyTzFpeDdnUmlYeUo0dGpZcUVzbHY2RGh0?=
 =?utf-8?B?WW9ORzhCaFpSYVFvNzVPWnE3aFoweTZ2Q093MnVPOHVmZUlSb0lXUitkd3Nm?=
 =?utf-8?B?R0RKc0ZQV3FLR09Cd1dBamVSSHgzRGN5NG1xd2hWbHZTcVZzMmRyOHo3RlJI?=
 =?utf-8?B?bEtPMENNTkFseUZmb29QSXpjbjhvTlZ4aVVUMWdEMlJtUWNJaE5Fb28xVXFo?=
 =?utf-8?B?L0VqMGp3R3BaU21hZTlXRW12QVV1bW1hSXVKWFc5elRoaDEvdjc4L3ZTdzh6?=
 =?utf-8?B?NUN4dmFaU1RiZHFZd05QamZvTFdxNm9aZU5XdytjT0hiWGg5czRicGhCMkQx?=
 =?utf-8?B?dGF0N1dPYVVyajBnTVV6SkRMNGtJYXp5OXJVUzdLVHpyU0xwUW9EWm15Q2FT?=
 =?utf-8?B?WEp5WXhBa3g2eUR5d2tKYUY4Z3dPZnlNQ0NmVzk4eFQrRXdFdFFPZUpEbnV2?=
 =?utf-8?B?TTFQeUszWlJIdUJSLzM0UFg0anJWRk1zaGsxaWxEajRrK3B4NXNUSVZXUjU4?=
 =?utf-8?B?MGZMb2lRMFJKWXBrelU5L2VPcnBydkh1YmViYnFpOERWSFdaRG9OZTh4TkVR?=
 =?utf-8?B?dWZrL2owWTNqSmwwVmc2UkM1UkNxTTNaN0VScXp3eENpYmtlMVBTcHNvRnNp?=
 =?utf-8?B?ek50YnlmajZuTkNHZmdsNkFOK2NmRkQ4eHlIRyt0K3FIRjdvdm5ycUpiTVBh?=
 =?utf-8?B?Mm1JcjJVMENtUFRoTUhBS0huNWF0UzdBeHZXRUIwOVZxaGhZTTM5UHBZYkRx?=
 =?utf-8?B?M0k2N25TR2wyUDBqWEhrUk96dlRNMzdKU2phQ213dEtCMFR3QUxMdzl1YkxW?=
 =?utf-8?B?RGFHblljdkdQV0x1TlA4UStvWkZOOUhzR0lsZHVyMDJESGxRY2tYMlNCZit1?=
 =?utf-8?B?cXhCclY5c1NhRFlEanpybHRMNjVFN1ZQMUo1NHpjdElKNHkyRVVZN2NLMTJo?=
 =?utf-8?B?TUVRYVFLVHpqMk1tTGw2ZEZ1eTB6R0xwQThyaWpIZ2ZKbmVCWTgrekdhcmpX?=
 =?utf-8?B?SmxSK0FQY05NVk1OaFhtZ3JwV2RwSzhBUHllamk0VmYvZ25KZHlnRW1lWXN3?=
 =?utf-8?B?cVQwd0wrb1ZSV2VUeHJKTFF3OFk2TEg3a3BaMVF6M1ZBd0YvRERWUVFvRnd3?=
 =?utf-8?B?R251ZEJqWDVyczducHpyTk5SNklQK3ZFbEhIV3JmZ1lqWWRSdDhSNlJYZERN?=
 =?utf-8?Q?qwWjZs1RIygdpg6kKKufSUqVInbk/tzRVOwJU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjMxejJCZzNZem1lY002bzZ0NFRxdGZMMlV6Wm1OWE8xdDZJSmtsT0ZKQlpM?=
 =?utf-8?B?V2k2K3o1NWJIN2tiaTE0Sjh3eXlNK2plNFg5a1hoQXlvNXM4cjVLci9VRlg0?=
 =?utf-8?B?Mkg3WnUzV3hOVy8xMG5QMmgwU1AzOXdudnNteVk2cklBRVduMjFVMXRxNytO?=
 =?utf-8?B?SmdVbE9qakRMTGFQVlRrK0tVMjBabmdGZUlZN1dmQUV1d3lUKzNJQThGOS9G?=
 =?utf-8?B?MXdlaFcycE9LSFN4S01iWEJmeDZFaUhNRjNqdVNiMkxDc1VHQXVBemo4UUZt?=
 =?utf-8?B?U3JiaVdPYnErQ3RFbE5LTWFHb05BWWhjMytvT2krUGRma2g3UWFKQ0dMcy94?=
 =?utf-8?B?ZXZ5OVFlNTlpdGtPSVlZZkZlSmtNM0Z4c3g5TFVaeDBmM0ozZkhMWTNOZUpJ?=
 =?utf-8?B?N2xERERhczhRK2krYU94S3RjaDc1VDNpRktVVVYyYkxvRmdxQVdzbU5oNmUv?=
 =?utf-8?B?aFJLTUtTYkZ0NnM1dmwzczRtWWVpQnBwRERGK3ZuYmFrUE5GNFFjblIyakIr?=
 =?utf-8?B?WkpmYThmRnZzQXFzdDBqeElRMEhpS1IrWjN4RTZPQ0xWZkdLTXJRUFZmaWYz?=
 =?utf-8?B?UjVDRE5DOFIwdEtDWk1nekJXL3l5Uk93WVdNV1M4NHMvYkRoaDI1U0VDVWh0?=
 =?utf-8?B?WWRsWjdocmhRMk5OaWxucllmWDdHMFUvN2NUR09kVXZPWHZpcDBIS1l3M1JZ?=
 =?utf-8?B?ays5aVRTSkxOOERMckNRZ3pyTkl1QUtZWkgwcHVBY1NlSTdLbzNKNklvUzdU?=
 =?utf-8?B?aHJsSmNjakVIR1pCRlhaM2xQVmpTRlVPTnNQcy9xa0N0NjBjOElieHE0ck9v?=
 =?utf-8?B?ZmxKUUV3Q3l6QTNJYjIzbjd3c1hTc0ZUWGlaWElFOTNaTTlETHhPQkI3a29m?=
 =?utf-8?B?Y091N3IwY0REb2ZZNEw3aWhDdDZ6YStTRmZrR0VpeUU3SDJFZG9Ua2dvaHV1?=
 =?utf-8?B?N0lXcWVVR0VHaFVISWJzd3F4a0p4NHlzbXJkdDREdDdzdTZ1SXRnTUdDUjMw?=
 =?utf-8?B?Y3l6Q2FWMjhpa1VCMHh2dE1vOTFjK3RBRm9tZzRoZ3JKM1U2S2RLaVh5MGY3?=
 =?utf-8?B?NlQ0S0xYSWh1UVRtMjFSQ2ppUjR5OG9sc2NPbEhxMzVNdG13VldwaTkwSVpK?=
 =?utf-8?B?SzZsMHROd3BDQW9UK1U2NjNWenVuckNKR2NCNjgvaCs0dHV2TXpmYldrVEF0?=
 =?utf-8?B?V2Iyc3lzeVU4Q1hXMEM3QmRwbTVQMHR4dUNBMHViNDVISHkzOGtDL2E5cERE?=
 =?utf-8?B?NXZUdlBrQ0lHL3lCa0NpR0xBSFBpQXhOcldYdEQ4cnhXajBIWGN1QTBWcUk1?=
 =?utf-8?B?NWFwVVo5K01RREpEY3Y5cTVHU1B0Mmw4ZVZzU29OTEZ2clE2NkxRNDlrdzQ0?=
 =?utf-8?B?QUhIQlNrc0VUQnVmaW1NQ0RaWTBReURidG5KU1FSdTJhNysybFVxMEJlRE9N?=
 =?utf-8?B?Tk45TE1ZZVJnZ01tR05EVHBBVW81SnQrRkZDTGFRR3FoRGhhTVNWZE5XVWxF?=
 =?utf-8?B?SjltbnFza0ZlallCelRKTEtoZDJ3Z0RGKytjcklSU2t1R1JONzIzc2lXejIv?=
 =?utf-8?B?QlluSG1hVDJhOGJWcXNDTGFKK2luMEljSTlJVU1qdUVxQlJOcFVYUm5Ra1Ba?=
 =?utf-8?B?OVFobTNHOFd1TWlYR3pHVUJyY3k3TWdxa3g4aG8wdk1kZ3lPT2VaWXdVa3k1?=
 =?utf-8?B?L1JiOXRqRmhXdzJwUjcwN3YyUVcyWkNpamVidGwvWWNHNjN3L3gwOHlkbmM2?=
 =?utf-8?B?Z1lqRkdncWlReHU5Z2E1RytmYnhHdUo4WG1kOXIzQ2dmTDVRK2hCdjNKcVNx?=
 =?utf-8?B?M3NuQU1qNHlYUlpPWFBxcVNvaHUzNHJKTmlUTUdvYUpkMFFuT0dzUmV6N21E?=
 =?utf-8?B?cy9XcVpCQnM2Nm9pRW9nL1B2aXZQOHQ2dlZwYUpYeXJQSHRtU0cyUUZLUVZB?=
 =?utf-8?B?VlVaTTdxdEs2bEtrcVAvRklXRW1Mcldib2pueTlnQkpUVnVzRkZMN2FWMGNO?=
 =?utf-8?B?eFFMQVFQNGNxOTZFWnRlMlFTY0dJZ3orVG9GdzFQN1diQ0hXalBaaXRBWTF0?=
 =?utf-8?B?WjhVcncxUnRxQWpsNkFCbFgvNkQxSzN4U3Fpc2c5dllsK0Q4MG5sSGl6OVcy?=
 =?utf-8?Q?ADHg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617c5361-f2db-4682-a4d5-08dcb7b7af7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 14:37:53.0823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tv8at/JSTrh33Zycn7DySrnxGK2/xdbLGakEiu/cBs3eX8WFadvoHHOUA56rUrlG255XX/GKrjn3XZ0RnIbAWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9098

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KVGhhbmtzIEpvc2guDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKb3No
IEJveWVyIDxqd2JveWVyQGtlcm5lbC5vcmc+DQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDgsIDIw
MjQgNzo1MSBBTQ0KVG86IE5pcnVqb2dpLCBQcmF0YXAgPFByYXRhcC5OaXJ1am9naUBhbWQuY29t
Pg0KQ2M6IGxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmc7IERldWNoZXIsIEFsZXhhbmRlciA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGltb25j
aWVsbG9AYW1kLmNvbT47IENoYW4sIEJlbmphbWluIChLb29uIFBhbikgPEJlbmphbWluLkNoYW5A
YW1kLmNvbT47IExpLCBLaW5nIDxLaW5nLkxpQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogcHVsbCBy
ZXF1ZXN0OiBhbWRncHU6IFVwZGF0ZSBJU1AgRlcgZm9yIGlzcCB2NC4xLjENCg0KQ2F1dGlvbjog
VGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9w
ZXIgY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciBy
ZXNwb25kaW5nLg0KDQoNCk9uIFdlZCwgQXVnIDcsIDIwMjQgYXQgNDoyMuKAr1BNIFByYXRhcCBO
aXJ1am9naSA8cHJhdGFwLm5pcnVqb2dpQGFtZC5jb20+IHdyb3RlOg0KPg0KPiAgIGFtZGdwdTog
VXBkYXRlIElTUCBGVyBmb3IgaXNwIHY0LjEuMSAoMjAyNC0wOC0wNiAxNjowMjowNCAtMDQwMCkN
Cj4NCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+DQo+ICAgZ2l0
QGdpdGxhYi5mcmVlZGVza3RvcC5vcmc6ZHJtL2Zpcm13YXJlLmdpdCBhbWQtaXNwLXN0YWdpbmcN
Cg0KTWVyZ2VkIGFuZCBwdXNoZWQgb3V0Lg0KDQpodHRwczovL2dpdGxhYi5jb20va2VybmVsLWZp
cm13YXJlL2xpbnV4LWZpcm13YXJlLy0vbWVyZ2VfcmVxdWVzdHMvMjY3DQoNCg0Kam9zaA0KDQo+
DQo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0ZjEzMDU0NDg1NTNiNzFiMTM4ZWUw
ZjE5N2Q5NjI5OTAzOWE5YTUwOg0KPg0KPiAgIGFtZGdwdTogVXBkYXRlIElTUCBGVyBmb3IgaXNw
IHY0LjEuMSAoMjAyNC0wOC0wNiAxNjowMjowNCAtMDQwMCkNCj4NCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
