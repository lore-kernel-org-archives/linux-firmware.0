Return-Path: <SRS0=8ycF=WE=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7865C282EC
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Mar 2025 21:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8942CC4CEE3; Mon, 17 Mar 2025 21:14:45 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35E61C4CEEE;
	Mon, 17 Mar 2025 21:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35E61C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ5IqUkSF/oLa34mEIM+fpLfsEVpRx4zCcBU93OP6KSUECfcAmYWZGH7EeMLWPjLVzfREkUJAZRHMUE3Q9g7L1ZjNOQUqwTWWwK63aNP0Qc9hMo2m1ePsv34eV2EYdQcf7FAlM0BmHZD9iOu126KEN44rbkGl2wvK3PRlx22oTddmvdeFEZFyrZgHqzjomjpdALgSFHx21c7neUp3cY2TTW7vk+ctLJQPj5eBx0QedeuQroY4AAzqM11g+7VmYTywNKnt7i5MVTmrXzX4EmQRLEPCL4ll5UHOsI18F5D0JkEfVULwhLrHD1DfVa2hEZkYzph62yC4B6l3HDp0OizuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXaNwAIR68cNcCdcThyjuEZdtRq3oln2a/X095LcbC4=;
 b=G/R+vTyxUXG8QNlfoZT4lSKGWB1JwecuLApoa7oRWM0VLA8MJsSOJghdwYsBVU3Z9xZeDxenisN6xoS6lcgXvWZnf9Wr8fVy7fhgXs+GGQZtPtm3M94/Ph/nE82TkobN7PH8fodHXQHQTVL0oeEwpqrICEMUecs68m5Hr+D+7bD7gXFMWzgcKG7QxHgVdZrxPIgdQWr+v6yt54YCICahraCkG33r5eNK1PUWyoUzKtdsIxIryQTg2cgLL3C6Cugos9GRUyYLXXxcwiRmajQZ4WwpFFW5SxinYHuywmZefCMPFbpJE6EuLBvyrUaj10e0cjoD18e9yI2YCu/1sSUcJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXaNwAIR68cNcCdcThyjuEZdtRq3oln2a/X095LcbC4=;
 b=kKSqkdKR44Z699ojo1y2L5aQMj0/1cAUMVw8jiAnblD7cKochPOxoWUuUfJS58Z3L6Lqzr2mUzS8L/JIx7OkIUjO7xk9iKD2+o9Qq7BSdrFWp7krjkmhS992dvjAaSqOyb/7A8KNUfsTCsmdt/tyhG7mLbqCg+Bwv0KlfFb8kU+O9UZkX/vMFeGwMIls+GKVj2oCY1d3f67WIwiSk3BXn6OES2ixo09K/CS2DFql58/iOywHYALoufc+jq92CFoQrBfbH2+sOZdybD7qDKp8B0UxT+MS2pUpoAUMbcYddk9ZQ07nlQz/MNu0GpDQOAvyToYIVGnudgezwbbaC3x6+Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB6977.namprd12.prod.outlook.com (2603:10b6:510:1b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 21:14:38 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 21:14:38 +0000
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"maxim.cournoyer@gmail.com" <maxim.cournoyer@gmail.com>, "superm1@kernel.org"
	<superm1@kernel.org>, "jwboyer@kernel.org" <jwboyer@kernel.org>
Subject: Re: [PATCH 1/2] copy-firmware: make script smarter about parameters
Thread-Topic: [PATCH 1/2] copy-firmware: make script smarter about parameters
Thread-Index: AQHbl3EZ1LVTLNn43U+F/0d3Bkk3AbN3xwsAgAANP4A=
Date: Mon, 17 Mar 2025 21:14:38 +0000
Message-ID: <379244a968c4bb9dd735f9da34c8f22d569edeb2.camel@nvidia.com>
References: <20250317191606.64181-1-ttabi@nvidia.com>
	 <3c09c8a1-21c3-49f6-9e41-e409fd38883a@kernel.org>
In-Reply-To: <3c09c8a1-21c3-49f6-9e41-e409fd38883a@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB6977:EE_
x-ms-office365-filtering-correlation-id: f28018f8-0195-42c7-c960-08dd6598b9ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cG1jd25EL0dQK2s3V1BhWll4VlE2OHYybEl1VmJEdGZsSlZpYUUyZGhSMmpG?=
 =?utf-8?B?bmNnR0NtYnV6T1N2dG5TR0MxMGVkVmVJY0tIS2VNbUgrMGhDZ0VXdXEvclJG?=
 =?utf-8?B?aVZFSmN4dkp1N0tVMXgxVTZjUUUzOEVRY0o0TVI1bnpXT0hGejBjZjFBbm80?=
 =?utf-8?B?THVESTVLK3N2bUVYN29BdURiNVY3T3oyNmM2TXdnMkpkaGZKajA1NVhHenZ2?=
 =?utf-8?B?R0NIYzIxUUJQbGc1ajVoNkdOWVd2MjVBZGhDU3BsS0R1NVk0c2RjMGNlUm9Z?=
 =?utf-8?B?WkR6SlpzMllrRUJzL3puMGtFTDd5ekkvZE9iN2I4Mi8wMnZpRjJ2NU1VdExh?=
 =?utf-8?B?THptMHRyS3NPT0ovTDVMN053UmRLTzh1dGZ1MStlWlRQOU1YaXFMdmNYZG12?=
 =?utf-8?B?eVRPdERMMTkxSnZUaFZBbnUrRS9odWhkY25EZ0QrL0YrdUd3T1RobThGUWVH?=
 =?utf-8?B?eEhqNytBUUEyOXNPNFBmK3FVQloyQXJKby9uRkx2MkFJZlJOUGJDc3JtekEr?=
 =?utf-8?B?bDY5UDBScmN6ZkU3VmNoaENZSG55aHQ5UXhCcGJscW8zL29KR0VlOVF2VG9z?=
 =?utf-8?B?OTFFWHNTWitBai9xSXJIQklTZm1PVDV5QkxXeGtNK0NKN0s2RFY2cmljNW5I?=
 =?utf-8?B?Z3BQVWxoQmw4ZmE5SUFSZGFJSmRRNUFnZzJhdjhFQ0lPWHdsaUNLTzljRXBF?=
 =?utf-8?B?Zk5kSCtGN1hldlBIS3l1Y0E2OXk4azduNEhqU2t0VXJOc3ROZ2ExTWVmT2tK?=
 =?utf-8?B?eTVGVWoyVlU3L0RlMnBaRFowcUhLWk9KT2lHdm0wV0hiUkZPbVlwYmZBOE5q?=
 =?utf-8?B?cmF5TUZlZW1YanpGOGxkMjVUeHVRbXZVSjZVanFMcm5GaDVWanB6VTYwOVAy?=
 =?utf-8?B?akpDS3VVWXQxT2tXb2FmSlM4Y041QU5xUi80aDJ3TzJ0YmJIMjNOT0VaVWlx?=
 =?utf-8?B?ekVTdXdzYmJCOVIyRmxxSFhvbVc4bGVNTnZhTnlaTzFvSGUxNnF6RjlDWnVE?=
 =?utf-8?B?enNIWFZ2MlZRQ2xKbGR2YldXMnM4c1hmc1pNeFoyZUZobTZkdFBkdU5mVzcr?=
 =?utf-8?B?ZHdZZnEydTVieHR6V2xESmUyc0I5SXJkTm9sYWtGWVErYzZZYnpOU0Vjak9o?=
 =?utf-8?B?eVJwQjFOQk42S0J5UlN2L0pVNTVnUTlMaW9yODN5Q2hZQnFWWE51dnZCbFBB?=
 =?utf-8?B?dFhuandtZXRRYVNPYisrQzFHbnhEY1Z2WTk2K2t0ZmpjcnppY2drK2FGbEx5?=
 =?utf-8?B?RlVaMmhGMFp3NnUzWjJmVWdxK25Tcys2MHo5V1hUdTZKZ2JEejRTbTJ1MlA3?=
 =?utf-8?B?YXRwMndCS29aUzV3NEtHdEoySzBZRmtsN09vak94dTBRc2pvUlR5UTRMazBX?=
 =?utf-8?B?clIwVHVydkwvMGUvaFZJUmZQMThUNU1MRTRCL1RzK1BBOGg3R2dpUy9WN1lh?=
 =?utf-8?B?TVVwN29Ta0YvSTlSRGdBNjZGTUtWNXJZOUg3bFNEaUFNdGhXY3kycG10YlZT?=
 =?utf-8?B?aTkvVStGNjNrMTZoWlRhZ2dMdmg2S3ZVcHNCcEFuMlc3dlBrTHZhNkZkQjYz?=
 =?utf-8?B?RG9senBPY1RnRWJjT3FlVE13YlVBb2RaRjJsckc3d21DcWZ6TFB0cHpPZUpI?=
 =?utf-8?B?bHQyMnVjOGovUVVpeU1lS042SWsxTE9sTktYRHRuRHM3REJ1cXZVWDZNUTFz?=
 =?utf-8?B?aVQ3SldlQmpvb3FMRHRXMlV4c3JmWDhJWVNlOVJ6OWZ2SXZDVEcvN2p2bVFj?=
 =?utf-8?B?M3BMZ3dFbGdhbkhPZ0gwRzEzQk9XeWNMZUFVWFFjemJMLzhUaE1NMzU0NlVH?=
 =?utf-8?B?QUJwWVJGNWNJNkpTSVJQMzkrdG92NHg3YnlUMktncXVIODBpUkxjSEdFd21S?=
 =?utf-8?B?bmJ2ZjhnSHMydnB1eHVqOGZqM2ZzY1NwczVwZ0JJeTNnVG9IMnNrWU1JUmFv?=
 =?utf-8?Q?F01w5RUC2EFUv3aV2/S+pQl99rXU+fJV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0crSEx0ZEdWc1U4MEJVUHhIbWxBZTA1TEk3NzkxK1dCdHRBdW5qSUNVb0xo?=
 =?utf-8?B?d0FJblQ4aW9kL0Nlait4eVhwQmxlWFo4WWlPQ05ROTUyeUJ3MjFLUGJ1cUhT?=
 =?utf-8?B?Z3UxcEJaNEQwQkd0UzNQWXpPOCtCMFdWOSt1NFNvcmUvUy9WUmh5ckhxSU9m?=
 =?utf-8?B?dlg5WFZCeG5EemJFeExoclBzWkQzbEVwUno5Sng0bkZON1JzTmtoM2lLaDl4?=
 =?utf-8?B?YUZERUU1ZWh3WG04b0Z2ZytMYjR5Z3prdDN6SllFKzIwamw3QkllSytmWUdt?=
 =?utf-8?B?MGFPczcvdXZJdlF5V0dpdXU4S2pYemVJNW9NNjdodW52Lzl6RisydUwrRzdK?=
 =?utf-8?B?SjFVNzJPa1VUYThHOXJGUG5RNW9YQi9BUzBtTlpRTmtCaVFzUDdjVXRPQkZx?=
 =?utf-8?B?K0JWallPL21CVjN1Nzg5eVNUck9yN1NRR0FZQ2QySmxOY2RVUFN1NHR4eEI5?=
 =?utf-8?B?WlgzV2syQjQ4WFJHd25vRGt3d1M4Z3liUVdJV2RGVXgrekRIaS96YzUzanBz?=
 =?utf-8?B?WmpqQ05BKzRrYWhqdHdSWTdXeERwWlBiczZlWkg4UnowTHFLcjBrRUU2QXB3?=
 =?utf-8?B?K3R0bUlucThnUFZUSVlFcTVGL0luS0xyNXZ1Z3dFTk1BVE1RbmxQTUw3Q3V0?=
 =?utf-8?B?N3lmSUdyVW9mNENYZkxQOU4wMi90VHVKV1lvaVNCZGk1dmVGSGpsSHhNcDNv?=
 =?utf-8?B?cDhqbjgvRE1JSGkwNmF0Q1B0bnRqbk1GWUgzVk9PYzAzRTdvSmwrcFFTYm8w?=
 =?utf-8?B?VHlnWTZzMFJuRFJZNnZNT0lyb2g2UTIwS0FISFAySkVybk82UmpkdCs0bzEx?=
 =?utf-8?B?Rkc1VWUvMG5GUXRtVkNVU1VCb1Y3ck1tRVB5N056RzJkbitmZTFpRUFML3F2?=
 =?utf-8?B?NHQ1TlpjUnUxRHNpUUNmbFJHRnhTUG9tWW5IbGFpTnhQTXZkQ2NKWnRnelJZ?=
 =?utf-8?B?bFJpbGFOV2VUQXA0OUxsc051TEIvNkR5T2lLbFkya3dlaVU4VFp3T3IzdDFE?=
 =?utf-8?B?WnVWZngybEU1WlRJSHY0QkpTVFNveWFKMU1DTzVYWmZ2YWIzOFptVWlpWWUw?=
 =?utf-8?B?KzdNVnN6a0Y2ZERGaEZLaTZQQjVicHp4K2gvQ3RHSWJjamdKSUg1MlVMT0o5?=
 =?utf-8?B?ZmJ6bDlVK0p5cEVydkQwMllIbWcyVUY2Mkg1MzBUdTY1R0FJNDF4dURadFZE?=
 =?utf-8?B?emROTTJqWnpWQVdRbFVQZmhVVlEwUGFJOUliSlB4dDc5QnRMMnFMbUp2WG45?=
 =?utf-8?B?dW1sQS9pSWVzcVhXSlNhUmovS3hldTJLd3JDdzdEY3FvbFllYXY2TGNPbVNN?=
 =?utf-8?B?bTNKdHFVRERpV0JQM0xYR3pmU0tNNHlQTUVNbmtxZVZIaHo5Uk9USytYRWRU?=
 =?utf-8?B?eXpzNCtHVFVGdTJSZUZWV2tiN3MvclIzWDdRTkcyQnRpcXRQckwvTlNqTENi?=
 =?utf-8?B?aksvVUNsWHArT09jUnJSVzF2KzZhQUxKSWJqNnlKYnk2OVEyM08zZTIrWm9k?=
 =?utf-8?B?c0E4T2FJc3BZN0lnQ2NXYkZJNDZKTFhZVDFtQjNhT0pSWFMyemdJNXJxRURO?=
 =?utf-8?B?TUY0Nk4xOWdubFRHVGd6Z3l3NUI1QTVvTGhieGdyTFNDcnNYT2FZdlVORlg2?=
 =?utf-8?B?SXBYRzNvc1pWUjlYQU1wdkR0NDBhWEl2eVlQSVpmYW81ZzMzYXJ6MEYwMFd0?=
 =?utf-8?B?Sm0zSE8rT0JHZWk4NmdOWDZiS2lTRHRWK3N2R2NSMWs4RFZybFRQUlBIN2JG?=
 =?utf-8?B?cW5TTTF4bjBjY0NiOWpNQnpLM28wci9iTkhDTVUxQkxOeEllVk9XQjczbWRW?=
 =?utf-8?B?NWlHUVVLd3BoSisvM2lENm9XaVFXcDBQQ1M5QjFJZCtwcUVXRkJ3NDRMN0ZH?=
 =?utf-8?B?anZ4Q3J6c3hwZkZZY3dNRHBSUU5BRy80a3U3dE9OZFQrcmUvMXc0RVdKR1NW?=
 =?utf-8?B?TE16K3dTbnZNVFZQT0xnZFI5UUVuWWxjWXdVT3dGOXQxVzVIc1dqR0pqSVYw?=
 =?utf-8?B?RlFWSkVtQ2xGTVhNa0daU3RBVndnQXJKZnRiSVNZWVowYktwNC9uUitxUVFw?=
 =?utf-8?B?ell1WU1RUGliS3Nib05FZC9hOEZzOXhJc1NuN2dqYW1DZ3FHcUk1NG5OQXFF?=
 =?utf-8?Q?BQhjIUa6JX+xnMpx6qfWxKibG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DAD687406BCC34493D6B3ED2274FB5C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28018f8-0195-42c7-c960-08dd6598b9ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 21:14:38.0807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AC7orTmKqabzeeys98VGhFbMbOuLBOfCnxbi/Ku2jy0wVvkKONLqp83v7+fqlRmjnFMo6OgYIGJ0J1qJLZulWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6977

T24gTW9uLCAyMDI1LTAzLTE3IGF0IDE1OjI3IC0wNTAwLCBNYXJpbyBMaW1vbmNpZWxsbyB3cm90
ZToNCj4gT24gMy8xNy8yMDI1IDE0OjE2LCBUaW11ciBUYWJpIHdyb3RlOg0KPiA+IFNldmVyYWwg
aW1wcm92ZW1lbnRzIHRvIGNvcHktZmlybXdhcmUuc2ggdGhhdCBtYWtlIGl0IG1vcmUgZnJpZW5k
bHkNCj4gPiB3aGVuIHBhc3NlZCB1bmtub3duIG9yIG5vdCBleGFjdGx5IGNvcnJlY3QgY29tbWFu
ZC1saW5lIHBhcmFtZXRlcnMuDQo+ID4gDQo+ID4gMSkgQWRkIGEgdXNhZ2UoKSBmdW5jdGlvbiB0
byBzaG93IHRoZSBjb21tYW5kLWxpbmUgb3B0aW9ucy4NCj4gPiAyKSBQcmludCB0aGF0IHVzYWdl
IG9uIGFsbCBlcnJvcnMuDQo+ID4gMykgRG9uJ3QgZmFpbCB3aXRoIGEgd2VpcmQgZXJyb3IgaWYg
dGhlcmUncyBhIHNwYWNlIGJldHdlZW4gLWogYW5kDQo+ID4gwqDCoMKgIHRoZSBudW1iZXIuDQo+
ID4gNCkgQWRkIHN1cHBvcnQgZm9yIHRoZSAtaCBvciAtLWhlbHAgb3B0aW9ucy4NCj4gPiA1KSBJ
Z25vcmUgYW55IGNvbW1hbmQtbGluZSB1bnN1cHBvcnRlZCBwYXJhbWV0ZXJzIHRoYXQgc3RhcnQg
d2l0aA0KPiA+IMKgwqDCoCBhIGRhc2guwqAgVGhpcyBpcyBuZWNlc3NhcnkgYmVjYXVzZSBvdGhl
cndpc2UgdGhlIHNjcmlwdCB3aWxsDQo+ID4gwqDCoMKgIGFzc3VtZSB0aGUgb3B0aW9uIGlzIGFj
dHVhbGx5IGEgZGVzdGluYXRpb24gZGlyZWN0b3J5LCBhbmQgdGhlbg0KPiA+IMKgwqDCoCB0aGUg
InRlc3QiIGNvbW1hbmQgd2lsbCBnZXQgY29uZnVzZWQuwqAgRHJhd2JhY2sgaXMgdGhhdCB3ZSBk
b24ndA0KPiA+IMKgwqDCoCBzdXBwb3J0IGFueSBtb3JlIGRlc3RpbmF0aW9uIGRpcmVjdG9yaWVz
IHRoYXQgc3RhcnQgd2l0aCBhIGRhc2gsDQo+ID4gwqDCoMKgIGJ1dCBubyBvbmUgZG9lcyB0aGF0
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+
DQo+ID4gLS0tDQo+ID4gwqAgY29weS1maXJtd2FyZS5zaCB8IDE4ICsrKysrKysrKysrKysrKysr
Kw0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+IA0KPiAvQ29uY2Vw
dHVhbGx5LyBJJ20gYWxpZ25lZCBvbiBldmVyeXRoaW5nIGluIHRoaXMgcGF0Y2guDQo+IA0KPiBB
IGZldyB0aGluZ3MuDQo+IA0KPiAxKSBPbmUgcGF0Y2ggcGVyIGNoYW5nZSBwbGVhc2UuDQoNCkRv
IHlvdSB3YW50IG1lIHRvIHNwbGl0IHBhdGNoIFsxLzJdIGludG8gZml2ZSBkaWZmZXJlbnQgcGF0
Y2hlcz8gIFRoYXQgc2VlbXMNCmV4Y2Vzc2l2ZS4gIFRvIG1lLCB0aGlzIHBhdGNoIGlzIGFscmVh
ZHkgYWJvdXQgIm9uZSBjaGFuZ2UiOiBpbXByb3ZpbmcgDQp0aGUgY29tbWFuZCBsaW5lIHBhcnNl
ci4NCg0KPiAyKSBJdCBhcHBlYXJzIHRoYXQgdGhlIHNlY29uZCBwYXRjaCBpbiB0aGlzIHRoaXMg
c2VyaWVzIGZhaWxzIENJLsKgIFlvdSANCj4gc2hvdWxkIGluc3RhbGwgcHJlLWNvbW1pdCBvciBy
dW4gYG1ha2UgY2hlY2tgIHRvIGNoZWNrIGJlZm9yZSBzdWJtaXR0aW5nIA0KPiBpbiB0aGUgZnV0
dXJlLg0KPiANCj4gSGVyZSBhcmUgdGhlIGRldGFpbHMgb2YgdGhlIGZhaWx1cmUuDQo+IA0KPiBo
dHRwczovL2dpdGxhYi5jb20va2VybmVsLWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLy0vbWVyZ2Vf
cmVxdWVzdHMvNDg2DQo+IA0KPiBCVFcgLSBJbiBnZW5lcmFsIGl0IHdvdWxkIGJlIGJldHRlciB0
byBzdWJtaXQgYSBNUiBzbyB0aGF0IHlvdSBjb3VsZCANCj4ganVzdCBmb3JjZSBwdXNoIGEgZml4
Lg0KDQpPaywgSSB3aWxsIGZpeCB0aGUgcGlwZWxpbmUgZmFpbHVyZSBhbmQgc3VibWl0IGFuIE1S
Lg0KDQo=
