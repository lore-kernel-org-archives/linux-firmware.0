Return-Path: <SRS0=FY4E=B5=intel.com=miriam.rachel.korenblit@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26144F3D5F3
	for <linux-firmware@archiver.kernel.org>; Sun, 29 Mar 2026 07:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D97CDC2BCB1; Sun, 29 Mar 2026 07:00:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C27A5C116C6;
	Sun, 29 Mar 2026 07:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C27A5C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774767616; x=1806303616;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=cpPmuzIj4MBvJPgn8rE7hHGIRlsLAZ4v9b+XozXPbrA=;
  b=geXo75vjqYTVyYtzbGcj7VicvH6daijYAeQZh/uJJkbQ3wwoTI1va7Ux
   Sq+9ZhMkf2qh3wYtAOATWq1o9yOCoX2/4N0WhQ2U920HkEkKpPbX4pZqP
   S6Ob+R0+hJKGUPMaHpN2Zoka2+rTE/NhPJFYCrk/SQQOb65Im5w9CQDln
   /+mXyER9VA3/S0BGLoHWxR9jZ1Xs+DwsBJLRf3Rni/OVz201a/0EGhJ+y
   hfXOIwewxJbkvkPcxWLKU7ez3Ik5ZshptZXMZprJdPtBPPUVbMyELWWIl
   SBlhpJy1KV4TGd71LyzMubGuEA7j+DlJOEVGcHLEuJ3HJWAtd9F2BKToN
   Q==;
X-CSE-ConnectionGUID: UGl54rJ/SfuSkzmZsb0MKQ==
X-CSE-MsgGUID: Cc1vG1oxQDaWCK56ukwvdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75674897"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="75674897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 00:00:14 -0700
X-CSE-ConnectionGUID: 3TM6mXjMQxKRF2xNr3UBYw==
X-CSE-MsgGUID: xy35Tj10QFmL4twqFXdYXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="224919085"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 00:00:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 29 Mar 2026 00:00:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 29 Mar 2026 00:00:11 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 29 Mar 2026 00:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQYtJudWQkTeDjnk/44sxIa6CBzJ0vhHqbfzy9ExE0HBliohRabiA9VpFXDFmxjHN2kErHl9y/RhVOCrFWpe695A3QSIHkH6UbxdYq4h2NBFYdk9qwnJEju+uqu5WpgfGv1vEaN5MDrOufiB1iCYwfh7pgUpJ7Exyar9DVQXuwp2r378FeiLi0Cln4iJihf98eL3FNoPD7cXovZBLySm69C0QIGBdBdpaWxlxAjIKV81uHcQZTCo4CQHuv4cwjcqqB7FU+rFe8uq8dlj/Tc5tral+YauVilAuj0Yo/1W2ZYPS35GP7zYWEX5+42r/KO1eL+2nZk5HvBayDbL2hF8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpPmuzIj4MBvJPgn8rE7hHGIRlsLAZ4v9b+XozXPbrA=;
 b=T+dgLUTjitZk7OtJzJwMN8aNkiq8m+e+LAQjH8K7W3miY+DOhfcqUXOnqDQAbb9Fg3IbHidJi2cHEOQl0SxqNrqnzgOaI2Abu2cb6qCNHxngigGG5mwYOSqUdlVNxr/EmxVbOZ+dVgmJ87SnkcL15Ahd4/xNSKGGlprtIXiCc90HXOoPgmx0bBXmeaHtAxX8okwSh7Gz6Cx5i0yrepuS27QqM7y0+lssXOVdN580htXBnv4zDT1Ul6ORF2Fjetqj5JkqkOr6BThRs3VWMQGiNOAGpiOeOLx996sEZb5h2bf8Yw0XzLtrIctAcU7TD0e2xfAV3uUsb5B2hkxyAsnqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f27) by SA2PR11MB4988.namprd11.prod.outlook.com
 (2603:10b6:806:f8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Sun, 29 Mar
 2026 07:00:08 +0000
Received: from DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::f30e:2322:8783:964d]) by DM3PPF63A6024A9.namprd11.prod.outlook.com
 ([fe80::f30e:2322:8783:964d%3]) with mapi id 15.20.9700.013; Sun, 29 Mar 2026
 07:00:07 +0000
