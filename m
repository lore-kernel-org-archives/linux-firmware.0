Return-Path: <SRS0=XhUs=C6=nxp.com=sherry.sun@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5647EB64DC
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Jul 2023 01:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EF59C433C8; Wed, 12 Jul 2023 01:51:30 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98282C433C7
	for <linux-firmware@kernel.org>; Wed, 12 Jul 2023 01:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98282C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMLgxXg3cXHA8C3gP4ZvO1z2OLZLlqkVV3rlQVKBoXzuWl+FWq3nnP6OzyRadHcQeBLtWBECbyR8xZxbB2xJXMVcPMENOxPC5DjKXrmIrt6kD2uAbzLF58ZQM9miNSScBfUMy3TKkSJYgFrHmjN8yKGpj/+i5fvaxbijv2LO3TJRbaGOyc9HLa5PWpUzkMdklDm6+riP3ssHPYxAop9+HHv4a8MrdQ4iUwLGnN/biGxqsMF1JG6VE16x7MNO9irxcFaflkCzlaKA5P5T8s/ohIDfKfD18m1ickDulIGoJDPhmqQbfyQAuEXjtcgvPV5W/bsJhMH+mb+Oczq3qPAIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r6PWgZqNl7NKSx2tPoat7d6oYPzUGy72rp89O0kZOM=;
 b=UUKTdD6gTFkH2NjkPpnMYARQQr5keqTXnCTUpBQNhqqz/ilETXmmlMAH0GXmNkpyOO/ZF8er8Gan3MMjsQedSMipYIvEY/jDuRsihbAYECWsludTFtXZA68R8Km1GdSGbOYLOfi8MFaT6jk+KU2PRKhOPqz7rJCIch3uVzt+3V3eYc4TvL4ZlRznXZPkOrXWSuTUBCQ7am6qY8paaq+EIw7t/rZ+byM4fC3lStxT/lvNdHikIEG5EvbxfdIbK43LMuTnGg365YBOis1YScqd0Sn/P4dtxXIT7hejvnoSNY57HGP0JQ0B1vPfzk52MTzveqZXFHpOON8CH7N0Fitm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r6PWgZqNl7NKSx2tPoat7d6oYPzUGy72rp89O0kZOM=;
 b=SI2QsyrQx2fLsgPWiEAUgvsrjY+p/We6amjs7G8YN7BMUoyI//dP0BOwsh5IvMAgX8kXDNx3GQqvUy5XESXapUtwAH0s20XVmDpfMehA1erMKuhhiulSpT9h1dxsKau+m7v/ftmIpBWlOmiSG/grOIuLSlctCRCZsU0NpCVgqKA=
