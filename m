Return-Path: <SRS0=omt3=WF=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1A1C282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 531F7C4CEE3; Tue, 18 Mar 2025 15:14:40 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F93EC4CEEA;
	Tue, 18 Mar 2025 15:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F93EC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aowz4nAdgxyodGmR/9RbEPFOx6/sjyRypKD/woOy+jjjM34PijsU6SXn1ymAvRvR6saXQvqz3dN1l9L8Dl5CeaXLx6qNkWnUkCL/d+QQLofiHEnOn/0HG05AmxohZYdcGXZUT7GxlesMmM8mshdr9OVfa55xSUKzhxZ8HAi5O0ZWahJbI90jIGcJjrn3kvzO0Hd9qfus7SjpYdKxkrrnEuxadIsrA8Ks5eWbKxMHEoGoH/vI6ru7Z46K7G/MNUKxfBFVjwubUj/XDbIGGsj4lvLF+FQ5zUq5ZErETBd5taK1jHIL/o6PWsvaNeZgnVR0i3IqtQy1Y3JkqP1qOtyFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k87x+svEDzSgWwGtOu83rc1N1pzmCujROcYpeDtoRc=;
 b=Nbm+pPYFZyrLGVgaPaH/kPjrR3SsgkulDNVC6ye8dWaAk5BfGt3GKqqCiyY5CJCMeSwbnbU6N0nU3yJocUjW5F3hlayzAhNgjo1cobpSEOw3Bd6Z6M0amf9kGaXf5CJ4w5sGTkF7HPZTOytUFJys5goWaEwizZn3J0qP/rYOE26zDFsZ7dCCGYbOiBpmRGX4zTSuLHw94uQO1/8MaoQ+eK+zIRNH78KcLj31/hRYpPNe44SizbO0sYOYtOAlffsuAfVQrDJnJiDdbVnz9+gcUsYVMkXZvzoDKnHVlXh32Pb+oV56YqJDSnEP0dbEQyvWgTGfYi32UcLa94iNkikjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k87x+svEDzSgWwGtOu83rc1N1pzmCujROcYpeDtoRc=;
 b=QZxUOy5SqlrWdgh4Ba0GqQw8HJP8aK1ZQKsYMuumKJnIfrrZ4Pn4wloY9coY15ZSRIHs2QfYFEJPbGXSuSimmn5p0I+wTmnbA7qHm0rSWUVCV7jvQzTvPr5a5vu99X937oPVamhC0a7Rq73Sa7MtCcqYIn/k1BonFVXR6w3Jj0eFzVA5RgTOkKzO+knNtFn2JMy3Pt8dUEO95WarutRw7qA4kyqG70kn630z94GUmNNBLb+D4tQzdqAN7qM8GIsTCaz+6gF5Ojj4/3v/uffj1N11CPpdLcHDcyEwkgq6CTZe4jMD3E3WsTBnQ1J+9wXRnUgpp/Kx9o7+Ewf53jUhIQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Tue, 18 Mar
 2025 15:14:32 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 15:14:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "maxim.cournoyer@gmail.com" <maxim.cournoyer@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "superm1@gmail.com" <superm1@gmail.com>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: [PATCH 2/2] copy-firmware: fail gracefully if moreutils parallel
 is installed
Thread-Topic: [PATCH 2/2] copy-firmware: fail gracefully if moreutils parallel
 is installed
Thread-Index: AQHbl3E/LZPz6mXuKkmA9mfPHiaatbN4cv6HgAAHSYCAAINRlIAABGuA
Date: Tue, 18 Mar 2025 15:14:32 +0000
Message-ID: <d4b8fab7c2ff08a1b243dca94a96a377d8d67f13.camel@nvidia.com>
References: <20250317191606.64181-1-ttabi@nvidia.com>
	 <20250317191606.64181-2-ttabi@nvidia.com> <87h63qyh4l.fsf@gmail.com>
	 <f5beca4503c46772ad65a8485757f0c700b0192b.camel@nvidia.com>
	 <87frjatmgj.fsf@gmail.com>