From: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, "Dreyfuss, Haim"
	<haim.dreyfuss@intel.com>, "Damary, Guy" <guy.damary@intel.com>,
	"kyle@infradead.org" <kyle@infradead.org>, Josh Boyer <jwboyer@kernel.org>,
	"Hutchings, Ben" <ben@decadent.org.uk>, "Yang, You-Sheng"
	<vicamo.yang@canonical.com>
Subject: pull request: iwlwifi firmware update 2026-03-29
Thread-Topic: pull request: iwlwifi firmware update 2026-03-29
Thread-Index: Ady/SZ88JvltblbmRwGhDqBauC5qLQ==
Date: Sun, 29 Mar 2026 07:00:07 +0000
Message-ID: <DM3PPF63A6024A9C0E49D41DE491E608383A355A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF63A6024A9:EE_|SA2PR11MB4988:EE_
x-ms-office365-filtering-correlation-id: 4c5deacf-c5f4-444a-b61c-08de8d60d002
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: lMi2OrOtkqIetz8SobsPucWUrrcrBfzjFgAUenWzVlZQWHrecOZ2o9RAxX9+9zs1rR8vuaDDJ+4WA2tk3gaSl4BF6sxKxCXNRC2AqX2OgZs4k87P0vT86WZvdtEoTM5zjwQpJCcmBzhp/e8FtnUCP9xLMGiZNaAqJb2xNW7MgpCDdwvBpOyUI3CCcijZDnWcmHxjfjijGmtBZBtDznrl7ecYt9ndEW16zjkMdSAu0OlIn+yp+cOmGtGUN1twN3PIAXG8J94gApCK4gmkLG+3L88E2w1iFeRA2cMMaL7jfrYAkJ1ooqgMIX+AI2UEfbKKRz41PpK60RtZRgOJwLXc5cYbEb22+1L0U8hegav5PYdYwDiob9VK2JZ7w1QwZYjb5t4fvlggWV1WSxt/OeNvFtz2DsfuDmyB21Z4hrU5tFbzTZ1Z9OZUfTYdpHH2+iE2xQekQMN20Yf8vEF0nVaU2bnMWwp/QbRBWI94mvjp6AK9pMI5NwiL8kvCbDUtKnDjra098RYxfCcy2OpKMRuKJVt7+On7EyKe8qAfthL9ExFYRPbMLSlAlQH1NHszo99RMUg9dUxMNbu7LOoJr5I1OubsW6MaxDtdnN4Eg+dNEkoUJ0fQ9yamfGCy/z8LV0y2uXAT6p0Cjj+/ZZMkybctbc+9uMh1nc7nRsjQV+5k2rzkhOBqWFPTDiPxpZ3Bw7W+5gacBaU3SXDYci6K/K+1jizgLnNq5IYAp+IraWUOU0YqTdLm06SzRVE+8KQs59MPxRpRqc6OyJXvI0+/JAbklGB5tTL+chedCA9zOXEBmZY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF63A6024A9.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzdGZThiMFdZaW1yNE94a05iTWRoZis2VFdXcnFseG5ZUnh1MkN4d2FsbTBG?=
 =?utf-8?B?QVprSHlmQzRxTDZ2cmsvaFo3NEl6OGl5UzB2TUpVTTBMNFBHOXJ0NW9YU2Rj?=
 =?utf-8?B?Rk03Y2F0d3ZobE53SzRWZURTSGFhekFuMHRQa2pnbk9aQ0ZOWW9tRTM3dmRC?=
 =?utf-8?B?cGJxQzNRSEw0V0dERmNHRHA2WFBYZ0lsZEVpMFNLUXJEWHF1SExJaGxVMUgv?=
 =?utf-8?B?a0wzaWZUQVJ0Z0RNa2xPNnNVZklxT2FwZXE2NVQycTBIVCszWGcydndyK3l0?=
 =?utf-8?B?UGRHVVZqUHNPVXkvcnBIcVJNOEF1OVZoTXNZYmsyUjRVMSthWWlMZFZnRGFn?=
 =?utf-8?B?eXpjczVaWEQzUnVJV2NweVdBR1JHblBQK1gzdnV4UzQ2S3FCTjNYbng5cyt4?=
 =?utf-8?B?TFM3Rm40ZWpNN0pjcEtLTGVWZkhvZGlwWWRETy9ETUhOeWJrVXNCTXphK3pC?=
 =?utf-8?B?NVBsRnluNjYwSjAvOElZWUJyQ285V05LOE4zVjFVKzlBYnV2Z20xL2U5ZVpO?=
 =?utf-8?B?NGs3UmpGc1JrYnNpY2JHZUxwRnZFaExlMGFZci9vT3ptR0E0UVpxanV0VkI1?=
 =?utf-8?B?TXJ3bmljcitpYzN5eGl0WXRrZkxPRjE3T1pwT0phZnkvQjdHRU9kZFZGa29y?=
 =?utf-8?B?UnR3VVlNUUNtUTVWMlE5RGVLdytKL21FeUpvODVwOUNKMHp5UjdkRFpBcUlt?=
 =?utf-8?B?cncyVDNpSUVXaWpSTHA0THRTa1JpbWdXeGdrTWRLYm5icUNSSE1WTVJzN2l0?=
 =?utf-8?B?NGlMQkdGRllEeWs1azVBdjVUMlAwSDdKekdxbEJGOHltcFJKMXlwUmg0TXJq?=
 =?utf-8?B?dUJ4YkxBbW1FR1BETnR6Ujh1TE00ZXNIQWVoYkV6a21YMUZhb2dLMVZpaVM2?=
 =?utf-8?B?eURpd3U3Q2NUQjNPdzB2ZDJVS2Ewc2JVZ3FrNVZaR1F0SEF4RUVYYUcxKzZ0?=
 =?utf-8?B?b0hvYzlsa0RsZzRxWUtJdUFaVk43QWRuTkcwVmJrbEM0elpjR3JmOHJPQkly?=
 =?utf-8?B?Q1o4c01RbCtzd1VhRk95MFluS3NRVkRja2FkOG1WNWg5WVBtenNHbmo4VjVu?=
 =?utf-8?B?eXZ4Y1ZsNHF6Z1dIcWVTSWpjRzVUd0VHbjJnelNRbUxlYTc2cG00OFduTklp?=
 =?utf-8?B?Z0QxZzhmbWFUYkdFdGF4WHJidzJKMXc0S05qUmFzRWFQZ2swUXg1UTNlcWYw?=
 =?utf-8?B?M2pKS2Yva0VsRXZjZzNpc0t0U3JsN0tnVFU3VGdZc1RPUU1uUVdKdmErK01X?=
 =?utf-8?B?U01WV2ltVVoyVHM0Z3I5dWwzQzRzSWl1Y2pVaGRPTXZ6akdObUdzRy9ZdDMx?=
 =?utf-8?B?d2QxcFZZUzJEbmpKMmVuSVI0eitRMjk0VVZBbEIvRXBYWFhlcUhrUkdtSnRZ?=
 =?utf-8?B?U2FIOXNFcnpQTzBBbWRuc0I3aXhhdkFxY0YxWXZnMGsxWUVYdjlaVklVYm5v?=
 =?utf-8?B?NzBuZU9DbzZKMXAxeXpJVHNvdHRjL1FvOTUwWXhtb0lKaU42eEFYdllkRFo5?=
 =?utf-8?B?Tm1rSXpEL2YxZTFFYVVYOWNHcUVqVUF1aVd5Y3czem45OXFEK0VSckZaNWhq?=
 =?utf-8?B?OUlRYzZJd3kzL3d4OUNZOGtOVENVc1IrVVRTZ1lvZVpvb0t4YU90ZDNuSW9n?=
 =?utf-8?B?aEc2SGhFbzZNUStmTWhxemtQaTZLQzNDTTRnb3YydHlvenhabFZ4bmZmUWJH?=
 =?utf-8?B?cnFuU25QRVNWT1k2R2I4ZnVMUnBFejRKQlRORkd1V3NLdi81Zmt6M09vSkNR?=
 =?utf-8?B?NXpXOUNsZW9PS1dLcmdYZ3VMR1ZlWXNma1ZDdGMvWEREYVl5Y2xueVppMURO?=
 =?utf-8?B?eCtzb3VtQU5EdXIzV01VY1FkTHBMVngySjV2U255dGg5WjlxOEhmSlhGTlpT?=
 =?utf-8?B?bTREMWdiYkNFVXZjeFNoNjFsdXorNktpQzdqWmJqQVh4WXpjZUhaTjNFT2JG?=
 =?utf-8?B?bWxyQlRVM2hUUldOS0RnQ2ppendNS2RhVSsraVljbWhGYjg2MUhvTldTOUZG?=
 =?utf-8?B?VE5kQXVVUVdFQnRCcGVXUDFIUTc3a3pIWFk0THN2dERFMmZFRmxDdlVUYVVt?=
 =?utf-8?B?VkZ5ZnVDK3BnaXBMVTRYUmZ5ZDBjQmV6YXp6UUUwQjJkU29lVlphUFpJSzRC?=
 =?utf-8?B?clV1TXRJRDgxa3VJYmkzWkZ4MEhPbEhwYjdjY2JuMTRHMjVFSUNhU0NxUml3?=
 =?utf-8?B?VVpIUHNBYjhHaEpLUXJCbEEyUzBTRTJnTUhNYjdseUFYR01SY0J2V0o2aVYw?=
 =?utf-8?B?UENkOEtBb0VVcjdXdHVsemJ3NWR1V00zRUlNcXpNaFF2cUN6b0x2Q3hMZ3pv?=
 =?utf-8?B?NDNteTJ2eGhob09SNEpFMHdNRHZiTDk0M1k4N1JxL3AvdXBQbEpEdUhSVEd3?=
 =?utf-8?Q?rFoF6Ohk+rnEgRuQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vPbbQKC1prVu4MUIix1icVbIgISyupxOqAGpl5CFk8S8W7x8eXLpCBGwX4cPgadDVkIY3nbq4jAkbvRQzk6owlqNjDxwqS0PnsWeFeU41gG6Gofow/bRREJlYWchUg2Gcd+vLQrgNa9zBaA+wlTcwLinhAqiFNhq8zpGwX444jvOEhMMnk3XkBQF2ZnvZXCjktcPVtg+rfK+XWzlaulS7qe54DZIRbcUJRHufUMxFTxJqQvB5jF4YZ+DnOWxRQEvCv90n8MDzF8co4K3iyRCfR38uAIghLQ9CMJDyAaJ1jUq0aafg32UmKgxiUzi3NC9GygGujUJTvwyGKke2Xw3pA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF63A6024A9.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5deacf-c5f4-444a-b61c-08de8d60d002
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2026 07:00:07.9307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i94ctfjgA36MD2L+Ck5InuWA3rNrK6NGRmIyTPisrBYqT86que5Lix5n2NZP07+vFN5rPepVQ2xiAN7+OLKVCRsphH4DqxshCQ5lfWKJeUinrllzhYsqBEJrhRR+4KBQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
X-OriginatorOrg: intel.com

