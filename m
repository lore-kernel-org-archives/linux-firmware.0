Return-Path: <SRS0=rmLN=U7=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2568C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Apr 2022 14:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5924C385A1; Thu, 21 Apr 2022 14:32:29 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AF6AC385A5;
	Thu, 21 Apr 2022 14:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8AF6AC385A5
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl400iftySM9irb62TpITNVdzZAR6pjhE6YUuMvd9nMOQW6SiSRgB2NO5phnDkZD+ejLY8L78gw00xmKorB1YuW6gv7sQMiJytd7TeGd8+47sUrHkJMyNTLW3oU3XYa7iovmJkwWKvq60KrTZ1g9puft/dx20zbxOHFq/ciL5blC9GXcsot8rANZAXEDuf0DK9cFX5RJ2KHC+LJNW5iwbMsCRyHCTpQwRSyE9LpBOH4jqDW1wr2zwlRogwG0Su+XweH8Maz3ZBvb0lwN4azTsRlWdMrVoJihfC1y7rRAkgYxJilfv94RGBUbXsGln2WfWVMtj7r2oaQq4a/dOc/gMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/7BA8GlupsEvQ2MmHqrjusucTKzAohknPn40AlJe2Y=;
 b=bxdDDZJERk6rJn7hmu/1JREA0GYNHxp5HTZljn5ZsGQG2W0VwhKadXbqx1dlxwhkLUSpCJvYMreVzLGstsv6oYA07X3OZaAXQ6LY2P6tJhEC/ky9RQ0pp+ja+eRoOo2U+PTFlelgMbm/8+i297zQEB58AgwQVab/9o6+/FhkOVoT/QYytJ+BguZ/AkLkok+tPtLExs/TjPYy2TbaznJOvWcWEkXnuCTSnereEcSv5FMBXBN7lb28C6AQM+DnOvyeZa1CmImaRxDoPWsms+9cPrEjRa0iy3UEzte8ZjEpO4beV4Ywl35IUM2OXJ3WUaFMqe+wbMhVw6lKn8JEEqeRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/7BA8GlupsEvQ2MmHqrjusucTKzAohknPn40AlJe2Y=;
 b=m15uw7Dgz3tjLLS0lNwV7FgspzcOfdDyrvC8fFYJheTbiaQXMsBzUOFkwtHQeAmQcoAsKH15nr19GdaQ8L3xUTgpbLq1wp+0JwY41VkS0QTJX8Sw2GLh4Hq6voyPFCVAUSpaMbzK8HOlpSqKSKDlNK7fdV11tfOsr8ci/HMR7l0=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MWHPR1201MB0221.namprd12.prod.outlook.com (2603:10b6:301:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 14:32:25 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603%8]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:32:25 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Josh Boyer <jwboyer@kernel.org>, Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Linux Firmware <linux-firmware@kernel.org>, "Gong, Richard"
	<Richard.Gong@amd.com>, "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Subject: RE: amdgpu firmware update
Thread-Topic: amdgpu firmware update
Thread-Index: AQHYVOWzJ8z9PgfRdkeUffXseJmSNKz6L5CAgAA/l4A=
Date: Thu, 21 Apr 2022 14:32:24 +0000
Message-ID:
 <BL1PR12MB5157DE3485B79DC56FC7CA05E2F49@BL1PR12MB5157.namprd12.prod.outlook.com>
References:
 <CADnq5_NnRNNVXXMN3=keE1W+DYP01Nv_A_Rr44p4YBObTXqqjA@mail.gmail.com>
 <CA+5PVA7D6suT1EhByhRXf_8kHWDdTDCwvf-Jey7Cu+3yrg3p=g@mail.gmail.com>
