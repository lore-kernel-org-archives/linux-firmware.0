Return-Path: <SRS0=8ycF=WE=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A11C28B28
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Mar 2025 21:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BF53C4CEEE; Mon, 17 Mar 2025 21:45:43 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A1ABC4CEE3;
	Mon, 17 Mar 2025 21:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A1ABC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+DhJvD/nTL+L1eHZWhTOb4QVhM7+mdcr+6xuF+7dj/oPrvH+J1MvBHhCBbeTRKeNvK+M3DqueHGLs+NKfo6rc5VK34FSeEyIIIMi+weifl1MC8/iny12tHeI6KZhj6P6iaExgAFUypIM0KPmjFjYIVbkaYjN2PIUvmWNg9zrfdDwMvrRBDcjh30vgveoNZhtOTCj9Y8HHt2Lev8MfOF2IksnG5NygKXL6ZBrKuh8AAKqkhSN1ZX15LxODwWTtZUCiW8BG2VxJHZofCG7fUphI+0N3vAkP+T7fE58BcerjHcY76bvoRxvPMnzZAV4JUCkMCUOFKRQFLi8ZFRal6mHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVWAuQRtsAkRMbsS7p48e7XxsZveqyych30/GLRV7gw=;
 b=xPKWHkFA1jFWc/nctT+bIup4oIlfVBD/PeYMtzyAB5tFYESRIM8KqxV94YQIzPt9dF01GsSoz6N9guhvUpdkzTxSS1LfRaXBySNDwL3T1DPZ9iKiuVve58ZyujSzviJ5r5+6gwtSy7lZ88oiJ0mSZ73BXkX0jrVpxRkxV4qIE3aMFKwLpLbRpCqZXsncRyjIRXBL9edFWBMTtQAnLBltAJy0Hdl/vr5CburfzdSCi9maLPp6U5b8yQj3V6uPL4GIZjO4bLlP3J6MlBnvn28Azq5KfSgts4PvqomVxsj8SERHPGyLE2ZUkNns86CvJrQrov3N/45qspxO6IgCymTJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVWAuQRtsAkRMbsS7p48e7XxsZveqyych30/GLRV7gw=;
 b=QA/R0/KcDEo5cdftkYjtXWFgvRsVhPET+LYgYPXJqlqYJEs7pT50BqSgRXpSeJS8H3cpGOgpnLq2PSj1qJfjeIoibVWRo1yQywpgtXREUXXz3liC4c/c202XLN0Lz6DetrJkFWeq3g21WMxYluVUwF2/XHby2x4fYMEg2BH5JCeejAwhFoScuKFVs/2zQbRoiaI5jPlB6fJXoJhLsvExFTT5aqghoARWQzcgfm5VAxLmx+/MmyByTwOZBN/PTslDkFuIu7LmbcoNPBlt6vuLTkkefqYIE9ZZ+UJdP+65+NLc+I1WlMkGtZ8Ga6v4RPuSWK/gvuE+qpTCnqPhMBsXMQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 21:45:39 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 21:45:39 +0000
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"maxim.cournoyer@gmail.com" <maxim.cournoyer@gmail.com>, "superm1@kernel.org"
	<superm1@kernel.org>, "jwboyer@kernel.org" <jwboyer@kernel.org>
