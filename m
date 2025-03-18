Return-Path: <SRS0=omt3=WF=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FA3C282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 07:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FD4DC4CEEE; Tue, 18 Mar 2025 07:06:10 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82FF8C4CEDD;
	Tue, 18 Mar 2025 07:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82FF8C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6dmThqLpqUpyC59sdC+0TYRWeNfg/yHitgGyhrvSnhSpyRS8oupQ5NFoVW0qT24DafWjiuytsH63dZ5p0YUQpC5pFo7vAAsYEb4PMD5ygLOBYMm0GBMxVavcpEZDspAlM4UWhWpFB6kFswp9hvCAXQDWSgXFr7DKYKWzAmEFrABuazvyx+D32nM7wMnakWtB0TnwzjaLoPLW4PEps5m14eej8tUrcYsYd4WZf0svA48XtWbULKAaVcYgxT83kVzrz7GGvIzo39+vJCYE+3OHuESVNt4kLojhyT/Bey7CKhRk7Y9YxEsTjsouUh1PMFm4d6tcD/7nvvCUz3hfXISBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwKUtjO47Qu1hm1KV/cPm2r5e+MlLoJ/5te/bPXHeWM=;
 b=iAjIRiF1FYdCcbZ8V1O/gq27cabFJuBFVi1cr48ErkHkADmV0DPKulNPR5Tly/KWm0YiGSRTckWXGMsv7PA8JGAyJTyIQOyz72U9arlrX4smryHspqyAHXMiMNAmmP/ueQJ5wM1yWc4zkuDfvDv3/Znu4Jbj/VgSQBCYfthXQC+MuVHcHkDogvOHWCDq9VWQeAiHiym+c+iypLx3PSGixSYTVnCNPfR+cPAdFHLfMEz0ptUgw0XAt84JvVIzltxoDQpTbOYY0GkUr1k6nYSEcjKc5hv8iaQhZ+OuXAQyiCK/FvLofjKq4G++tLLM2o8bQTW8+898/mLKkkbMNmSXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwKUtjO47Qu1hm1KV/cPm2r5e+MlLoJ/5te/bPXHeWM=;
 b=aXSEH/+Cv6ZwZJTcCijf/ochcP02aPAUUsyHyICjx8KvHdKUN9ldiFLD+RGRjCSGtUpiY2FkFbBbIiVfr+uBkavv9li7fVAORkc75iD7Yx+cMeKtjLgAdrUrnrepqLC0KR4TG/CfOLBzDqBfvnaSlIwaIfVN1MqEaFn6JQ3wGLJYDc0jmZWCYJQo55Rugy5BSwB633s2vc/hx9RrTy0hYl+2OyKT6bxmJrAe1uG6Vea5798qQzm446nHLmgTYwTjX5IvCeinIFNIUj/myZ819zkWv/eQsUS4G+0njcQEPnXh2ASZrh5jUqvW7qeQwTN5yJ2bjY94Zuel0WpZJQr6tg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 18 Mar
 2025 07:06:03 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 07:06:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "maxim.cournoyer@gmail.com" <maxim.cournoyer@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "superm1@gmail.com" <superm1@gmail.com>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: [PATCH 2/2] copy-firmware: fail gracefully if moreutils parallel
 is installed
Thread-Topic: [PATCH 2/2] copy-firmware: fail gracefully if moreutils parallel
 is installed
Thread-Index: AQHbl3E/LZPz6mXuKkmA9mfPHiaatbN4bPO8gAAMlQA=
Date: Tue, 18 Mar 2025 07:06:03 +0000
Message-ID: <42aa7e08f5f41ab53b2678de4d4e69c1ed2b53fb.camel@nvidia.com>
References: <20250317191606.64181-1-ttabi@nvidia.com>
	 <20250317191606.64181-2-ttabi@nvidia.com> <87r02uyi4o.fsf@gmail.com>
