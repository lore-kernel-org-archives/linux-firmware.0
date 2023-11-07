Return-Path: <SRS0=f2BD=GU=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B87C4332F
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Nov 2023 18:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B349BC433C9; Tue,  7 Nov 2023 18:04:15 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30723C433C7
	for <linux-firmware@kernel.org>; Tue,  7 Nov 2023 18:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30723C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnIajjogL4wDse1KyVIdW6AAvJVy/rDBoruAzs4wuuLR7Yyq01FcG87GhqgfS+KlsjwEWUeLtWEaMl/IY0ZWyz1qXQjQcDWH0KaGQoiFv2aIIVrfsKhBEFpkLooRpEEFz/UTSvrPed6klnvvYdrMlALbu0w/OLo0486EGTb1H3sUiSn/3bWkMMQBZG5UB0rlGmMJr3IYvzGIUVvi/5eK3FezChxpW2fT57Ey6D1M+T1YYNfftiIbjFl43/jciFLfLQRCGuZyoaqB5QO55ImwWjNCci4GJF5bPJuhqx7Rs5KK5ejAOXH5XHagGGrcmkgQWSmfVOomNIWKqvV4TpmH9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcMn2kZyTsTADMJmCNtqIc4RxbqcXFjMoWgyf4IWntQ=;
 b=Ay3vosquZ46vTNeR/Q57lJ9Fc2umV9IuNSTlFeOa1f03Ov2fk5lrAk9EJ3HCyEPrAzPl3YamMKpIxzTielzjQx7JalSaxucQHX4vtJgMNA+xB6xgkaLPBlZursWjK3lrQPcNfvzZeUrx7bvhIdgFEB3EGTMd8kqGOjmXB3FxSakQ00NkRPxw9dNRaKhsv1XB4zOqfMtICAVn02TuIWXrGtkb67yvfKUL7VeKQvLOtFJR6nhao8sYksBjYhUVW3zoeP150ni9k4WhW0KN1fcaJOuspaxlpakQTjadXDbsluYchglrLd267QPQypSV0xBpy7PlKKLFlah8Is3fwGSOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcMn2kZyTsTADMJmCNtqIc4RxbqcXFjMoWgyf4IWntQ=;
 b=TYNYG0urBXOHcx+d+Zl+ULDiNGDrVYTiQfo4cqeHx36ojedh7aJyDnoq6Xlacxx2XLxIY6Uhd3Nonbop6thIDdi9uSVpehiHa/QC9LDU9gdIVf1UVIKeqeZFuUczy9aYJZOY6WmRP3IbcLthN1xMXqHlNT7x9xzPLKRtTE1z7Snk0aj53kpxEif4KGKUKO9bSO446B08efj+mpN6PzYJSENyvH0z9+96rS/TuawEqrFQl5y9PUP5eQbtYG+35ZqOUeSNTf+AF3MyOCMtEcDdFJC+BzAQ4cuP8zglARrUFokuZEr1bT5Mpj9sBf8efdqUB0DW87HVYF0C6mefoW3o5g==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DS7PR12MB6215.namprd12.prod.outlook.com (2603:10b6:8:95::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Tue, 7 Nov 2023 18:04:10 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 18:04:10 +0000
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Problem with create symlinks code in copy-firmware.sh
Thread-Topic: Problem with create symlinks code in copy-firmware.sh
Thread-Index: AQHaEaTOYuYZhzQc/EeNGkrYigNudA==
Date: Tue, 7 Nov 2023 18:04:10 +0000
Message-ID: <5f43587a18becaf7b1cf0f6c07d0bca3033cca4c.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DS7PR12MB6215:EE_
x-ms-office365-filtering-correlation-id: 57c8c88a-908e-4c09-9398-08dbdfbbf157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TcKVsZbpKlOQPTbMywdeMGpR8CdNmhTguazbLogyqS4a0+ZzxA5NeGOPJk9L3JgIqYFzkBIaX9MyQLM8I2PQhhXjMl1Ka0Yk3csHolAfnOkQSV9fn9h0IrT/zLqcA+6dhIGTPIvR7eqEhT1rvX0cJnaIQywDjdkAWjI3C37hvRL5Ic5NwBk7iEBF8Fzwe9lX/8da5nH+vmhYW63XjuS3mhpmCJprjH2dFTh2m47llBK9o4BnsjjAF5RoSjQZManswUwTULJu3Wi5uOfvsoZN8p2uOu+OgICUfbjkSuUs4bIFXaI6YTkK2Xx8d+O4pimVPB2+6dKpLAn82jd46R9t+lxJtk067TP+rC/ZNZ7PvrkpoaM0+gU6+ijo0+0PiU4G0oCYkFL/fgLJ6yDPe6cMezra77nAL48/bbjdkloUwdmS2ObvLCI21/R43WFF8qgh45TOBZFUlhp88nrJ8HDUVFJCr/uBuQTSi0608tyUCNYVuxmtzdGr+hQsNtF0PZd43CuwCsoD95BGiu202rLxDPIRJ2aqhe1zQnBp50RONQiQ58Q4wcnEeNs9L6MIuPbwNpK5HZ0gtn6MKuX1A9plUoCeVZSvmbzl3CcAKokuA1g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8769.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2616005)(122000001)(86362001)(6512007)(26005)(38070700009)(478600001)(91956017)(6486002)(8936002)(5660300002)(66946007)(8676002)(36756003)(41300700001)(316002)(76116006)(2906002)(66556008)(66476007)(64756008)(110136005)(966005)(66446008)(71200400001)(6506007)(38100700002)(166002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWtIY2NjbEc1K0NYQVhEWWQ4MDM1NDdzTDhreFdXc2g3ejB0TmhsSE5Hb2xp?=
 =?utf-8?B?NWI4ak1QSDVvczE5ZUxTL2RQODAreXVkaE5yM0pBd3hBaXY3aUtkdHFHYnAr?=
 =?utf-8?B?NW1jMGJTSzEyblFyR3A3TEM2WnFmUHJwUk95TTZFaEY0TW40OERFMUFuTFFM?=
 =?utf-8?B?WUZXMkJOWDlkZzQvTWMzSkR5NWgyWG40YTNmeUtNT3N6d1QzZ012ZzVxMXJP?=
 =?utf-8?B?S0VUczhwaDR5L3Q3Snhsb1E4a2hFOUw2OERlbHdjMWtCK1YrS24rc2k5cnUx?=
 =?utf-8?B?aFBFRys4dm9ob2l1cy84N0pSbVVsY2lCWHFFNVYzMWNMenNINTJ5aUN3WFY1?=
 =?utf-8?B?WnlTTUR0Tkd2L0lhZHFyVG5BRXJaek9CK1UyRHJTWVAzS3Zoa3oyaFg4LzA5?=
 =?utf-8?B?QmkyK3hON0xGWEhSRXcrdVR6b2RlOTJtTFlhYXhQdmlWSmUvd0ZBL2JYRDcr?=
 =?utf-8?B?N3gyVEpmNjlmR29paitHNEo1Q253eE9RK2prZUM1WGVQRkNVQmVrbmd1WDFl?=
 =?utf-8?B?N3M4cU5HZGpVaWFwV3JsUGZxK3hPV0tXOG9wQWNuSnM3YzJQWll3dVVkOTY2?=
 =?utf-8?B?alhnQ1ZvaElHRnE1aXJXMGtpc3hhNzR1ZnphcWtwN2c2RHlyd05JSXJHSytl?=
 =?utf-8?B?U3NyRW1zaFdMTkVkL2t3V05naG1USTZLdnVXRzJBMkFMbk5peCs1SmRtei9F?=
 =?utf-8?B?bzBDUnB3cUJkOW1JSGNPeExuTUk3bWdUVWpHSHU5eE9yZ2lWRkZ6TldUR0lk?=
 =?utf-8?B?ODNaaGFZeUE4b0JpOElFQ3RwUHpweFI4WmJSUlg3RExiNDBlTnFldzdvN1Zw?=
 =?utf-8?B?WjBDTDdBSVZWaDIvb1ArSUcyTTNZcnlCVjNZU1hKZWdFVldkTmJORTRlRHlH?=
 =?utf-8?B?Q0JLRkRHRFNMTEVxaGp0bkx6NGhCMnp3NmxMOXVqcVVHWGl2ejhsN0NlTkFa?=
 =?utf-8?B?Z1c2d21XUmhBbldCZ295RzN3WlU5UWozMmRDK1NVNktxQW12bGFRYjFXWlJO?=
 =?utf-8?B?a3hHTnZTaS9EUWU0Sm16a0x4cTRzeVhySFIzQ1hZNU9yZUJuMWdwVW1yUUhO?=
 =?utf-8?B?UWdvVkdRdzg2aHpDZHlGRjhFM0NXVGhwOEx4WWRhM3RSTUE1NElBVFZ1ajBK?=
 =?utf-8?B?dS9ZM0xmY2FuVjVIUk9jSUxmVkJGRHRsTk5uY2NkOVpHUU9zQUxiTElFVC9R?=
 =?utf-8?B?SnBQcDZRSC9STVc1ZDlrQlVJanlxL3lPNGppd3NOUE1qRDArbDdocnFOekg1?=
 =?utf-8?B?YXUrbzJ6ZmM4Zit6VTJ6Q3VXMnVZSkozYkRoR0ZHYmwvSk82VXFYZHlmcVpp?=
 =?utf-8?B?L2E4QTRveDRLQmxFUW9sSkdSa3ZWRUxnQkpKc3NOSmc2STB4akZiZndUTzhK?=
 =?utf-8?B?ZER3QlhtZzhmWEhZcG1BMVBDcVgzZ3lWQXpIVWJvcEUvUS9GT2FvUjFkUjBk?=
 =?utf-8?B?TkIxbzRlUkFlcWxLUnhHTiswaThLM2UrUkE3c3I3ZUszcTJsREpZWmxmWFl5?=
 =?utf-8?B?S2NRQXh4YkNReUJ4bjlDRFp3L3pQSFQrbmMxY2FqeU5xRjFyYjg1Tnl4a3dB?=
 =?utf-8?B?ZEZDdEwrNGE2cU1ZYW43a3ZubFNXVXovWVpFMEJ5YUdidWFkQ2FMbnRiQnVP?=
 =?utf-8?B?d1NSMEZ5alM2R2NpV0NzQXFjbDR6U3o3L2NkUEFnSUZQOENaUlp1OThGVVhY?=
 =?utf-8?B?cloyd3k1VlRadkxoOTd4UkFUa3E0YnRYQjRMSEpNWUJXekNsQjIxUGVETlhn?=
 =?utf-8?B?cW1vU2VJYldxVlZPQVhKRTAzRXo4Y3dtVnorelhNMVZ1VFRNdGpLSlY5VXJ6?=
 =?utf-8?B?dnBQeE5oSnB5c2hHYTE1R0I3SnlJVGE2WEJwNWJwOGlTOEhSNy92aTEzbnBx?=
 =?utf-8?B?dzZFZ2hGOUxRaGRreWN6Z0NhQU44T2ZnbzBQa1dGNVVIOHdldWY0YnpsUnlO?=
 =?utf-8?B?eG9VMENWZE5GYW1MTUQrNmNrNk1LQUc2b3VVOE00akNzS1AwUXRzV0J6VS80?=
 =?utf-8?B?WlM3dVpDSERYQy9Va011ZTgvRHZsdmdsV0JlN2pUeWJoTlRXSUNsejBxWld3?=
 =?utf-8?B?dlRGOURvVEcrRUFIQXhtMHNJVkZGZDdmSTJFa21OQVFYWDJjeklpQ2NDNVV3?=
 =?utf-8?Q?fwij1zT6fXkptt01pOqn5s76l?=
Content-Type: multipart/alternative;
	boundary="_000_5f43587a18becaf7b1cf0f6c07d0bca3033cca4ccamelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c8c88a-908e-4c09-9398-08dbdfbbf157
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 18:04:10.3916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bB9idFBoNVTSYLA7awSMPEsXzp9FdIZAYdeLuPShaOz0UmA6pX0Gu6ojsnXk7SXyIJPs6k9zULA8QHf2Gq8fyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6215

--_000_5f43587a18becaf7b1cf0f6c07d0bca3033cca4ccamelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

TWFyaW8sDQoNCkkgdGhpbmsgdGhlcmUncyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUgY29kZSB5
b3UgYWRkZWQgdG8gY29weS1maXJtd2FyZS5zaCB0aGF0IHVzZXMgcmRmaW5kIHRvIGNyZWF0ZSBz
eW1saW5rcy4NCg0KDQokdmVyYm9zZSByZGZpbmQgLW1ha2VzeW1saW5rcyB0cnVlICIkZGVzdGRp
ciIgLW91dHB1dG5hbWUgJHJkZmluZF9yZXN1bHRzICIkcXVpZXQiDQoNCmZpbmQgIiRkZXN0ZGly
IiAtdHlwZSBsIHwgd2hpbGUgcmVhZCAtciBsOyBkbw0KDQogICAgICAgIHRhcmdldD0iJChyZWFs
cGF0aCAiJGwiKSINCg0KICAgICAgICBsbiAtZnMgIiQocmVhbHBhdGggLS1yZWxhdGl2ZS10bz0i
JChkaXJuYW1lICIkKHJlYWxwYXRoIC1zICIkbCIpIikiICIkdGFyZ2V0IikiICIkbCINCg0KZG9u
ZQ0KDQoNCkkgaGF2ZSBhIGNvbW1pdCB0aGF0IEknbSBhYm91dCB0byBzdWJtaXQgdG8gbGludXgt
ZmlybXdhcmU6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9OVklESUEvbGludXgtZmlybXdhcmUvY29t
bWl0LzQxNWE1NjUwOTQ3Mzk2ZDQ2MjAzM2ZkZjhhYThlNmZkZjBkOTg2NmQNCg0KV2hlbiBJIHJ1
biBjb3B5LWZpcm13YXJlLnNoIG9uIG15IHRyZWUsIGV2ZXJ5dGhpbmcgc2VlbXMgdG8gYmUgb2th
eSwgdW50aWwgdGhpcyBjb2RlIGlzIHJ1bi4NCg0KQXMgYW4gZXhhbXBsZSwgYmVmb3JlIHlvdXIg
Y29kZSBpcyBydW4sIC9saWIvZmlybXdhcmUvbnZpZGEvYWQxMDIvZ3NwIGxvb2tzIGxpa2UgdGhp
czoNCg0KDQojIGxzIC1sIC9saWIvZmlybXdhcmUvbnZpZGlhL2FkMTAyL2dzcC8NCg0KdG90YWwg
MTMyDQoNCi1ydy1yLS1yLS0gMSByb290IHJvb3QgNTU5MjggTm92ICA3IDExOjUxIGJvb3Rlcl9s
b2FkLTUzNS4xMTMuMDEuYmluDQoNCi1ydy1yLS1yLS0gMSByb290IHJvb3QgMzk4MDAgTm92ICA3
IDExOjUxIGJvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW4NCg0KLXJ3LXItLXItLSAxIHJvb3Qg
cm9vdCAzMjg3NiBOb3YgIDcgMTE6NTEgYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbg0KDQpscnd4
cnd4cnd4IDEgcm9vdCByb290ICAgIDM0IE5vdiAgNyAxMTo1MSBnc3AtNTM1LjExMy4wMS5iaW4g
LT4gLi4vLi4vZ2ExMDIvZ3NwL2dzcC01MzUuMTEzLjAxLmJpbg0KDQpCdXQgeW91ciBjb2RlIGFk
ZHMgYW4gZXh0cmEgYm9ndXMgJ2dzcCcgc3ltbGluazoNCg0KDQotcnctci0tci0tIDEgcm9vdCBy
b290IDU1OTI4IE5vdiAgNyAxMTo0OSBib290ZXJfbG9hZC01MzUuMTEzLjAxLmJpbg0KDQotcnct
ci0tci0tIDEgcm9vdCByb290IDM5ODAwIE5vdiAgNyAxMTo0OSBib290ZXJfdW5sb2FkLTUzNS4x
MTMuMDEuYmluDQoNCi1ydy1yLS1yLS0gMSByb290IHJvb3QgMzI4NzYgTm92ICA3IDExOjQ5IGJv
b3Rsb2FkZXItNTM1LjExMy4wMS5iaW4NCg0KbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAgICAxMiBO
b3YgIDcgMTE6NDkgZ3NwIC0+IC4uL2FkMTAyL2dzcA0KDQpscnd4cnd4cnd4IDEgcm9vdCByb290
ICAgIDM0IE5vdiAgNyAxMTo0OSBnc3AtNTM1LjExMy4wMS5iaW4gLT4gLi4vLi4vZ2ExMDIvZ3Nw
L2dzcC01MzUuMTEzLjAxLmJpbg0KDQoNCkNhbiB5b3UgcGxlYXNlIHRha2UgYSBsb29rIGF0IHRo
aXM/DQo=

--_000_5f43587a18becaf7b1cf0f6c07d0bca3033cca4ccamelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <FE8DB13700C09343A6346317BD3562A3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5NYXJpbyw8
L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkkgdGhpbmsgdGhlcmUncyBzb21ldGhpbmcg
d3Jvbmcgd2l0aCB0aGUgY29kZSB5b3UgYWRkZWQgdG8gY29weS1maXJtd2FyZS5zaCB0aGF0IHVz
ZXMgcmRmaW5kIHRvIGNyZWF0ZSBzeW1saW5rcy48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8
cHJlPiR2ZXJib3NlIHJkZmluZCAtbWFrZXN5bWxpbmtzIHRydWUgJnF1b3Q7JGRlc3RkaXImcXVv
dDsgLW91dHB1dG5hbWUgJHJkZmluZF9yZXN1bHRzICZxdW90OyRxdWlldCZxdW90OzwvcHJlPg0K
PHByZT5maW5kICZxdW90OyRkZXN0ZGlyJnF1b3Q7IC10eXBlIGwgfCB3aGlsZSByZWFkIC1yIGw7
IGRvPC9wcmU+DQo8cHJlPjxzcGFuIGNsYXNzPSJBcHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRl
LXNwYWNlOnByZSI+CTwvc3Bhbj50YXJnZXQ9JnF1b3Q7JChyZWFscGF0aCAmcXVvdDskbCZxdW90
OykmcXVvdDs8L3ByZT4NCjxwcmU+PHNwYW4gY2xhc3M9IkFwcGxlLXRhYi1zcGFuIiBzdHlsZT0i
d2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPmxuIC1mcyAmcXVvdDskKHJlYWxwYXRoIC0tcmVsYXRp
dmUtdG89JnF1b3Q7JChkaXJuYW1lICZxdW90OyQocmVhbHBhdGggLXMgJnF1b3Q7JGwmcXVvdDsp
JnF1b3Q7KSZxdW90OyAmcXVvdDskdGFyZ2V0JnF1b3Q7KSZxdW90OyAmcXVvdDskbCZxdW90Ozwv
cHJlPg0KPHByZT5kb25lPC9wcmU+DQo8cHJlPjxicj48L3ByZT4NCjxkaXY+SSBoYXZlIGEgY29t
bWl0IHRoYXQgSSdtIGFib3V0IHRvIHN1Ym1pdCB0byBsaW51eC1maXJtd2FyZTo8L2Rpdj4NCjxk
aXY+PGJyPg0KPC9kaXY+DQo8ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9OVklESUEv
bGludXgtZmlybXdhcmUvY29tbWl0LzQxNWE1NjUwOTQ3Mzk2ZDQ2MjAzM2ZkZjhhYThlNmZkZjBk
OTg2NmQiPmh0dHBzOi8vZ2l0aHViLmNvbS9OVklESUEvbGludXgtZmlybXdhcmUvY29tbWl0LzQx
NWE1NjUwOTQ3Mzk2ZDQ2MjAzM2ZkZjhhYThlNmZkZjBkOTg2NmQ8L2E+PC9kaXY+DQo8ZGl2Pjxi
cj4NCjwvZGl2Pg0KPGRpdj5XaGVuIEkgcnVuIGNvcHktZmlybXdhcmUuc2ggb24gbXkgdHJlZSwg
ZXZlcnl0aGluZyBzZWVtcyB0byBiZSBva2F5LCB1bnRpbCB0aGlzIGNvZGUgaXMgcnVuLjwvZGl2
Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+QXMgYW4gZXhhbXBsZSwgYmVmb3JlIHlvdXIgY29k
ZSBpcyBydW4sIC9saWIvZmlybXdhcmUvbnZpZGEvYWQxMDIvZ3NwIGxvb2tzIGxpa2UgdGhpczo8
L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8cHJlPiMgbHMgLWwgL2xpYi9maXJtd2FyZS9udmlk
aWEvYWQxMDIvZ3NwLzwvcHJlPg0KPHByZT50b3RhbCAxMzI8L3ByZT4NCjxwcmU+LXJ3LXItLXIt
LSAxIHJvb3Qgcm9vdCA1NTkyOCBOb3YgIDcgMTE6NTEgYm9vdGVyX2xvYWQtNTM1LjExMy4wMS5i
aW48L3ByZT4NCjxwcmU+LXJ3LXItLXItLSAxIHJvb3Qgcm9vdCAzOTgwMCBOb3YgIDcgMTE6NTEg
Ym9vdGVyX3VubG9hZC01MzUuMTEzLjAxLmJpbjwvcHJlPg0KPHByZT4tcnctci0tci0tIDEgcm9v
dCByb290IDMyODc2IE5vdiAgNyAxMTo1MSBib290bG9hZGVyLTUzNS4xMTMuMDEuYmluPC9wcmU+
DQo8cHJlPmxyd3hyd3hyd3ggMSByb290IHJvb3QgICAgMzQgTm92ICA3IDExOjUxIGdzcC01MzUu
MTEzLjAxLmJpbiAtJmd0OyAuLi8uLi9nYTEwMi9nc3AvZ3NwLTUzNS4xMTMuMDEuYmluPC9wcmU+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5CdXQgeW91ciBjb2RlIGFkZHMgYW4gZXh0cmEgYm9n
dXMgJ2dzcCcgc3ltbGluazo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8cHJlPi1ydy1yLS1y
LS0gMSByb290IHJvb3QgNTU5MjggTm92ICA3IDExOjQ5IGJvb3Rlcl9sb2FkLTUzNS4xMTMuMDEu
YmluPC9wcmU+DQo8cHJlPi1ydy1yLS1yLS0gMSByb290IHJvb3QgMzk4MDAgTm92ICA3IDExOjQ5
IGJvb3Rlcl91bmxvYWQtNTM1LjExMy4wMS5iaW48L3ByZT4NCjxwcmU+LXJ3LXItLXItLSAxIHJv
b3Qgcm9vdCAzMjg3NiBOb3YgIDcgMTE6NDkgYm9vdGxvYWRlci01MzUuMTEzLjAxLmJpbjwvcHJl
Pg0KPHByZT5scnd4cnd4cnd4IDEgcm9vdCByb290ICAgIDEyIE5vdiAgNyAxMTo0OSA8Zm9udCBj
b2xvcj0iI2ZmMDAwMCI+Z3NwIC0mZ3Q7IC4uL2FkMTAyL2dzcDwvZm9udD48L3ByZT4NCjxwcmU+
bHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAgICAzNCBOb3YgIDcgMTE6NDkgZ3NwLTUzNS4xMTMuMDEu
YmluIC0mZ3Q7IC4uLy4uL2dhMTAyL2dzcC9nc3AtNTM1LjExMy4wMS5iaW48L3ByZT4NCjxwcmU+
PGJyPjwvcHJlPg0KPHByZT5DYW4geW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzPzwvcHJl
Pg0KPGRpdj48c3Bhbj48L3NwYW4+PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_5f43587a18becaf7b1cf0f6c07d0bca3033cca4ccamelnvidiacom_--