Subject: Re: [PATCH 1/2] copy-firmware: make script smarter about parameters
Thread-Topic: [PATCH 1/2] copy-firmware: make script smarter about parameters
Thread-Index: AQHbl3EZ1LVTLNn43U+F/0d3Bkk3AbN3xwsAgAAV6gA=
Date: Mon, 17 Mar 2025 21:45:39 +0000
Message-ID: <3b84e3e89907f9589e6fd2124703a51c2aab1920.camel@nvidia.com>
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
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH8PR12MB8429:EE_
x-ms-office365-filtering-correlation-id: 9a52655b-1bfc-4459-13d2-08dd659d0f05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L3ZwWTJibW1vUTNBZjFWNzBibWk3emhBcVdOYmY3bC9oemYzTzlCY3p1eG1I?=
 =?utf-8?B?K2FSNVB1NWZ4THhvTXVSbjZnbTQ1RENEVkN6VkJHK0xRWDB2czllYTdIc0JF?=
 =?utf-8?B?OHJkbGx0ekdaTnhobnkxVCszYXF0Ukx3QnJ4NlBnb1NKSWJGMnBIZWxkRmRG?=
 =?utf-8?B?Uzl3cmRwQzZmWG1CQTlOMVlENUNsVUtYa3pTOHROT0VSeGltTWFQYnBxREha?=
 =?utf-8?B?M21XMjR6V0dLNTd4SVJrR0xvZzlmVzhLMFg2WVlybno2VE1QZmg4M2UxUTVL?=
 =?utf-8?B?cGhuNlNLTmJtakZLcnB1SlZsdEVKUkpsMFBySUxQSTJyNU9sVEZyTmFJSGdS?=
 =?utf-8?B?TkNmQUl1S0FzcEQrSUE1SjJRSGNIcnN6MVcwWklKMGVMbVlEK0Z5OTFLS2ZP?=
 =?utf-8?B?U3F1eWRabVk2SjVZR2ZRdVNzd25jNGd6UmU4QU1Dc2lURlhYdnlUdU56cVZt?=
 =?utf-8?B?UjlGZVpCUk16YnlWWS9qYmhXWEd3TEFPa3d3b2J1dkVZM3BXVlVVREx3akdj?=
 =?utf-8?B?ZTMvdDVIbml0MDBWeGcxcDk5SzY3LzFFTzFRd3NmeVQ4VXVYZFEyNldjZ2Ji?=
 =?utf-8?B?ZjdPRkkzZENUT25DeVRFV3E5RUlJSHk4VUpDTk15dlNjM0k3UktPanJKVXRT?=
 =?utf-8?B?cXJHWkwzNnBZZWlCMGFnYnN2UXRVMG1ld0V2UWt1emxLTEh0dGkxSVpONXVJ?=
 =?utf-8?B?L1ZKdUxzaTdYcitrYzVKSXM5ekVWMzNCMTllczdnU1cyZW1pV0ovTmlqN1BG?=
 =?utf-8?B?aHdyTFQ2c0JFTzFvdWdYQXFpN1NSeXhqbTRKNUVlYWpWRVRmYXh1K3ZXRWJs?=
 =?utf-8?B?ekdGUU8za05CRndOcjlsd2RCa3p2R0x2bWtuNnVaaU85QjdWSEhjdG1IWUly?=
 =?utf-8?B?TE81cG14UWxJbGROeUdwLzF3dUxRQk4vcnVHK2xTMzNCamlvNEdWelAzNzVw?=
 =?utf-8?B?V3BCQnE1cGdvSDhVY2RNeEcrU2F0UHVDU3MzUkhZN1VlSm5WYXhTM051VnhK?=
 =?utf-8?B?b3lVMHpiTEZXcWZiVVJkL2wyUGpuY3RJZ2pYNmxkUWh1SkwxWlBDVHZueGMy?=
 =?utf-8?B?dy9ENTdtcWpkd0dIVkZFdDFWTUtTQ2ltK3dNVWUwRGxCT2pSdGVRclpPSWpv?=
 =?utf-8?B?Z0JtYTNEbklXZ3QrS1A1cWUzL2JueGhEU1Bnb01aTWhNWVZURWxxbFIvUUhm?=
 =?utf-8?B?b3FPc2ZqRzFnS3lEMThwSW43UFhRMXJCaGRWYzYyeDhwOVBtQ29sTTAyMkp0?=
 =?utf-8?B?cXZPWHYvdzUxSllZUm5GdnR3RWdBdnNiWVNFUkg5N080elBvMGJSck92TnR6?=
 =?utf-8?B?UUlLVFJodDhrOE9FTHUxa25MdmN5U2NpVmlLUWhlbEFFb0dqRlJzdm5yK2xq?=
 =?utf-8?B?cHJyeS9lZDBVbllmV0pZYnVTbW5EMDduVy8xbkc4Tkk0aFFZMzVCbXdmdU9h?=
 =?utf-8?B?TzB4TDFOdk9aMmJwSDUwY3NqaDRmRDQwYTQzdFJvcjFOdmhjNGxpOC9vZ0Y3?=
 =?utf-8?B?WjZlUWJyTjhpSGs2TEZCbk12NEY4eCtCY3hqaHZ3OWFYMVNOajJsc3VCZ2Va?=
 =?utf-8?B?VGZWNGwzci8xc05kcSs0Ym5YRUE0U21FQk9sSnNlekFIdnUzdnhtdkdrNVgr?=
 =?utf-8?B?UVd1OWo4NEU2aENCY2IzakFqWXBwbnMrMkFJYk5EWFdRZWNCaXlDU0JyVDhX?=
 =?utf-8?B?L3FuTmxCR1RUWG80cmlwQk5IZHhzWjcvMllORnJwMGhWd3E2NEJzdDk0VlY1?=
 =?utf-8?B?dG9QT3ZPajh1NEtvMjgxQ0JEdUx3NGlUOG00NlA0WlR2UWlweWxSUzFPbTVY?=
 =?utf-8?B?VFFCRVZwbkVxNGthbHVoK0tjU0hLbTNKNjNIWTQxODYvL2NuZFA5OGM3bWRm?=
 =?utf-8?Q?W8A6ONilP7SJ6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0ZPVXcyU3FUdjdkR2JWV2RBc3ZtUW1HakxvTlptdXhNOUxEV1psVk93WnRR?=
 =?utf-8?B?TTdZckwrV0VNdjJwQjFWVFByaGJNdDJQQ0hnQlZhYWJqQlBzOFdDWnhHYkYr?=
 =?utf-8?B?QkxIUnppSFhpdmNaUWRsbmljSXFxU1o3ZWpnSU03TnE2NDhQNmFTUXhBSHVU?=
 =?utf-8?B?WmJpVGVVRnZHNU11S3dGcEw3MmhNbkFmWGxLYlJjbWJ6bXJVY3Vick1pWnVn?=
 =?utf-8?B?YVlFaER4WnovVEZRZGFJbEk0Q1hjWlJZOEd1MHdFcjRRdEV4OGYvR0xpSjNn?=
 =?utf-8?B?MkpDUkdIU2VFeHFmUnBZTTBYakhnSUcxaGF5SHU4QWxKSjhtckRheWZNUS9D?=
 =?utf-8?B?UkZPMTEvRS9Cd0VrWmphcjkrNkY2eEcyNFhEcU8zdHdHelZtUGFEWHpORFpi?=
 =?utf-8?B?emh3U0k0TmpoS05hRlN6SngvMHd2dnM3L1dQTG5NSHJSUUVjRnJMZ0FCTUI1?=
 =?utf-8?B?eVB1L3lPQ2M5VE50YXd5RGpHTXJmTGdETUErK0YwK0VYbGRyN1dMT2E5L2xu?=
 =?utf-8?B?cU56RW5WZDJNRXpkWjhsUmRpTW16VjFDalk4MzJDaVJ3NFBMTkllS3VrU3Nu?=
 =?utf-8?B?NUV0TVpRSGtEQzVvM00wWHlCQjNxSDkvWEdFN1NndXQyMVZrUnpQdkNxUmxn?=
 =?utf-8?B?SXMvOWdKVFBjMXVYNmdlZVQwT1YzSlFlZU5NME1Ic3d2d2dySnFZczIxSXV2?=
 =?utf-8?B?emF1Q2FCZFJQK2tXQTROdDEzdFhmd0VMZko3ZnJUOW03TC94OW11REh4Z09z?=
 =?utf-8?B?S3lCU1MyVjlvaXNsUGQ5VEpXS1dENGF1cGlUUWdSVWQ5VDRXS3MvenNqd1lS?=
 =?utf-8?B?WTFsUVNwcWZYeW5nY2JqcEtDSjNtK0w5bmVaU0djN21salRVY0Iwck5DUW5M?=
 =?utf-8?B?cE52MWVXUTNpNisvb0Y2Uk9mZUJ0dVlJSFVYQ1NmczRRamVwNlAyaHRteUU3?=
 =?utf-8?B?MzJnTlp3M1Bqejd4blAvNTNsVVBycEF2SFdKUWc5clN2NHVucUUwbEJoc003?=
 =?utf-8?B?TkhxMWVPY21yYk4rTm5Wb3djZUJuS2YrWlVFYmNzL05CcEZKbk90bkd6QUcv?=
 =?utf-8?B?WmNhQVpoQTlqbmpEZXFiVkc4eG1DSXcxR2tYOXREcmpZWXpyaDBjdXI0Lytw?=
 =?utf-8?B?ek9aWXZkQWFjMFhMNFlacGQ0WDZuZThTa1Z5TXp0SXVpRWJMNWtLbnRVUHZV?=
 =?utf-8?B?TUt4WUJpWktlbGdURk4rbThNOFZmWEJ3aXI3SDNhV1h4L0xpdkp3cHozVThR?=
 =?utf-8?B?UXg2aTVDQkRpZlViS2ZWemdhb0R3QWE0N0QxcXlqcDBJZGQ2aktQeFZUSFBn?=
 =?utf-8?B?OTgzOW5rNEsvMW9iaGE3WmVQUXkrc1dRNzRaeEcvWGg2elIybEloUlY2TkxD?=
 =?utf-8?B?TXlId0dpZjB2QUFnYWIxRkVwRnBTM2RDcG0yWWRtZytQbUUyc05GSnUzc0c5?=
 =?utf-8?B?RnRTVld6bU5qWnRibzdIbW0zMFQ3OVlXcHdNNkxrRG9ETEZUbmRlTlZ5aEVT?=
 =?utf-8?B?NGRVYkxOM0ZhTEljc1ovZlROQlZnYzc1aldEMkJGZkdxWGp0VFp0YVljbHhZ?=
 =?utf-8?B?REd6bEFaVnRKd01WTkxrckwyTWlSVTBLa2I3RitSVTVBa1R6ZjRPUFBrcjdU?=
 =?utf-8?B?N042UEQwNStsTWtveFdtVCtoWFZJcnZudTZPbzFuenNraDJ1MlBxZGI0Z2xT?=
 =?utf-8?B?bWlJMXVHNVVrV3RPRm9xaFFLT0g1bmZkL1VpTW9IYTJUcXdPZUJNaFVvQXRS?=
 =?utf-8?B?b2gvVjFLQ3ZmQkMzbkMzblcxNzBPS0M5em4ybGtNb1k4QXJaMjhFOEVycEM3?=
 =?utf-8?B?U20xdDNPdy9hOXlWbnBYQ1RtNUgzd2FhVmZSdE4zTExYRStFYlVadG9kZFNs?=
 =?utf-8?B?TUU1eC9tWGNFMDNKTEsra0xDMFJFeHkwcnNXWVdabGd2MVRsVkpvZmJ4K05Y?=
 =?utf-8?B?N1J5K0Nib3JEVWdHT01BNzFPQjFYUmxveCtVWWt2WXFKcExFREVadTVsM3ZD?=
 =?utf-8?B?eFFtZnZnYUVqb1I3dW5YK3p6b0U5VHFXUWhFT1drZG1OM2NxQ3RyMkJPWDln?=
 =?utf-8?B?QVFqa1l6S05UVTg1Um5kclYybjVRQU03ZTBmVFFXdWErZnllM3RSL1RWZHAr?=
 =?utf-8?Q?voDZdLvHtctQIRT4yfAC+anna?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05403FFA4BF9B849991221B12E5F89C8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a52655b-1bfc-4459-13d2-08dd659d0f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 21:45:39.2290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+j2Kr975pIS8MxRYel8BerHrCBiI3VEg+ub9yfzJznelT/uN2WDpEaO/hSEDOAiHsklOP6QzFTeJqCBlQ/Dlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429