In-Reply-To: <87r02uyi4o.fsf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA1PR12MB5669:EE_
x-ms-office365-filtering-correlation-id: 1c8dda17-a634-4ba2-593a-08dd65eb5886
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dy9IV1oyTzV4cmt4S2JiRmxhajVjcVFsNWpHZmNHTS82RWVKR201WTM0dUhz?=
 =?utf-8?B?Uy82SVducnRPcFozTVdzTE5icTNISkNVZWI2WWFzS2pIanlkWmY5YmRycWx2?=
 =?utf-8?B?dEtSeGZaT1lCajhTRmxJRCtmUDhrVGFrNjlUdHd6N3RIbU5rblh3NWlFS3k2?=
 =?utf-8?B?QTUxcGlvVFJtUjBDeVIzYWVqS3doM0l6bGJpSWY4MUZrSXVUK29GM2ljaG1a?=
 =?utf-8?B?aSsvTkFodTNaSWQrdDVvOHlKSFdhcVNhWTFTV3hNNTZWd2p1R0c1eVkydnlv?=
 =?utf-8?B?Y05VSGFLOUlDenFHcHU0bVlqcExHZTZURVNGays2bGFSZHJxRWhZcXJSSTZK?=
 =?utf-8?B?TDM5emVmUi94dEZoNmJqTkg1cCtEMmNWSUJoUk9jRStROW5WK09SaC9PMk1P?=
 =?utf-8?B?VlJkUEVZU2ZOY1pWUHM3L09HREkxU0VkM1BPaXMrUXpldjNmdHdBV0h5bDBM?=
 =?utf-8?B?OE9mMTRURm9xQ29tT0VDRGI0anlqSnNlNGxIQjducEpDS2VtTGQ2WGNKYWhM?=
 =?utf-8?B?amVVamZzc0NzcE1GM3daWkNjNUNicmd3OFJObjRQd0ZsUlV0UElSZ0M3dW9I?=
 =?utf-8?B?SHI5ZGFHVzcydyt4UVJwN1JnWUNkTzdCSWVNMDR2RXJmcEtUY2orcnZhQTFI?=
 =?utf-8?B?NVV3SzJEUE5QYjlKOEpBS1RqOU1IS1hkeHIwMmpYYVViWU9UaHFLZ09ZZzh0?=
 =?utf-8?B?TzdXbFJCVDFMSHJZZTdEMHo4OHF6UzltWk5yVzRXUGR3WnR2dUFBaFg5YmRW?=
 =?utf-8?B?Mm9ZaWdCTVVPYk1QVWNwRExaZFVVRy80dVYrdGVrd1lPeDhGM2xWUXdvVTlX?=
 =?utf-8?B?NDZkRUdqdEc3N0tMc0IzQXVmdUQvOG1ZR0NaQ2hoTGFtam51cTBhdjNWd0x1?=
 =?utf-8?B?RWhkSUZNRURNZVROazYzOTh6L2luQ1ZCdjN4d0ZHbnlUK200eTNtTjNyRHZQ?=
 =?utf-8?B?aStnZXNqN1FvYmhaNHJjVS9MdXhaZG56dk5Fa0pZanJ5RDlpSm5UdUNoeE9Q?=
 =?utf-8?B?WW1iczhrdmNtNE1obWVINWNydGhlWUhTUG1Ieis5Z3JoZ0Y0bjdWbjVlZFJM?=
 =?utf-8?B?azg3azFwdmdnWEZMVlpkNmRGcE5LZ2x5NUhDSm1sRFAxN2s0a3pDcHRPdEkv?=
 =?utf-8?B?OENCaGY5WW53KzBEZ0dYTlFOVytXNmtpSElOajNPS1dQZm83Vmx0Y0hQazZP?=
 =?utf-8?B?YlRTb1BDOTJYMUw5UEQ3N21qWXoyQWp1VTZ0TmV1amVZTklUTEdWOU1YTlRl?=
 =?utf-8?B?UEhjdTJTend2b1pydmVCWS9aTmtIY0VvSy85V2FUUmdZVUhZUEFmMldwV2JU?=
 =?utf-8?B?NnhBaGRLYnQwUXZEYjZnVEptWWtaeDgxSnZibHZLZmppL0RFMWpQMldEVmJW?=
 =?utf-8?B?Um95K1lDVklKbnBmaGVPZFd4S2tjTEpFTWNXSUU3Y3htSlF6dGNSSGR6SEV5?=
 =?utf-8?B?UVhSQ0JsSkhNeTNTTlRuT0lMWm9nOUFONjkvLzAzUDhtc1NCb2hKczV0TVRn?=
 =?utf-8?B?VXN4WGhKTXI4aU9LbGVodmxNdUpvMGhpWWxhdDFVaGoxc0ZSZzlGSmNac0FF?=
 =?utf-8?B?NWJpZ01ydktpOE9yVGhMNE8xMDJMYjNqbzhoS085Zi82ckhudFJMTmNlQkRH?=
 =?utf-8?B?Ni8rbjRpSmxyOUdZcHdYQldoUFZDRE8zWjdmYU5BWVZFYkc2R3d2RFpLVzRI?=
 =?utf-8?B?SFB1S0wvMGYzWjFaeVF1bC81MDc3TDk1bkgvbExWWTdSakQ1TEtvZHlvMWJR?=
 =?utf-8?B?cXFwTDZ4QVBUYUhub2g5bWM4T2poQ3k5eGNZNW5mRi9BOGFER2I3dnVqbXlH?=
 =?utf-8?B?RW8vdkNDalhTMmVnNkNJRlN2MVV5YzRjQ3pvTE0wejdqVEdaa1RsdzZjS2V4?=
 =?utf-8?B?S1hJcStCa3BjcmgrNHg0Ym01WkJTL0d6VFYrYzAvcTlqSm9Id2VQdDhpS3Yv?=
 =?utf-8?Q?rawLZ2sMYFnfZRWiJBpTyMOdSjcujB4D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUFBZDhUZG00bm9TTkFyNitxSXY4YnJhUklnbFRWZjRYR093ZjNsMmJsU0th?=
 =?utf-8?B?bENRTnJGSThGN3dmekw5VXpBSlRsL3lGcVdTTTh4L0lCTENqK1JYeGd5bVdC?=
 =?utf-8?B?OVJvbitnWUhXOFNERTZmM01zcERKVnhxc2hGcS85bWRBU2pHNWVWcmxjSEFh?=
 =?utf-8?B?bVhxUE91NUQzODNpTVVoS0ZuMVJUU0FFMnFlSCtJbW1acXZLQ2hTRGs3K1Br?=
 =?utf-8?B?WEVSdFJCc05QbmVpN1F3NGV4Sksza0J4dHJqS3BubXU5c09hQVJhZ0IrVzdi?=
 =?utf-8?B?SzRFRitxQzJGVVVMekdyWS91UVpuMk1YVk9iVEZTb2d1TjV0Z2JDRWd6Q3Av?=
 =?utf-8?B?YWlIMVdFWUlPdjZ2WWVMQyt0SXpLd0p3QjBGSnVyV2RMdzB1TzZuYkFEcHRT?=
 =?utf-8?B?dlBtRytQN1BNSjR4aXpiVWFlL01IVGNDSGk2Z3FNMGdsYWJQS0QyaWp6R1hu?=
 =?utf-8?B?QWRlY3c2U3FmUmN2ZzIxUC91RU8yeFdmZlJoWWN4WmtvdnFpbVJGczNhdWNq?=
 =?utf-8?B?TG9UL1NzZ3dxVWlGRmZva0lzRHplVTA4aDJqdFozQ1BLUHJpOUxqeUlWVXhi?=
 =?utf-8?B?YzdJMVFTK2twaEF0TElwL1p0cUhCM3pRRG4ycTVjY2xYTUM3NktycTNrbUhz?=
 =?utf-8?B?ZWdodEg5TWs3Y0MzOGRidVRRbXJHWlNBenBZc01WUnpuMTMxbTNiY3pQSVJK?=
 =?utf-8?B?L0t1alZweWNxOHBSRk5IekhqUGRJaUVMcW1IdnY4QXM3dmJYc3phV09OMHJ4?=
 =?utf-8?B?V3VJL3Y1S2FDd3pWR3pPMlcxRGdvRDZtWDJTbkhrSXBtVk1ldHNpZXlKNjJT?=
 =?utf-8?B?dlVqWHRRYVhDSEl0SzBYUmZvUFRPZzNveDcvRHVMTU11VVlTSmthQ1BzZ0tj?=
 =?utf-8?B?VldNMVdIY3FDdWJVZ2E4Umk5Qm5xYUphSjdNN1pudW5OUHNFMlMyODd1RFJC?=
 =?utf-8?B?VVI4VXhtUzNSTWkyR1JiNzdTYmxSR1ZHZnp1d2ZMbWFzQzE5MUh5VTFLZHIx?=
 =?utf-8?B?Y3cxZ2VkT2pwakVaWUY4R3RsUk1jcXpPMVVBWGZ0THNFa0NyblFHaTdTbG00?=
 =?utf-8?B?TDJJREtLeWFsam14emxpSFFiNUh0bmFjRHBScFFKQ25XdmJNWkhrdVNlWlNv?=
 =?utf-8?B?WHRJc2NOMmM2TmNYOG5nbXRxK2lLRTFZR2tkMnB3dE9iWW9aS21COWRqQUl5?=
 =?utf-8?B?NHJ5eUszcEJEN2NvZFNWc3pQaGtKZkJFc1lIUU00SnpWZUlJdXlSc2d4dENK?=
 =?utf-8?B?bmtDMlNnYUl3QkJEZlZ0d0gzSUh2MXRDRXJFNmNKZE5ESE1RTVJoOWMvWUgv?=
 =?utf-8?B?VDZvd2xBTFN1STBmQWtBLzBjMzd0a3VLOU9WZ3JLdWFiMUlwTHp1ZEJkSkxk?=
 =?utf-8?B?a0ZRQnlEYXpCRWhUM0JWTkxFWkJhV0tENHc1Vkl2RHJJUkgyTlBQbUowemFy?=
 =?utf-8?B?MW9Hc2pIZmpPT2hXVFZsc3Z6K0ZoNXlxMGJHT3BLdCtYRFpaNG12WHhxMnpt?=
 =?utf-8?B?UXh2ZzdiNzZweDZldm9waGhoUncwVWM3bks1TUQxWVNMV0NGQytaTnVDZGFZ?=
 =?utf-8?B?VURIN09FbEhmMjNaNUE4S2Vxb3FlcUxEUGEyODliMHEwOUR3T0hZczFCc2Ix?=
 =?utf-8?B?Z3VxRHhQOEVDUmJUaHFwOWZuNm82cG4wNW42cEVGTm5hZGtxY3ZIbmQ1NjlO?=
 =?utf-8?B?cFp1czZVRjh1VDNMRXNVY0UvMzQ0Ri81NVJUd2FjLzFwU3FaR0JIUmJhOUtp?=
 =?utf-8?B?Y2l3T082U3JyMlFTRlNkeTlUcWd1TzFYaE50dWFIZXF4M1h0bDlmOXFjbjFw?=
 =?utf-8?B?TnhUTFFCY2lwZnlUQmFweTBUY3ZXNXlLWXdXQ3VBTEcyV3FSWGM3Y2I3M0F1?=
 =?utf-8?B?b0o4TVNZZUd2Q1R4QjlpTkVQbjFaQldTYXMrRFMvSTZLTFBQUEV4eXR5ZzJF?=
 =?utf-8?B?ZXFaZnpyREV1SFg3a1RlTE9oczA3MmU3TE8xL01YTHkrUDZNeWQzcHFNR3Z5?=
 =?utf-8?B?UzdLdnBnYmJ2czAwenhFazJrTXF4VEVCMFRzb2RqZkNmUExXWUJtNzdOQjA2?=
 =?utf-8?B?cXNXOG9wTmY3QmVISDdJOE9YZkFRS0Y2cE9udnZhVzN6d25xcXQ5N0wvZTBx?=
 =?utf-8?B?eDhqUGZxTElvNVdJc3hPNGQrYjEvUmQ1S2N1LzE0OWNxS0pqSGx2eEVxRnBW?=
 =?utf-8?Q?0l4o66HOnhAxSkjxs8P9NxpcM0a8RLvnV1vKeM7EreYN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9F45195F8A93445BCE11FC608675882@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8dda17-a634-4ba2-593a-08dd65eb5886
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 07:06:03.2896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+QMcFhLNSbZWLX/wZCwxWvlcA4sTLKpTS0ThbrSkba1HMqUxLiNB2mB8XCjoP3UfyzSvslPYP6NGDTVER0o1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669