SGksDQoNClRoaXMgY29udGFpbnMgdGhlIGZpcm13YXJlIG9mIGNvcmUxMDMgZm9yIGFsbCBzdXBw
b3J0ZWQgZGV2aWNlcy4NCg0KUGxlYXNlIHB1bGwgb3IgbGV0IG1lIGtub3cgaWYgdGhlcmUgYXJl
IGFueSBpc3N1ZXMuDQoNClRoYW5rcywNCk1pcmkNCi0tLQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDg1Nzg2YjQ0MTNmZGM0ODZlM2JjMGY0ZjZjZmVkY2U3ODAyZWQwNDE6
DQoNCiAgTWVyZ2UgYnJhbmNoICdhbWQtc3RhZ2luZycgaW50byAnbWFpbicgKDIwMjYtMDMtMjcg
MTc6MjI6MjQgKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Og0KDQogIGh0dHA6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaXds
d2lmaS9saW51eC1maXJtd2FyZS5naXQgdGFncy9pd2x3aWZpLWZ3LTIwMjYtMDMtMjkNCg0KZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGY1NjU4MGMwNjhlYzdjYThiYzA5ZWIwYWRhYTcw
M2NkZDY0YWJmY2Y6DQoNCiAgaXdsd2lmaTogYWRkIEJ6L1NjIEZXIGZvciBjb3JlMTAzLTQwIHJl
bGVhc2UgKDIwMjYtMDMtMjkgMDk6NDc6NDcgKzAzMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClJlbGVhc2UgQ29y
ZV9tYW51YWxfc2lnbmVkX2NvcmUxMDMvNDANCg0KMjAyNi0wMy0yOQ0KDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpNaXJp
IEtvcmVuYmxpdCAoMyk6DQogICAgICBpd2x3aWZpOiB1cGRhdGUgdHkvU28vTWEgZmlybXdhcmVz
IGZvciBjb3JlMTAzLTQwIHJlbGVhc2UNCiAgICAgIGl3bHdpZmk6IEFkZCBIci9HZiBmaXJtd2Fy
ZSBmb3IgY29yZTEwMy00MCByZWxlYXNlDQogICAgICBpd2x3aWZpOiBhZGQgQnovU2MgRlcgZm9y
IGNvcmUxMDMtNDAgcmVsZWFzZQ0KDQogV0hFTkNFICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNDAgKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQogaW50ZWwvaXds
d2lmaS9pd2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDMudWNvZGUgfCBCaW4gMCAtPiAyMjQzNzQ4IGJ5
dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWdmLWEwLTEwMC51Y29kZSAgfCBCaW4g
MTgzNzE3MiAtPiAxODM2NzEyIGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWJ6LWIwLWhy
LWIwLTEwMC51Y29kZSAgfCBCaW4gMTU4NDY4NCAtPiAxNTg0NjIwIGJ5dGVzDQogaW50ZWwvaXds
d2lmaS9pd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDMudWNvZGUgfCBCaW4gMCAtPiAyMTEyMTAwIGJ5
dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLWdsLWMwLWZtLWMwLWMxMDMudWNvZGUgfCBCaW4g
MCAtPiAyMjI2NTI4IGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLW1hLWIwLWdmLWEwLTg5
LnVjb2RlICAgfCBCaW4gMTc1MjY1MiAtPiAxNzUyNzEyIGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9p
d2x3aWZpLW1hLWIwLWdmLWEwLnBudm0gICAgICAgfCBCaW4gNTUwOTYgLT4gNTUwOTYgYnl0ZXMN
CiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0LWEwLTg5LnVjb2RlICB8IEJpbiAxNjA0
NjkyIC0+IDE2MDQ3NTIgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0LWEw
LnBudm0gICAgICB8IEJpbiAyNzgyMCAtPiAyNzgyMCBieXRlcw0KIGludGVsL2l3bHdpZmkvaXds
d2lmaS1tYS1iMC1oci1iMC04OS51Y29kZSAgIHwgQmluIDE1Mzk3ODggLT4gMTUzOTc4OCBieXRl
cw0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTAzLnVjb2RlIHwgQmluIDAg
LT4gMjMyNjcyMCBieXRlcw0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1nZi1hMC0xMDAu
dWNvZGUgIHwgQmluIDE4MTA4NDggLT4gMTgxMDU0OCBieXRlcw0KIGludGVsL2l3bHdpZmkvaXds
d2lmaS1zYy1hMC13aC1iMC1jMTAzLnVjb2RlIHwgQmluIDAgLT4gMjIyNjA2MCBieXRlcw0KIGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1nZi1hMC04OS51Y29kZSAgIHwgQmluIDE3MzY2ODgg
LT4gMTczNjc0OCBieXRlcw0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1zby1hMC1nZi1hMC5wbnZt
ICAgICAgIHwgQmluIDU1MTc2IC0+IDU1MTc2IGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LXNvLWEwLWdmNC1hMC04OS51Y29kZSAgfCBCaW4gMTU5MTY2MCAtPiAxNTkxNzIwIGJ5dGVzDQog
aW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC5wbnZtICAgICAgfCBCaW4gMjc4NjAg
LT4gMjc4NjAgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtaHItYjAtODkudWNv
ZGUgICB8IEJpbiAxNTI2OTU2IC0+IDE1MjY5NTYgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdp
ZmktdHktYTAtZ2YtYTAtODkudWNvZGUgICB8IEJpbiAxNjc4NzU2IC0+IDE2Nzg4MTYgYnl0ZXMN
CiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktdHktYTAtZ2YtYTAucG52bSAgICAgICB8IEJpbiA1NTAy
MCAtPiA1NTAyMCBieXRlcw0KIDIxIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbnRlbC9pd2x3aWZpL2l3bHdpZmkt
YnotYjAtZm0tYzAtYzEwMy51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbnRlbC9pd2x3aWZp
L2l3bHdpZmktYnotYjAtd2gtYjAtYzEwMy51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbnRl
bC9pd2x3aWZpL2l3bHdpZmktZ2wtYzAtZm0tYzAtYzEwMy51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtZm0tYzAtYzEwMy51Y29kZQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtYzEwMy51Y29k
ZQ0K