Received: from AS8PR04MB8404.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::7)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 01:51:25 +0000
Received: from AS8PR04MB8404.eurprd04.prod.outlook.com
 ([fe80::3331:445e:34ad:1fd1]) by AS8PR04MB8404.eurprd04.prod.outlook.com
 ([fe80::3331:445e:34ad:1fd1%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 01:51:25 +0000
From: Sherry Sun <sherry.sun@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Neeraj sanjay kale <neeraj.sanjaykale@nxp.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Amitkumar Karwar <amitkumar.karwar@nxp.com>, Rohit Fule
	<rohit.fule@nxp.com>, Kundan Kumar <kundan.kumar@nxp.com>, Ashish Patel
	<ashish.patel_2@nxp.com>
Subject: RE: [PATCH v1] linux-firmware: Add URL for latest FW binaries for NXP
 BT chipsets
Thread-Topic: [PATCH v1] linux-firmware: Add URL for latest FW binaries for
 NXP BT chipsets
Thread-Index: AQHZs/YBCEhKtqcXHESkxifxWiT2ca+1XgZg
Date: Wed, 12 Jul 2023 01:51:25 +0000
Message-ID:
 <AS8PR04MB8404F89CAADEC93ADBDCCFDE9236A@AS8PR04MB8404.eurprd04.prod.outlook.com>
References: <20230711124754.1739-1-neeraj.sanjaykale@nxp.com>
In-Reply-To: <20230711124754.1739-1-neeraj.sanjaykale@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8404:EE_|AS8PR04MB7656:EE_
x-ms-office365-filtering-correlation-id: b16db673-9571-4be0-28f8-08db827a8083
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /jF0syy4MP5Jwyl/eMOZA1f0YtkgEOGSwt6tB2VVDJSG2hpUpm0Mvf9zeLYZYKt9U4VF1F9xqqgDvphR0MPGgegAqj3YfXX65X57DJRDfMPiISXbKL7XSMrl4Yu6hP3d4cwGAvo7u5y75l3lBKAwnUCG/gojXeV5wHq2qZFA5hZiToEOlH+sJrYFeqRRgXS28vsko4z+HFUPFn/axCE4jeS3+rhuKUtOVb1QbfsqUsSNmKhuMsS9vkkTScGyy8S3DPaxwHTLqn9GAQBqvjsof8WIyWWzV8ZDWRtwD2eahr6QjUIblzWUXno40W3CIAmk+Kdai++vUmJR1W1gNDiFQCUbtwfvOxri+kUu3WjLluLC3vrqz6UxRlmU7DkB7HLdI4Xfk0PdR3VRIvWESVjWCvBrA7Rwlh8VYjh9bg20+p5kI6is+QBhtrM7ugX9o91Js+81PAQskR5FDrslRPxY5GS2mga6TLZGtQJNJKA27FrO7fs/2B0MpzEpY+LJ/y+D5Kkif+aD7RTP1vIRh1X3EZcOzwxs6cM0/D8DRyT28qXYxbh69a7lkYHQIvx4bWHrRKbObephuMuh+7WNGkQcuJjM/CDs+LV5A0tWLskix6tV+WPloQb7R9vDbUeFh3oQ14y0I8N+rLSEcPYXfKMP9g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8404.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(8676002)(8936002)(478600001)(5660300002)(41300700001)(55016003)(316002)(966005)(7696005)(4326008)(44832011)(52536014)(26005)(9686003)(186003)(6506007)(53546011)(54906003)(66446008)(66476007)(110136005)(66556008)(64756008)(71200400001)(76116006)(66946007)(2906002)(83380400001)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?bFBuMlBkWVhCT2tFZWQzaW1rK3Z1VDNXZlpHU21TbDQrK3pPNk5nekNCcEVx?=
 =?gb2312?B?c3lWYk83dWxnbUlQV3Rrc0VtQ1c2S2tBNlRsTk55MnIzN0RlYlF6U2RCamZr?=
 =?gb2312?B?Unc4Z3dDaFZmd0dLMXRMamxRdEovbzFQekRTS1RkZURxY21ydUZ5bkVIaGxs?=
 =?gb2312?B?YmJPY0Fnc0F6NHkzT2I2RmxKNU5NRUJYbEZubXRNM1dxa0ExOGJNQUxUWlk2?=
 =?gb2312?B?Q2ZjdmxBUzRSUTkycUozanpXa3N4djlwMkh1MDNoT0ViVWdTQ1ZmdjVBeFlG?=
 =?gb2312?B?SUFpcW8zdURqOXduR2gwRHMvU1dGQVRwdjZHdlJacmwyQUZJYVYrM2d0bktS?=
 =?gb2312?B?L2RjdmVFbzh2YUNEVzBmQzFrUXJVU1o3MWR0NDVIWkNTWUpQV09od2Y0dlBt?=
 =?gb2312?B?MnhacXJuY2FwbTVLcENGcWVYYkNrR2htSVVaNU9vMFpEemZsT0F1OFRsd09T?=
 =?gb2312?B?OUo4dFVHRVkzY0kzR0pwNEhZQWttcHpTODRnYTlPekp5UHQwREZIdStJWTZT?=
 =?gb2312?B?eXlCNW03Z0RYVGVQeVJKUXorMUt3YnNWUUswa0lXOU1JamZ0bUhyS21tRSsx?=
 =?gb2312?B?RmZrS1F5Kzd1MUU0bXJZYmZkVkg2OE40NWtGYWFlNWJHZHRnVUlYUDN3WkZz?=
 =?gb2312?B?WVFVMWtEUElhYURUUXBqdXJXZlJvZEpYa24zdS95ZWk1Q0VjOEJHTWhNZzlk?=
 =?gb2312?B?QUtlYUd4VG1Kc0pWVEpTZXl2c20remRxZVQ5blJKelBoTDNzU09hckVvOC83?=
 =?gb2312?B?YlBHUENJL1dCU05PZXdUTWpIZFVBckhYZU9kYUpBVXlHS0J4K2RXNDFJa0g0?=
 =?gb2312?B?Q3BsQWhqSG9wU3ZJRm9Beml4d3g0Zis3dU9IMnZTNlRFYmR2Q2N4WjQzcVN3?=
 =?gb2312?B?UUNJVU1wRzRHNkhxcEFmYnRwY01yNDl3UW54Z1pqTlR5aUJLRVd5VThFU2h3?=
 =?gb2312?B?WkJYS0FpM2pXeVprNUpxSGk0Z050WUtjRnVsc1Y5THFKbWdIYWNqNDNQSVNZ?=
 =?gb2312?B?aktrbWI0blZwV1o0U0hHY3BUZldLV3BPeG1lN0J4R3phZ0Jma01GR3MrR1JS?=
 =?gb2312?B?SHlTVzFwMXgzd20vOVUvMG54U0JMNmJteit4Sy82WWtIemdPL0laWnJyTXpy?=
 =?gb2312?B?RDNlOEJ5c05zbnFKNTAwdzlhblBJTndkbk5CVFFadE9HTUJuTTdqT2YvOTkz?=
 =?gb2312?B?cFNKNCtmblNJQzlTekwrTGlFdU5aVG12ZVgxYW95QXV4bTNnZzNHWEwxOUFL?=
 =?gb2312?B?YWV5VXE1dHlhcjhORDFLeExEZGQwUGdxdjFLcFlkUkxIamFkOXh0Tlk2eTN5?=
 =?gb2312?B?QWp2Ym40R0xhd1VWUTJmY3FPWVQwUkVONldVRmx5eFhpcXB2OXc0L0VnN1NU?=
 =?gb2312?B?RlZqMGt2aTE2VUdBV1BHTHRKSHVMMmpyejBIZjF4MC8rUGJrS21ndkJQcTFC?=
 =?gb2312?B?RU9iL3FyVkRUTC9MVUpBRktiWFBFRzFNN1lUY1VHem85bU5oSjgxSXNnNGRT?=
 =?gb2312?B?bXRMWHdkVjRnS2ZGbmFFcnhnUTJwWkkzdHB0NGJNdEY5Zkg1K0xYUE9qVkZL?=
 =?gb2312?B?MnVmd050YmN6Yi9vQ3B3Yjc2WnIvUDUzb3M3U1dYejZaMnBzR0EySUlUc0hR?=
 =?gb2312?B?cE52UW1OejA2WUwrWUp6RHJlRTdybUZKSXZuZklYeDQ2ZUhQNkZrMGd1Vm80?=
 =?gb2312?B?bUFOWnZoUGdrd1liQUNxV1VyNUEraDhkZytNNTVjTjJTeUlEcTRjbFVJVy9C?=
 =?gb2312?B?QjJEK0FNWCswKzcwWEsvNUcxSmx3cXlGSWxyZVBMMVdHZHdwdS9FYnBpUEt6?=
 =?gb2312?B?d1dYMWE2MHdidGhGVzB2eXpzbmNEMFhhWHZ6em52eWl0YXBPT0N3Yk4xbVZL?=
 =?gb2312?B?dzRiYll3UG1ZSXoxM01yL3NiUE9jSzU3S1FaNjlHUG5zU3JDVnpSeTgxbmx4?=
 =?gb2312?B?cktoWE4yUVBUU0YyQm1CTjlnTi9SVk1WME1Ya1Y5ZWFmR2EwampBenRYYjlD?=
 =?gb2312?B?WDB1T1NsYy9VaSttODNQbjRmb09YMzl3ZFBkL0Y4dENDNWsrUHBjd05QWjR2?=
 =?gb2312?B?bWF6ckZPamV3VWgvams3YmttM0xOWWRWSEMwU2RlV3BHWldPbE1xMzVOMGZn?=
 =?gb2312?Q?PkJQ=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8404.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16db673-9571-4be0-28f8-08db827a8083
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 01:51:25.6167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1Y4BlwblH7T4cDc5qfbnjnYMWvzu4lzAqYf3S2sqAeBZLDIJfnrx5eYCSwhWi2t5DjAhlueJdL0eciNKvhi/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmVlcmFqIHNhbmpheSBr
YWxlIDxuZWVyYWouc2FuamF5a2FsZUBueHAuY29tPg0KPiBTZW50OiAyMDIzxOo31MIxMcjVIDIw
OjQ4DQo+IFRvOiBsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnDQo+IENjOiBBbWl0a3VtYXIgS2Fy
d2FyIDxhbWl0a3VtYXIua2Fyd2FyQG54cC5jb20+OyBSb2hpdCBGdWxlDQo+IDxyb2hpdC5mdWxl
QG54cC5jb20+OyBTaGVycnkgU3VuIDxzaGVycnkuc3VuQG54cC5jb20+OyBOZWVyYWogc2FuamF5
DQo+IGthbGUgPG5lZXJhai5zYW5qYXlrYWxlQG54cC5jb20+OyBLdW5kYW4gS3VtYXINCj4gPGt1
bmRhbi5rdW1hckBueHAuY29tPjsgQXNoaXNoIFBhdGVsIDxhc2hpc2gucGF0ZWxfMkBueHAuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjFdIGxpbnV4LWZpcm13YXJlOiBBZGQgVVJMIGZvciBsYXRl
c3QgRlcgYmluYXJpZXMgZm9yIE5YUA0KPiBCVCBjaGlwc2V0cw0KPiANCj4gQWRkaW5nIFVSTCB0
byBmaW5kIGxhdGVzdCBGVyBiaW5hcmllcyBmb3IgYnRueHB1YXJ0IGRyaXZlci4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE5lZXJhaiBTYW5qYXkgS2FsZSA8bmVlcmFqLnNhbmpheWthbGVAbnhwLmNv
bT4NCj4gLS0tDQo+ICBXSEVOQ0UgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL1dIRU5DRSBiL1dIRU5DRQ0KPiBpbmRleCBlNTMw
MDJmYi4uZTZkMjQ4MDAgMTAwNjQ0DQo+IC0tLSBhL1dIRU5DRQ0KPiArKysgYi9XSEVOQ0UNCj4g
QEAgLTYzMzIsNiArNjMzMiw5IEBAIFZlcnNpb246IDE4Ljk5LjEucDE1NC40MA0KPiANCj4gIExp
Y2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOU0UubnhwIGZvciBkZXRhaWxzDQo+IA0K
PiArTGF0ZXN0IGJpbmFyeSBmaWxlcyBzdXBwbGllZCBhcyBhIHBhcnQgb2YgQlNQIGZyb206DQo+
ICtodHRwczovL3d3dy5ueHAuY29tL2Rlc2lnbi9zb2Z0d2FyZS9lbWJlZGRlZC1zb2Z0d2FyZS9p
LW14LQ0KPiBzb2Z0d2FyZS9lbWJlZGRlZC1saW51eC1mb3ItaS1teC1hcHBsaWNhdGlvbnMtcHJv
Y2Vzc29yczpJTVhMSU5VWA0KPiArDQoNCkhpIE5lZXJhaiwNCkhvdyBhYm91dCB1c2luZyB0aGUg
ZmlybXdhcmUgR2l0SHViIGxpbmsgaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvaW14LWZpcm13
YXJlL3RyZWUvbGYtNi4xLjIyXzIuMC4wL254cD8gVXNlcnMgY2FuIGdldCB0aGUgbmVlZGVkIGZp
cm13YXJlIGJpbmFyeSBkaXJlY3RseS4NCg0KQmVzdCBSZWdhcmRzDQpTaGVycnkNCg==