T24gVHVlLCAyMDI1LTAzLTE4IGF0IDE1OjIwICswOTAwLCBNYXhpbSBDb3Vybm95ZXIgd3JvdGU6
DQo+ID4gSWYgaW4gdGhlIGZ1dHVyZSwgbW9yZXV0aWxzIHBhcmFsbGVsIGFkZHMgc3VwcG9ydCBm
b3IgLS12ZXJzaW9uLCB0aGlzDQo+ID4gc2NyaXB0IHNob3VsZCBzdGlsbCB3b3JrIGJlY2F1c2Ug
dGhhdCB2ZXJzaW9uIHNob3VsZCBuZXZlciByZXBvcnQNCj4gPiAiR05VIHBhcmFsbGVsIi4NCj4g
DQo+IERpZCB5b3UgdGVzdCB0aGF0IGl0IHdvcmtzIHdpdGggbW9yZXV0aWxzJyBwYXJhbGxlbD/C
oA0KDQpTZXZlcmFsIHRpbWVzLiAgSSBpbnN0YWxsZWQgYW5kIHVuaW5zdGFsbGVkIEdOVSBwYXJh
bGxlbCB0byBtYWtlIHN1cmUgaXQNCndvcmtlZC4NCg0KDQo+ICBXaGVuIEkgYXV0aG9yZWQNCj4g
dGhpcyBjaGFuZ2UgSSB3ZW50IHdpdGggR05VIHBhcmFsbGVsIGJlY2F1c2UgaXQgY291bGQgaW5n
ZXN0IGEgbGlzdCBvZg0KPiBjb21tYW5kcyBmcm9tIGEgZmlsZSwgYW5kIEkgY291bGRuJ3Qgc2Vl
IG1vcmV1dGlscycgcGFyYWxsZWwgc3VwcG9ydGluZw0KPiB0aGF0LsKgIE1heWJlIEkgaGFkIG1p
c3NlZCBzb21ldGhpbmc/DQoNCkkgdGhpbmsgeW91IG1pc3NlZCB0aGUgcG9pbnQgb2YgbXkgcGF0
Y2guICBtb3JldXRpbHMnIHBhcmFsbGVsIGRvZXMgbm90DQpzdXBwb3J0IC1hLCBidXQgaXQgYWxz
byBkb2VzIG5vdCBzdXBwb3J0IC0tdmVyc2lvbi4gIFlvdXIgY29kZSBkb2VzIGNvcnJlY3RseQ0K
cmV0dXJuIDEsIGJ1dCBpdCBhbHNvIGRpc3BsYXlzIGEgYm9ndXMgInVuc3VwcG9ydGVkIG9wdGlv
biIgZXJyb3IgbWVzc2FnZS4gDQpBbGwgbXkgY2hhbmdlIGRvZXMgaXMgY2xlYW4gdXAgdGhhdCBm
dW5jdGlvbiBzbyB0aGF0IGl0IGRvZXNuJ3QgdHJ5IHRvIGdyZXANCnRoZSBvdXRwdXQgb2YgLS12
ZXJzaW9uLg0KDQo=