In-Reply-To:
 <CA+5PVA7D6suT1EhByhRXf_8kHWDdTDCwvf-Jey7Cu+3yrg3p=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-21T14:31:28Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=53946692-c009-4bad-9f82-2b18492fe1bd;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-21T14:32:23Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid:
 daa2af75-7811-4caf-9571-7e46db169583
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 549149ab-ac71-48af-e362-08da23a3c0f3
x-ms-traffictypediagnostic: MWHPR1201MB0221:EE_
x-microsoft-antispam-prvs:
 <MWHPR1201MB0221DF07CDDEE682D2082353E2F49@MWHPR1201MB0221.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +ADEPt+o+UjuNwhFXgel9rP0l59BDTl/4j6uRrXAEl2oKGhfQybEU9bXY2QXSWEWM/5PADOup58U9MuhcONdSz8C8cRBaeq8Nh3lmvBno7IlByLV0sB/l9HeuEsRyB/P3tZB7PvtjXUUqXAlOC6aiuqSVSJc1BmL8vINA/Cc3vnxUFDb5Mbv+KGjuRGGTFkcDOXOzrcXYpScqu/qTRQnRrDEh5pR+IpnaS43vI3AdYFbQZJuMAbvEp7DYOtGkHpdXJBMTx3ZmAvxOO+4CptLkxDLuoHi8bkNAgYeIp/OtiilG4Rxihew8mKYmCCPwofZCzu5uhTxe6XQuyLGjczSyyeGGWi1HzW/4UwvvL2dF7HWcwgPdnkOhqeRZZ5xF8tx6oQJ2m7jf5YclXUgO6Ox89prUJ674KzoCXU2obkNlP8UcaGK/0kG0gKHYQMDaOv9hnTr5Iq4vgXcSojAcq/Zj3SlqLfEOB8ttukS2xogtE2ugy5Y1w+5QmTLo9AoQ+KFRHHLArNlwbJZr6kEH2H6ssug7yOrfNXGFqgXcLgkVXIAkmEKliSDi4P+hMMKP1V/eU7oxJZD2ssi80FY6xrX99Kt4Z7uXMU1ANTy2HwV8M6o5IAYDndUPWbQd1Tpq4wUQUknF8C3ewVxkmLmuLgwUP0QJP9MZhtrbIiLv2a4HF6p8hYiM3VsBwtfuGqXJrhM4WycYUaNcK+82qQhf6Fdqg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(110136005)(316002)(4326008)(66476007)(66946007)(66556008)(8676002)(54906003)(64756008)(83380400001)(55016003)(66446008)(38070700005)(7696005)(33656002)(2906002)(38100700002)(3480700007)(7116003)(76116006)(15650500001)(5660300002)(9686003)(4744005)(26005)(508600001)(8936002)(53546011)(6506007)(71200400001)(86362001)(186003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VFhnR0VzaG92OTNpRWx1dHcvUFJzb2RMeG44QXBIemJqNFY5SEVrQ2lXczB0?=
 =?utf-8?B?NytDelA1R0VzTkM5Y2V3cHdGeCtoMkg5a1JXUmZJTW9FME53Q29yWld3TzdG?=
 =?utf-8?B?SGlhT1lMbW9vYjVmeVZwdE82ZTFkRDhCcjZiUVQ0cVNnMDJyajBuUDJ5MWJK?=
 =?utf-8?B?bS9uOWIzczd1QjdKSFAvVCtBYThxc0dZNSs4VVF4L3A4N1dVTUV0bWZSc2Vn?=
 =?utf-8?B?VUJ0YlpSbjhDcVF6dGdQRGNkYW5nbnFuMFVDdkEwc1dzVnhiQ05GMXRiaVh4?=
 =?utf-8?B?SUtHdC9kMVRrT3Q0ZUR0cVpQYnB1aDA0RmNLTHMyREFWQzNVaTIxc2M5Vnl1?=
 =?utf-8?B?eVl6NDhuNU5HRmJUZkZNR3gyU09POCtPakJTbFBVUVlEUGxpNGJwRFpaUmdW?=
 =?utf-8?B?SmdnbmZzSzdFVjV5S21TSmtOWGVxTEJtWC9NYlBubmFhU2pMa2RuWmVhREhV?=
 =?utf-8?B?WEVlcHlxT3NiUXNzTUtLakcxSWkrRlFRdytZbHpPbm94aGtsMEg4U29oZ2VS?=
 =?utf-8?B?OFUwQVg1cFZscHpaWkxCWDNHTnVwN1dvaWtYZU1YR2ZKM2lUWXRkUE80OFVy?=
 =?utf-8?B?M3pOdHUwYUFZbmpCc05jS09URUxJek9nVFhVTGFsV01VajRqUERpdU0rVUkz?=
 =?utf-8?B?U0YyWm1mbVlsVVpPUjdKNWc1YkhZUmhBYTd2RFBabUE2aE9MZlVnQk1YenZB?=
 =?utf-8?B?MlNPOHcwQlMxOXA4eXllK1MzRkpOa2pNS2RwUFplTHEyREtDK0lyZVhrZmRZ?=
 =?utf-8?B?c2p1NnllWmtUS2ZBV05STjF5Z1dUcStSbXFwUHVZQVBZamZDcmZpRU10WHZY?=
 =?utf-8?B?N3BvY1ZOMGVBbEJQVnJ5WWRlVXBHRHg4SjZPeUhjOHprQWFjSG51L3IySDhE?=
 =?utf-8?B?d3BQaVptWXVBaGlFeE9WZ0o0dkFLc3VTZHdPaldSV3l6bExRMnY0Mmw0NmU4?=
 =?utf-8?B?VmN0RkpLb3BMZ1FhMUlkVWhlYUZpeCszeHJUTEd0Q0x4R1Z4b2VldWRnUjZs?=
 =?utf-8?B?SVJUTkJZbG9ldExmTkpuZnEwRjE1QWRrWnlhVjk1Ty9ER2NUa2xQaS8vNXBw?=
 =?utf-8?B?ekx1dTcwVm1KNWhFQjFTaHBtY1BSSW40Z2NHYm13ZlFEbzkydlgyZFp4L2tG?=
 =?utf-8?B?MFBjQWI4VFhkM1d6TEwwbmVDYmF0TWtJRnQ3d3VUckROWG5MNTNEMkJXSVNG?=
 =?utf-8?B?eE9TaUNuSzl1NjJtUTNySGJZSHpxRFM1aklZNjJBeVdCaU1yODZtOEQyWUI4?=
 =?utf-8?B?bnVNeXNNc3NlTFo1d3N2Ty9kZ3BPbTdkMm80eE1KVC9xdXQ4dms5VXk5dDFP?=
 =?utf-8?B?dnQvTTlMY3dXNnNKQWJGYzV5QXRTN2FMbW9EU1ZyU0dkVUJvOWVRYVIvVGJS?=
 =?utf-8?B?K3FXaVIvZzhQVjkwVG1xWGxFeTdQUllaVjQ1S0Q0eEt6eXhJd2xqMDlFUStz?=
 =?utf-8?B?ZWN6T3BaeDQ5V050eFBFYWQ5c2V3d3p0Q0dWYnh3MjA4TVJmbTdiRTd3MXNK?=
 =?utf-8?B?YUJRajJEenhoSjdIQm1zWUNXVzdJd0lXVzlYU2dTQzVDTGI3MDBFc013Q2k0?=
 =?utf-8?B?elV5aUM2NEFNS0NoUU9rN05CaGhHaFMyMFFrNHovbjBlRWFldTcyaFNkS1Jq?=
 =?utf-8?B?aHl4OHQwdjRWNDV2Wld1eUVORU8vTmFwOGdJWGxiaHh6WHBoUVNvRDNtUjNj?=
 =?utf-8?B?SWJuWU51L2d0R2NUOEpTeDNDYmlSRVgwRHFuaEVMUGZ6VzhuNk90T2RvZGdS?=
 =?utf-8?B?WGxMK3U0eElWOEl3QzlmanphS08vdmRnYlhaNFhPZjFsRkp1ZU0zWTlSK2x1?=
 =?utf-8?B?aEIyUnZmc1I1ZXM5bVBZV0FOUzhvL3h1MjhkaGhLaGU1d2JyWjBSZmMxNnRx?=
 =?utf-8?B?ekV2VnhJRkhtRjZJUnBERmVzWjdkaHFSQm5qQjI3Zkh0OXZvQ0xodm1mOUUz?=
 =?utf-8?B?Mk0vZ2YzVjdhTHlRTnlsdDJBVmNFbnNFN0FTN1ZxZW56T1pkbVk3TGNZZmlR?=
 =?utf-8?B?V3JOMC9uMzdmNllzS2xGNEVDTlc4Z2U1a2Q3Rk1CSk9xMHFvQ1pBZHllc09k?=
 =?utf-8?B?MWhKNnlhd09WYUxwZlBmUU0wRkI1UmZueWFvckV5TVlTMFhRMFYxVVZMNVhZ?=
 =?utf-8?B?UlF3N1A3cWt3ZnBnOVFhQ0lIZlBUWk1aaGNvRENUM3JpR3pzYmhxVzMweW1n?=
 =?utf-8?B?bGdMdXJkZHRldTRCZHp0c0d1Vk1iQ2VCaXZxUGhvSjdGaGcvbXVVVnJkR3V1?=
 =?utf-8?B?SEFwUFFydUYrRDZrNWJ5YTRsT2RoTXNtNlNZNk5PakhwQWFucXBZRmVzR1o1?=
 =?utf-8?B?RDhYbkRnbUFwanBIVzJNOUMxY2UzS2x5bC92Q0d0RVowWTVKemRkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549149ab-ac71-48af-e362-08da23a3c0f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 14:32:25.0040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IiwrLzJbO6F0gpTHVwGU7Uyy55Kt2hUGFDUvkhhAEHVlB2y2wDGk1SpewpNs/GEeb5u5UUb1lYfpFEWJN+2udw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0221

W1B1YmxpY10NCg0KSm9zaCwNCg0KVGhhbmtzIGZvciBhZGRpbmcgaXQuICBJIHJlY2FsbCB5b3Ug
d2VyZSBtZW50aW9uaW5nIHNvbWV0aGluZyBhYm91dA0KY29taW5nIHVwIHdpdGggYSBwcm9jZXNz
IHRoYXQgd2lsbCBhbGxvdyBtb3JlIGNvbW1pdHRlcnMgdG8gc2NhbGUgYmV0dGVyDQpmb3IgdGhl
IGZ1dHVyZS4gIElzIHRoYXQgc3RpbGwgb24gVE9ETz8NCg0KVGhhbmtzLA0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvc2ggQm95ZXIgPGp3Ym95ZXJAa2VybmVsLm9y
Zz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDIxLCAyMDIyIDA1OjQ0DQo+IFRvOiBBbGV4IERl
dWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCj4gQ2M6IExpbnV4IEZpcm13YXJlIDxsaW51
eC1maXJtd2FyZUBrZXJuZWwub3JnPjsgTGltb25jaWVsbG8sIE1hcmlvDQo+IDxNYXJpby5MaW1v
bmNpZWxsb0BhbWQuY29tPjsgR29uZywgUmljaGFyZCA8UmljaGFyZC5Hb25nQGFtZC5jb20+Ow0K
PiBLYXpsYXVza2FzLCBOaWNob2xhcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPg0KPiBT
dWJqZWN0OiBSZTogYW1kZ3B1IGZpcm13YXJlIHVwZGF0ZQ0KPiANCj4gQXBwbGllZCBhbmQgcHVz
aGVkIG91dC4NCj4gDQo+IGpvc2gNCj4gDQo+IE9uIFdlZCwgQXByIDIwLCAyMDIyIGF0IDI6Mzcg
UE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+
ID4gSGksDQo+ID4NCj4gPiBVcGRhdGVkIERNQ1VCIGZpcm13YXJlIGZvciB5ZWxsb3cgY2FycC4g
IFBsZWFzZSBhcHBseSENCj4gPg0KPiA+IFRoYW5rcywNCj4gPg0KPiA+IEFsZXgNCg==