In-Reply-To: <87frjatmgj.fsf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN2PR12MB4438:EE_
x-ms-office365-filtering-correlation-id: 93a4c8dd-6b96-4e73-b6cd-08dd662f95e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NVFJbEhxYXgyNFc2akYwa0hlSklYZWYzaEpaN243TzlIcWxaYVE3WlNTZHA2?=
 =?utf-8?B?dUFpMHJSaTM0SDRWbHV3QStOTUhyNmN6TFRWSWhCanVOZEZ6SjJLRndhOWwx?=
 =?utf-8?B?SEMrdzNPaVV3M3RmTThpWG5IUTZ2VndESk5ENUhTbTU4N2NMaGI0WU5YR1lv?=
 =?utf-8?B?bzVUeGF4K0p3aHA3czRJb244Qm03YkxEaE1vaThUdDFqSW9yUnorYm92K3lu?=
 =?utf-8?B?azY3WG1tUlBCNWpvWlJZSlZtcFUwQmNibHp5NVErUGkxdEZBd1FCTUM1cVVy?=
 =?utf-8?B?anRMQWd1UVZxUThJY3FCSExhOFhldVVHRmF6YW1ZUVpnVUllRTFQYkY4RXdK?=
 =?utf-8?B?bkRoQllaWXRjQlpCbmUwZnByQ0tNTUZSL3VzdHJET0ZUWmRQMSsrdXMvRVpp?=
 =?utf-8?B?NFFzOHNxdkM2VWZxT0VQQkxEcWNETGJ1ZDBhWm5NYk1jM2dHSWgzMURCMUlJ?=
 =?utf-8?B?eGl1Ulo4V1I4QWQza2xYcncvK0xhNWFUdWs5M1VCZ1ZlclY3M1lCYlpyb3Mz?=
 =?utf-8?B?MTl6bDAyejA0SlJZSDlNRzN3a3VOSjJ6ajRzVWV6MHR6Q1RxOHYyUVVya2Fo?=
 =?utf-8?B?VU8xQ2dCcWluN3ltMWtpNSsxcU1lc0RBbHovbDNOV2daQXE3amhSYTRlazZ5?=
 =?utf-8?B?RVZya2JYcDhOSk9RMHl5bmhURHFHeDRTWGE3eE5nRXpiT1cyTVNhSThCbHlq?=
 =?utf-8?B?d1NRNmYvNzFjT3M3SGYvcEw2cE1iVjJLSmdJalIwNFRKOGVUR0loZ081b2cw?=
 =?utf-8?B?enVuWVdhZnZGMCtQZHpmVTM1OXYvQVA3djRRSVlQb3U2cUNrQ2xiMXl2aDgz?=
 =?utf-8?B?SFdxVFFwMW1mVnJjUHFSYWdHZno2ZGU2a2pueVdEdUJHNFR4ZWtBc1Q2S3ZK?=
 =?utf-8?B?Qk5RQ1RCNkF3VVZXVVVKaTIyUTRoN2d1RmJqeHR6WGZnT0FYMWFjK2VPd2NP?=
 =?utf-8?B?ODcrZ3hhOTIwSlFNaGp4YWV6WWh2OXFkWEdlQmxONGZ2dC95bGp4dTNuNmlI?=
 =?utf-8?B?TXNHd2dOTXhPRGgrRFFBZ0piTlBKZi9aM3ZSUUw5N2JWdC9jRFZTZzFFeDFw?=
 =?utf-8?B?YjJhMWRaMGZySmtjUWdyRm1ZVjZwMzdKOW0rcHdlOUl5WGJYM0x6dTREQzlB?=
 =?utf-8?B?WDBGWmlRQ3YyT0ZqaWhoRlA5d1BJeEZYK3k2WDFSVmFmMC83QnREUld0Nzd3?=
 =?utf-8?B?STgra1dES1RpVExBVy82U0hySTVhZTVoZTJGOFBQUDY0WVg0ZTlKSFhXenNF?=
 =?utf-8?B?YUkzRmtxVloyTTh1R3YxelU4QldJY0FjSHFEcFhmQTgxOUZmVTMyUjBiZ20r?=
 =?utf-8?B?aUFFQ3daZjRoL1g5eXFPdTk5MzNqUExYU0huNmI5bFh6ZE1xRFhUdnRNTnVN?=
 =?utf-8?B?ejZUbTlvVmhna3k1MmdBT05NZG1ucVlQc2Z5d09QQ3JNaWdwdnNUNU5xM2R0?=
 =?utf-8?B?SjZKTnpXMVdBOWFNN1FOa1VKcmMybzI1cENGM0ZaeTY4V21XcTFXQnFOQVJR?=
 =?utf-8?B?SEwwTlJnazNUalZjZXlGMmxjOUJla3hGOEU2RjQ3ZlNsVE10NHFPQldqbU1Q?=
 =?utf-8?B?ZlRKV0VvOWNWMEgzYzlobWlJTWE2VWgxWTNvUll5R3RQNUF5YkdLZVo4a3Z4?=
 =?utf-8?B?L1BsdUVYUGs5dVpNZlk3MEFocDRhUXVrb1VoOWExSm9MVzljaXlQVERYY0g0?=
 =?utf-8?B?UFdXVDNKb2N1dXp1R05RRDcydkNjZjFhUWdha25IbjF5WEJ3SzRkMi9kNmR6?=
 =?utf-8?B?V2N6b0tIQWVqUFg0QTVYbSt6eVlDQ25Oc3lSSHBmRE1HdzhWbVRudWg3Q0Zu?=
 =?utf-8?B?T3J5Yzd5WVJuenpXTkFRQlAvd2pEdFgxMEhEVHNVajI5SEpzTDB6VzF4YXVk?=
 =?utf-8?B?cG0vVGowb2dEUjE5WkdIdkNpQ0tKc2lIcEZjTWl1aHRFNEFKN3NrV01lWHRH?=
 =?utf-8?Q?2L/7nJRkjlTsbQoJxMlehzJC3RvgobhS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkNmODRyaEdpZGZIZ05tNjZ3K3ZjTW81cDlrOTk0WkNtZmg3NSttZTJGa3FE?=
 =?utf-8?B?djM1QUM1cEg1eittZ21DMzhhMlIva3dhV2hqQ0hrUDlSVnlLMEZrd2I1R1VB?=
 =?utf-8?B?Q2psRzA5dFg5QlF5WkdEcmhTcjZycjFVc2kweFdlaVJ1eWw2TTBDNjExd1dl?=
 =?utf-8?B?WmtZZmVGUkFjZGg3SDQyKzZKcWRiTGpJSnJGUFVXc1YxRnoxOHE1YnFyeTBl?=
 =?utf-8?B?WGZISzd1RjlONlVZSGRQQ3NVOGszZUF1LzB1elE2RVJMZFBFajk2amt3ZDNC?=
 =?utf-8?B?R3crNElrck1zU2o1TzE1MzdEZ0xvMDJQamlPTDZqaUxvWnFseEp3TWNKa1lY?=
 =?utf-8?B?Vm9CK0FxVzFNd1RmMUlySkk2RmNjNHM5dWx4MXlvUmJtaVdjQ2R3VERncUVj?=
 =?utf-8?B?UGxyVklQTTZHdzJxNzFDM0NIbHZNaUlVRlJWeGFBUVRPNHJILzFNUHZtYkNj?=
 =?utf-8?B?TkJHNGlxVFpxZHBOemVaOFpQUGZPS0pvd2k4cmRsckU4QU13aytPZFRNdVB3?=
 =?utf-8?B?UEE0T1V0TnVhWGRjajhmNkhUaVBGMHpVL1BiblBlazJWZnNtS216QnJKcWRW?=
 =?utf-8?B?UktXb2t2TlNnZHg2Nmh2UTBaN2czNExCWGUzNm9lM2hwT0loV0lBSHdJbjhY?=
 =?utf-8?B?VlVZUytUd1JkeGtJOXBPSFpiSWo5a2xJTmhvOHgzQWIzalBxU2R4YVI0NzRx?=
 =?utf-8?B?Uk9ENTBlWnZvMVg5Qml3MTZpc3lWem1wVEduTU9wM2VJWCtPRWg3VkQ2Y084?=
 =?utf-8?B?N2lLM3BEbm8vQUZSeTUySTN4U1ZZeUs0cmhsVkd6Y1grdCt5OTFyVXZwaEZ6?=
 =?utf-8?B?ZVZWUWFQcERBRDRBU0xhaEd3ajdtZWVjWERKOHZUamRjNVV5STh6cVR6TDMx?=
 =?utf-8?B?YnNONXgvcWpSTmsydnN0TENGcnAwMWlaeExNZkYvM3dKWTVEY3lwZjB4Slhu?=
 =?utf-8?B?L3h2S1ZVOHVjeXRSZ0Y0eWdGZHVyMU9lVlBRTFFwdnRvNXI1UWVrME1VbXQr?=
 =?utf-8?B?Qkc5eEVKQmcwVTEvekFMeXFrWWoxM3FFSVJobXl6RU5EcDQ1S3o3NnVwQmRz?=
 =?utf-8?B?Y2RYZlpscm9XbVFJYUdaNnZtVVBrQUV0TXdXNjFkSE9EWTNtQytRcWN6aU4v?=
 =?utf-8?B?UWRxak5xaU1Ha0wvYURzMDlOcGZTN3RyMTBsSHp5WHZqQ1RMSHo5a0J1ZExX?=
 =?utf-8?B?TkNjNHZqZUlIdzVZWmxrQjJWZ1NrajQyeW5xQXpweTl2MlFwZGhzUm9wcWZs?=
 =?utf-8?B?dThnTEc5WU8wS1ZQbzcraUZCVi9nTldUWUhZNTkwWENtNzFyQmIvc1IrVjRw?=
 =?utf-8?B?aGxUU2I5MnN0dWFXUWN5OThoODYrMUd5b0J2U1lZRGlJanVUQk9QUTE5dk1N?=
 =?utf-8?B?enJzdU1ITVFQRkJTQXNDOGhhOHBad0tiK1pJK01HZUtIK3hXb1pSa0ZvSjUz?=
 =?utf-8?B?NTNSQzcwVVhhTGhGS0tTL1RNL0hMUE1aNENBSFhYTWN0Z3ZRWHdGbkNWTW5H?=
 =?utf-8?B?ZGV6c2J3aFZpdDBRUW95RjRDMW9DQk11K3dLSFFRamQvNFZ3Q1gyMG40Rm50?=
 =?utf-8?B?VXFmR25NMGt5M2hkMHpSSWR6U1BaWU5jSTh3RENtM29oRWJBMHEyK0xHVmI3?=
 =?utf-8?B?S29YRUxxb2RudVNLSVQ1V2FaUDRhbzhjUytmd2U2MmVCcjZNV2dBcGlQaWcz?=
 =?utf-8?B?aVNGb3RPV3R4YlhIUXU1QnVMbFFGS2MvcUVTN2ZSRFJuUnpTWnd6c21udk5D?=
 =?utf-8?B?QkFSM3NRQzdiRE03bzhCL2twUTRhTXpxUU1aTmtSOTc5NGoyWWZMMCtNM1Ni?=
 =?utf-8?B?d0ErdDVjay9wODV4VmNaM3c5OWcrTnRVaWR4Wm9iSWgzMDFBNThZYmZsai9P?=
 =?utf-8?B?aHZTczVVRDdTUk9Pb25FRHM0TkdKL1IvenM5UTdsb1NYNElhZFlJRGljeW1s?=
 =?utf-8?B?V3ZuYmZBc3d3dmlnT0wxZGVrRHBHZ0N4L3RBYkVveXRxZHBDdUpHcGdKL3Vn?=
 =?utf-8?B?SzZ2RVVyd2NKcVF1Q2pDT3pmSUxUem5RN1c2bHNZNE9hbG1SWUtHNkxQOG4w?=
 =?utf-8?B?eDZwR3ZPM0ZPN3ExcWhVbXYzU1YzT2RPcTIvRloyVjBZY29qUDROVy9XVFVm?=
 =?utf-8?B?Q3JRdzRPOThVeXczdHl1V1hkcDZ5L0ZUcE4yZG9RZU1WN20yU3ZObUNMYmNt?=
 =?utf-8?Q?A7zX3atjSKtcvPIyGeeTdU7CukFXT95bWkBF0UZnhNCK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9900BD4AD3C1C44C8F4F9F71115659FF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a4c8dd-6b96-4e73-b6cd-08dd662f95e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 15:14:32.0444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eeWzLlE9cg7huRQ+JYss5FQeDxe9ZYnIavrBSVdKqygja6+7ns2hIvPue4zlrxQqsUahmqfLl8NPEgYp8qERkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438