T24gTW9uLCAyMDI1LTAzLTE3IGF0IDE1OjI3IC0wNTAwLCBNYXJpbyBMaW1vbmNpZWxsbyB3cm90
ZToNCj4gMikgSXQgYXBwZWFycyB0aGF0IHRoZSBzZWNvbmQgcGF0Y2ggaW4gdGhpcyB0aGlzIHNl
cmllcyBmYWlscyBDSS7CoCBZb3UgDQo+IHNob3VsZCBpbnN0YWxsIHByZS1jb21taXQgb3IgcnVu
IGBtYWtlIGNoZWNrYCB0byBjaGVjayBiZWZvcmUgc3VibWl0dGluZyANCj4gaW4gdGhlIGZ1dHVy
ZS4NCg0KSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0ICJtYWtlIGNoZWNrIiBkb2Vzbid0IGFjdHVh
bGx5IHdvcmsgZm9yIG1lLiAgSSdtDQpydW5uaW5nIFVidW50dSAyNC4wNC4wMToNCg0KJCBtYWtl
IGNoZWNrDQpbSU5GT10gSW5zdGFsbGluZyBlbnZpcm9ubWVudCBmb3INCmh0dHBzOi8vZ2l0aHVi
LmNvbS9pZ29yc2h1Ym92eWNoL21hcmtkb3dubGludC1jbGkuDQpbSU5GT10gT25jZSBpbnN0YWxs
ZWQgdGhpcyBlbnZpcm9ubWVudCB3aWxsIGJlIHJldXNlZC4NCltJTkZPXSBUaGlzIG1heSB0YWtl
IGEgZmV3IG1pbnV0ZXMuLi4NCkFuIHVuZXhwZWN0ZWQgZXJyb3IgaGFzIG9jY3VycmVkOiBDYWxs
ZWRQcm9jZXNzRXJyb3I6IGNvbW1hbmQ6DQooJy91c3IvYmluL3B5dGhvbjMnLCAnLW1ub2RlZW52
JywgJy0tcHJlYnVpbHQnLCAnLS1jbGVhbi1zcmMnLA0KJy9ob21lL3R0YWJpLy5jYWNoZS9wcmUt
Y29tbWl0L3JlcG8waWplZjhiZy9ub2RlX2Vudi1kZWZhdWx0JykNCnJldHVybiBjb2RlOiAxDQpz
dGRvdXQ6IChub25lKQ0Kc3RkZXJyOg0KICAgIC91c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdl
cy9ub2RlZW52LnB5OjI0OiBEZXByZWNhdGlvbldhcm5pbmc6DQoncGlwZXMnIGlzIGRlcHJlY2F0
ZWQgYW5kIHNsYXRlZCBmb3IgcmVtb3ZhbCBpbiBQeXRob24gMy4xMw0KICAgICAgaW1wb3J0IHBp
cGVzDQogICAgL3Vzci9saWIvcHl0aG9uMy9kaXN0LXBhY2thZ2VzL25vZGVlbnYucHk6Mzc6IERl
cHJlY2F0aW9uV2FybmluZzoNCnBrZ19yZXNvdXJjZXMgaXMgZGVwcmVjYXRlZCBhcyBhbiBBUEku
IFNlZQ0KaHR0cHM6Ly9zZXR1cHRvb2xzLnB5cGEuaW8vZW4vbGF0ZXN0L3BrZ19yZXNvdXJjZXMu
aHRtbA0KICAgICAgZnJvbSBwa2dfcmVzb3VyY2VzIGltcG9ydCBwYXJzZV92ZXJzaW9uDQogICAg
VHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KICAgICAgRmlsZSAiPGZyb3plbiBy
dW5weT4iLCBsaW5lIDE5OCwgaW4gX3J1bl9tb2R1bGVfYXNfbWFpbg0KICAgICAgRmlsZSAiPGZy
b3plbiBydW5weT4iLCBsaW5lIDg4LCBpbiBfcnVuX2NvZGUNCiAgICAgIEZpbGUgIi91c3IvbGli
L3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9ub2RlZW52LnB5IiwgbGluZSAxMDQyLCBpbg0KPG1vZHVs
ZT4NCiAgICAgICAgbWFpbigpDQogICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zL2Rpc3QtcGFj
a2FnZXMvbm9kZWVudi5weSIsIGxpbmUgODgxLCBpbiBtYWluDQogICAgICAgIG9wdC5ub2RlID0g
Z2V0X2xhc3Rfc3RhYmxlX25vZGVfdmVyc2lvbigpDQogICAgICAgICAgICAgICAgICAgXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQogICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zL2Rp
c3QtcGFja2FnZXMvbm9kZWVudi5weSIsIGxpbmUgODM1LCBpbg0KZ2V0X2xhc3Rfc3RhYmxlX25v
ZGVfdmVyc2lvbg0KICAgICAgICByZXR1cm4gbGlua3NbLTFdWzBdDQogICAgICAgICAgICAgICB+
fn5+fl5eXl4NCiAgICBJbmRleEVycm9yOiBsaXN0IGluZGV4IG91dCBvZiByYW5nZQ0KQ2hlY2sg
dGhlIGxvZyBhdCAvaG9tZS90dGFiaS8uY2FjaGUvcHJlLWNvbW1pdC9wcmUtY29tbWl0LmxvZw0K
bWFrZTogKioqIFtNYWtlZmlsZTo5OiBjaGVja10gRXJyb3IgMw0KDQo=