T24gVHVlLCAyMDI1LTAzLTE4IGF0IDIzOjU4ICswOTAwLCBNYXhpbSBDb3Vybm95ZXIgd3JvdGU6
DQo+IEluc3RlYWQgb2YgY2hlY2tpbmcgJD8sIGl0J3MgYmV0dGVyIHN0eWxlIHRvIGNoZWNrIHRo
ZSBjb21tYW5kIGRpcmVjdGx5DQo+IGxpa2U6DQo+IA0KPiAtLTg8LS0tLS0tLS0tLS0tLS0tY3V0
IGhlcmUtLS0tLS0tLS0tLS0tLS1zdGFydC0tLS0tLS0tLS0tLS0+OC0tLQ0KPiBAQCAtMjIsOCAr
MjIsMTEgQEAgd2FybigpIHsNCj4gwqANCj4gwqBoYXNfZ251X3BhcmFsbGVsKCkgew0KPiDCoMKg
wqDCoCBpZiBjb21tYW5kIC12IHBhcmFsbGVsID4gL2Rldi9udWxsOyB0aGVuDQo+IC3CoMKgwqDC
oMKgwqDCoCBpZiBwYXJhbGxlbCAtLXZlcnNpb24gfCBncmVwIC1GcWkgJ2dudSBwYXJhbGxlbCc7
IHRoZW4NCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwDQo+ICvCoMKgwqDCoMKgwqDC
oCAjIE1vcmV1dGlscydzIHBhcmFsbGVsIGRvZXNuJ3Qgc3VwcG9ydCAnLS12ZXJzaW9uJy4NCj4g
K8KgwqDCoMKgwqDCoMKgIGlmICEgcGFyYWxsZWwgLS12ZXJzaW9uID4vZGV2L251bGwgMj4mMTsg
dGhlbg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMQ0KPiArwqDCoMKgwqDCoMKg
wqAgZWxpZiBwYXJhbGxlbCAtLXZlcnNpb24gfCBncmVwIC1GcWkgJ2dudSBwYXJhbGxlbCc7IHRo
ZW4NCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDANCg0KU29ycnksIEkgZ3Vlc3Mg
eW91IG1pc3NlZCB0aGUgTVIgSSBzdWJtaXR0ZWQgdGhhdCBhbHJlYWR5IGhhcyB0aGlzIGZpeDoN
Cg0KaHR0cHM6Ly9naXRsYWIuY29tL2tlcm5lbC1maXJtd2FyZS9saW51eC1maXJtd2FyZS8tL21l
cmdlX3JlcXVlc3RzLzQ4Nw0K
