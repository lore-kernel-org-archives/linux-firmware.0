Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67337606A320
	for <linux-firmware@archiver.kernel.org>; Sun,  8 Nov 2026 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GKk8emT7
Received: by smtp.kernel.org (Postfix)
	id 5823F1F008A1; Sun,  8 Nov 2026 17:28:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1794158887;
	b=ZciRrtY+UqGVzsUAv24Fdd6ZWYtcF1O9ihxW2ZMPLGEpshuXdcQD8qvZkUyttyV/ZzfW
	 0noBrsvRbektx9bVqIfMezEWJQWOxo/vxZQkaRxsq9TWSAB2nMofv3524RZXpBwJO9BpY
	 J8ywDizNL3UJCX51GN/j5ptH2TPMh+oz9nRxSRmIHFU2EAVqnHpJUOEyDlCY+AlJdeZQs
	 5IjfF5hZkVDa6hY7kyYbNn1ZYvURxhYvvCBjrpR9eAwJ36Y1awSrtkasrkzaVmD8+RCDh
	 Q3BHFOuN1QZDVtfUd26ppPlej0WTEAflDwGwJc1xrht4gcNDwaclsh4wY5lww3DrKSQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794158887;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:List-Id:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=eZa+ZdfmzwB927kL88471wWKqKgUvTVod8UVd8eAsfE=;
	b=pVdaQWUSf0JsQU4u8JbfKtQPR7ea5qjYtbqCs+be2Tzn5Ox2hjlB87vqv30yvE+uH6cJ
	 G7YjWeKP/g09aid0UROxARWBZLylRzfxiKpbAscAxyFsgjhZMr1+tzG1IlUtewcVfqA7c
	 +lojyRXl80f00p5w6rBfm9YWKEhL9Dyy95sVWsJZXwuwLqyM7/AxgAzMh/adxZ+iO9XLQ
	 Mek+1Ctbg+Ka6cAY182j/SBQ0MvzgqMVyD7XQdYfpnhYkNwvOe00EyHwo7pzuVlm3ldK3
	 MHOgnGX1Z8bGvJM3VEtDuQYAtXG9Y9vloMeZbCFmrL1WDn9BdnV3vtE18PxOODddxzw==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GKk8emT7;
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94F071F0089F;
	Sun,  8 Nov 2026 17:28:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GKk8emT7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 94F071F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794158886; x=1825694886;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=eZa+ZdfmzwB927kL88471wWKqKgUvTVod8UVd8eAsfE=;
  b=GKk8emT7I2/W1wFZSQlkOJGtZxW7qUtrMrOarg0kdVFRfqsAZGshIA1/
   Vo/+1psUAiDj0dhlXL5uVDt4rP1wFsPcGeQns3VoluWgdTQLIi1Ls4rUd
   FG3JbXxH5H5Hx8S5KcBO/WIvjKr5u4rn/R/onmDKkDw6xqJtteHuG3Ikd
   sRiF4+Gu7z502pMS7Yvek4tDBAUz6UHiEYACIQKBcQ1q55x9hCK95rj3R
   g+D1bcuicDhAsLKt4zYgWd7MskMrtQHcsgvtZRrU17zpdLRnhwSLvdpVE
   F+WISswrFot4rkGrEU9bwfP7Fv7RnFIgc68NOnWpsOWKK4TBZjRP1jMB8
   Q==;
X-CSE-ConnectionGUID: qGU8+om8QbutwYa0Mo7ykA==
X-CSE-MsgGUID: 6pAALrSfS0Klv+UiDDsZjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2800255"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2800255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 09:28:06 -0800
X-CSE-ConnectionGUID: webPvIrQRieRtZeaS5DTow==
X-CSE-MsgGUID: s5XvO5dTRtCnxEfCirsF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="8027070"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 09:28:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 09:28:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 8 Nov 2026 09:28:04 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 09:28:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjRtwglrQotlyjqaYDLMuCQaJFy+C57D8Uv1Vq/v7mOQeX+yiMv/STIMWfqnndA2lTf9nWfl7Y8O2cDVsGFZYn0B9REIWG9GA1RpJ6JDLNdMh22Yo8XaOYKLEgWrBqLUsotKHVcB5XNAmLVPQ5L03NLgRmpxNrI9D6Vaw77P4A9LizfldVLGWJjLCli9oYPqhay/VNI6hRM6SZMZk7NRjxvUtrGpxNQpheutZBlaJWfcZh2b2I7jTV5VFFjyuPTQQNb3KndcPmM3CDDzBAD4JAdqoXlcodXl9UBHbYVVjPoVuL56zb9yEmMwuNYQUu/g8LzsnymeIFQ6/mfMBpQrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZa+ZdfmzwB927kL88471wWKqKgUvTVod8UVd8eAsfE=;
 b=q/4J3k1MVjF1C/RaW7hjj7+0p3lCEc6ae57VIRX/Dr1MxOXTZM6YxboF61VrM4SDvWAxQi41fVgLmOJTnP2aMvKnFFimmpto2yTGGGesQ/NrgVWLZHQUpGBrlQ6SjrFonNmoedz5R2WSKHM+s01T6gH1+ZbsoxGpYlB/WV/VIRxrDnXFbO3iyqSQt/FaVAS9N4r8G44jDDf6zz4Nc+F/pF4a01Kkfv4IrxfxhTMjoldF2DD4hpkqzulUTy+mKxk5DyaAQB/94LPF+kRRHDeFd8UcLJiQfuStTMongz/h5u/ghj+zK8+pZA3IGNS8FDIboPeOyhoQ1/2Z+9/NDfTefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB721313.namprd11.prod.outlook.com
 (2603:10b6:208:626::22) by IA3PR11MB763247.namprd11.prod.outlook.com
 (2603:10b6:208:620::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Sun, 8 Nov
 2026 17:28:02 +0000
Received: from IA3PR11MB721313.namprd11.prod.outlook.com
 ([fe80::ece9:28d9:25bf:5805]) by IA3PR11MB721313.namprd11.prod.outlook.com
 ([fe80::ece9:28d9:25bf:5805%3]) with mapi id 15.21.0592.010; Sun, 8 Nov 2026
 17:28:02 +0000
From: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, Linux Wireless
	<linux-wireless@vger.kernel.org>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "Yang, You-Sheng" <vicamo.yang@canonical.com>, "Hutchings, Ben"
	<ben@decadent.org.uk>, "kyle@infradead.org" <kyle@infradead.org>, "Damary,
 Guy" <guy.damary@intel.com>, "Dreyfuss, Haim" <haim.dreyfuss@intel.com>
Subject: pull request: iwlwifi firmware update 2026-11-08
Thread-Topic: pull request: iwlwifi firmware update 2026-11-08
Thread-Index: Ad1vpllhV0EEoEeqQrS8WCIoOf55lA==
Date: Sun, 8 Nov 2026 17:28:02 +0000
Message-ID: <IA3PR11MB721313297E7927E041F027412AA3742@IA3PR11MB721313.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB721313:EE_|IA3PR11MB763247:EE_
x-ms-office365-filtering-correlation-id: 7aa1b55f-411f-4d03-4465-08df3dbda446
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003;
x-microsoft-antispam-message-info: 67U+fuJHuDxcFkwxOXfVXLnmlq/Zi7cW5TStOjVKQJ1o87hNKe9B1WgC22QPyf+Rp/OX8j17++D9mDZM1zymgtMkNw7MUTDKVw1teEOPOXBaklUSf/fwxgGKjWeSJuZsOkqjvH6nLNaRCliwxC94rspRW+tAaDmn17ZXilXNnwrjMo71xi0hbsLjNiYHSVaRHK6WJAdPnnsowNhLXfG9D+kFhnfBvCarCN5iyP9taES1YYa5t0CckmTjkq2uuEBQYTKr7zXbVif/YnpSKLMxZbYIwARe4U89TFJQfnOfOIYWQFQ0MiyQ5pZ5RZmmBQlOmeiSBl9MCuxSmdP0nkbHp1E0U2FfwyEoJ1hD0G1i74wXeDmxu3y5vkUTftDdvCI+fjY45/lbpI/jbttZAuBZALWXQudckQfRkphWSHm2kQ+ogn08vUcCoo9bFEB2UIZekcaitdEUXbqZ5kGQ+AabgcFKrQVv8CnOJ2T5/2sSX5dOKDHKPbANYb0Gcjr/M1SqEGm6UuO/uuNqaurkqV3S8FqAIP3C0yzDFHn6TJllnZh7yvEJ8UURXdArGvNvBWUCPti9tY6olXIxgzmGUKDcoQ2AxakEoY12hYNEXSnK9KvJ0xMLiaIlGePrtA9P9mreMHlFnnkJpIT2CbOmUBN83A/4EOzQSQw0wT0wpyp4upIB2iWImld+P0KQ657droJb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB721313.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2RubGNFZFZGZmg3YXc5bXlxaDIyYkZuMUtSNEhRTVd0V1V5OVpvL0VYalFE?=
 =?utf-8?B?aExMTGZuR3MwVnpnSnI0Z2J4RStFa1NvOFI2b2lrU2hyajdrc2xyV0djUSth?=
 =?utf-8?B?N2pjcjhPSEkvbTB5cGlNeG9hVkRWTTZRTmsvWmh3M2w5OXZXWHlEbFNPL2xP?=
 =?utf-8?B?Sk5wRUlvQUM4UTVjbVJJcDVoYmJWdjh0YU1TL1NXRkxlclp4a1Q0VktCUnFu?=
 =?utf-8?B?RTlVSm5jK2JSWGd5L25XdE84UGFxNGhjd3ZsR280SER4NTlkeXFnSVlleHlC?=
 =?utf-8?B?TGt6dUNSeDR4dHp1dkw5YzZIVHFYaDRxYzIyRlpaTTVRR2srYzkwZ0RVWTh2?=
 =?utf-8?B?blZqWXdlZWFSOHBaRXhHK2kyc2FMU2dBNHpObmIvNFVwOTBNZ3Q5aTRYamxU?=
 =?utf-8?B?aE0va0FBdnpEWGRwVTRRREJwbGFRak1ON1M2Sjc4TkNsRU01ZDlSRDF0WEg0?=
 =?utf-8?B?c0ZuRlBWcVJYbU03aE1IK2ZoelBrMjdQMC9GMjFOdEpQRWczRjd0ZVYvUFM2?=
 =?utf-8?B?cmZzUW8rVXJIWGFERzZaRVFnWG9QeWFWRkljR3VkdmVzemliZlpJUjRGbkk3?=
 =?utf-8?B?YUNMNU1kaWNaRVV2U3d5cnp6MUhMcnBOSzRhR2xWZXJYanZETjd5TS9zTXhk?=
 =?utf-8?B?M3M5RjRzRFhkVXFQdDZyWm0rWjIyT0lxaHZZQjV0VzEycDJWTlBlRHdBdFQ1?=
 =?utf-8?B?Y0pvYm1HQzNISkQ2TS9MalM4TFFIQXQ4UUptc2prQ3YxTFFlYXVaTDBuU3FV?=
 =?utf-8?B?UEhwMWVVRitja2NCMU0wdTQ1U2puS3FleCtVSHhtaFBDVmNYS3hESGZRTU9w?=
 =?utf-8?B?UTB2L0pLZXF0Y3NGM3ZFSUdlbTRvV05DcGY5ZXk5N2Q3Uml0SmpjZkx3cWFQ?=
 =?utf-8?B?S0xWekZFbG4ycDZUNjZkMFB3TnViV0hHdFN2bThjak1zc1hYTTIybnpkSWkr?=
 =?utf-8?B?VXFzcGRGSnRPemN4RkFzMUF0RXl6aVZGamlZLzYwbjZsdVMwcU5oWnZodUN6?=
 =?utf-8?B?cW8wYVpsc0tOek5SajU3eGdSRWREbXZRNVVMVVVEYXo3S0FaM0lYTXFyQXU3?=
 =?utf-8?B?MTFjM2RSOW1VNGNpbUFKODd2dGpxVzRYYkthQjJ3T2tNUVNHNUo3bjJ6MTFt?=
 =?utf-8?B?ZFZwaFZVS3M1ZEhSWXVlcFdNT1VvVzNaYXJaa0crUzZYNnovYW1UMzZoc1Vv?=
 =?utf-8?B?ZGpIVk9oOHdMNHMraThLRDNxaTV2Y1hMLzIrSmgrVmtuTHV2T2tpUWpKdHdU?=
 =?utf-8?B?MnNVKzR0MmZ2dFJnbWtOdDZjaTA0OTdzQXphemtOYTYrZ0Nic1o5YXFJdkdO?=
 =?utf-8?B?MWh0d1RBTnFwQ1gveGNDMEt5UEpwa2RQU0dhaWxrNjd5UWpZL0lVTkhBVFha?=
 =?utf-8?B?QndUcHg5MWlvRkltaGJUL09qdkdtamZpdFJuMkgzREVCZkp0RGV6S0xLd2lN?=
 =?utf-8?B?ZlhOZ08zMHU5bGNyTkIvTk5vejFhWVU5OFdERGFwbmNYdEJRQUFOMVY5dlBr?=
 =?utf-8?B?N1FXOTE4STRMbWhGSWJDZjZCdXVuQmtNY0pWMzdpZGNIM216WTlrY0hCUnlv?=
 =?utf-8?B?VzBzMGkwWnZnaWZMR3VNWlI0dFYvRzJCdjh5QlN6MkZrYm1CVmJLRm5hSzVo?=
 =?utf-8?B?TEN0cjZSQ1h2ZXU3V1pEU0QxQW9Vckk3UERNVlorU1F3YWRUTGI5dWI5b3Ni?=
 =?utf-8?B?Y3lFVTJyeVZsdVNIOWdhY3lpVVpUbXgwWEt1UzR1RWdEQmJTR3IxOUkzZVdy?=
 =?utf-8?B?ZVRsc3JBeDViVnVpUy9iVUh0VG40K0pibFRkc3c5NUQ4YTZsMXFaREh3SGRT?=
 =?utf-8?B?b3UzV0JjWTlSZG5RVHNBWHpKQm54WVdGbU1neE9kelVuRnlQZXFCWmhxVVl0?=
 =?utf-8?B?MzRLSmhESlZUNG12blBnbVM0RWoyQVNmSG1pK2kvejE4Q2xFVUoydnpBeVlh?=
 =?utf-8?B?U1M5NnJBRk4rK1VaY0l0L3dMOTBsc0w5R2VPUklJL2lQd05rMDZZc0tZWTJp?=
 =?utf-8?B?dU52U0FJOU1rVkptZFpDWFJzdjQ0dE9TdVdISXJHZkJpR2pOTG5SWGt2ZDNt?=
 =?utf-8?B?UDQxQzAzL2lNMDNISUIvNU95c05GWWgraWlrdzg1aVI1SFBXSzZsTHBnWDdp?=
 =?utf-8?B?L0VBTVY5MkR2RDR0eWVIQ1FKdkZLcDRwb0x0cmcvMmp2V3NiQTBCVTYyaytL?=
 =?utf-8?B?V3JrVHl0Z0VQR1lhdWVYRW9rWW1HbXRwS3dGMzZIODlZRVBSR2VacXJEeGJU?=
 =?utf-8?B?Ti9BajhQTEY5YW55RzhKZXY5TnhsYnUwU3VvT0VNSGRLcVZPNlF0cUNkQ0JJ?=
 =?utf-8?B?K0VSM1VERmh1SFhZVW9yd1Ard2N5bTM4ck5ZRTFFWlZhcGJxY25NU08vMFZl?=
 =?utf-8?Q?AOcmFGTmdmAzWyoM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DK2czqTE7ERe+Pjn7klDRjeZzY5gNjDeQXn/05LbLhoLt2GDL8CIo/oxIi9NcPUEGJAAe34clsdCqGHqGS9tNtOXVC7GK4XKBt8328DjUbKrs3kSyofpIBOYMvYmoFCpQMYBOPtsa8YlOZ48LsRtpyfYMi+nSA61GA8zxq9pRkaUHavKI/6T5pKeunjTbjRiiGVGeg27+daHB6NtrDjzBFFz8B+jnWbZprQQmGl3b7DzaiB/CZuDQubR1QYSST3JZBhyt6j+P5d6efOnXpFke97PZR19EXkt+WvBijMCYpL23yfHkY9rEC8vmAIMIlDMjN/YAfdK/60Cb0ONo/YJpg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB721313.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa1b55f-411f-4d03-4465-08df3dbda446
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2026 17:28:02.3008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OIeEhW6CTH5heoucl31b4c3XrubPm5X5wAMLtiA2H/Nkkk0Op64XaGVfpHs+9vk8ALx+OhTh+ThVyAgRCxzdOX5eH+tivEk1ysl6PQb4bbidhxEy7eYU8dBmFNJhFqx9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB763247
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksDQoNClRoaXMgY29udGFpbnMgZmlybXdhcmVzIGZvciBjb3JlIDI0LjkwDQoNClBsZWFzZSBw
dWxsIG9yIGxldCBtZSBrbm93IGlmIHRoZXJlIGFyZSBhbnkgaXNzdWVzLg0KDQpUaGFua3MsDQpN
aXJpDQotLS0NCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2ZDZiZmZiMWQ4
NWExZmUwNzdmMjY4NTNlZGNlNDgyZjZjMTEyZjJiOg0KDQogIE1lcmdlIGJyYW5jaCAnYW1kLXBt
Zi0xYWgtbTgwaC10YScgaW50byAnbWFpbicgKDIwMjYtMTEtMDYgMTc6NTg6NDYgKzAwMDApDQoN
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHA6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaXdsd2lmaS9saW51eC1maXJtd2Fy
ZS5naXQgdGFncy9pd2x3aWZpLWZ3LTIwMjYtMTEtMDgNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDhhNjcyZmY1MjdiYzNiZjdjMzc5N2MzY2NlNTBmZGUxN2I0ZTNjMDA6DQoNCiAg
aXdsd2lmaTogYWRkIEJ6L1NjIEZXIGZvciBjb3JlMjQuOTAtNjAgcmVsZWFzZSAoMjAyNi0xMS0w
OCAxOToyMToxNyArMDIwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KaXdsd2lmaTogcmVsZWFzZSBjb3JlMjQuOTAN
Cg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KTWlyaSBLb3JlbmJsaXQgKDUpOg0KICAgICAgaXdsd2lmaTogQWRkIGNjL1F1
L1F1WiBmaXJtd2FyZXMgZm9yIGNvcmUyNC45MC02MCByZWxlYXNlDQogICAgICBpd2x3aWZpOiB1
cGRhdGUgdHkvU28vTWEgZmlybXdhcmVzIGZvciBjb3JlMjQuOTAtNjAgcmVsZWFzZQ0KICAgICAg
aXdsd2lmaTogQWRkIEhyL0dmIGZpcm13YXJlIGZvciBjb3JlMjQuOTAtNjAgcmVsZWFzZQ0KICAg
ICAgaXdsd2lmaTogQWRkIEJ6L0ZtIGZpcm13YXJlIGZvciBjb3JlMjQuOTAtNjAgcmVsZWFzZQ0K
ICAgICAgaXdsd2lmaTogYWRkIEJ6L1NjIEZXIGZvciBjb3JlMjQuOTAtNjAgcmVsZWFzZQ0KDQog
V0hFTkNFICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDU4ICsrKysr
KysrKysrKysrKysrLS0tLS0tLS0tDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1LWIwLWhyLWIw
LTc3LnVjb2RlICAgIHwgQmluIDE0MDY1NzYgLT4gMTQwNjU3NiBieXRlcw0KIGludGVsL2l3bHdp
ZmkvaXdsd2lmaS1RdS1iMC1qZi1iMC03Ny51Y29kZSAgICB8IEJpbiAxMzIzMjk2IC0+IDEzMjMy
OTYgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXUtYzAtaHItYjAtNzcudWNvZGUgICAg
fCBCaW4gMTQwNjU5MiAtPiAxNDA2NTkyIGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLVF1
LWMwLWpmLWIwLTc3LnVjb2RlICAgIHwgQmluIDEzMjMzMTIgLT4gMTMyMzMxMiBieXRlcw0KIGlu
dGVsL2l3bHdpZmkvaXdsd2lmaS1RdVotYTAtaHItYjAtNzcudWNvZGUgICB8IEJpbiAxNDA2NzIw
IC0+IDE0MDY3MjAgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktUXVaLWEwLWpmLWIwLTc3
LnVjb2RlICAgfCBCaW4gMTMyMzMyMCAtPiAxMzIzMzgwIGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9p
d2x3aWZpLWJ6LWIwLWZtLWMwLWMxMDcudWNvZGUgIHwgQmluIDIxNjM3NTIgLT4gMjE2NDA0MCBi
eXRlcw0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC1nZi1hMC0xMDAudWNvZGUgICB8IEJp
biAxODM3NTg0IC0+IDE4Mzc1NjAgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktYnotYjAt
aHItYjAtMTAwLnVjb2RlICAgfCBCaW4gMTU4NDc2OCAtPiAxNTg0NzY4IGJ5dGVzDQogaW50ZWwv
aXdsd2lmaS9pd2x3aWZpLWJ6LWIwLXdoLWIwLWMxMDkudWNvZGUgIHwgQmluIDAgLT4gMjA0MjI4
NCBieXRlcw0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1jYy1hMC03Ny51Y29kZSAgICAgICAgICB8
IEJpbiAxMzY4MTAwIC0+IDEzNjgxMDAgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktZ2wt
YzAtZm0tYzAtYzEwOS51Y29kZSAgfCBCaW4gMCAtPiAyMDc5OTEyIGJ5dGVzDQogaW50ZWwvaXds
d2lmaS9pd2x3aWZpLW1hLWIwLWdmLWEwLTg5LnVjb2RlICAgIHwgQmluIDE3NTI5NzYgLT4gMTc1
MzA3NiBieXRlcw0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1iMC1nZi1hMC5wbnZtICAgICAg
ICB8IEJpbiA1NTA3MiAtPiA1NTA3MiBieXRlcw0KIGludGVsL2l3bHdpZmkvaXdsd2lmaS1tYS1i
MC1nZjQtYTAtODkudWNvZGUgICB8IEJpbiAxNjA1MDE2IC0+IDE2MDUxMTYgYnl0ZXMNCiBpbnRl
bC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtZ2Y0LWEwLnBudm0gICAgICAgfCBCaW4gMjc4MjAgLT4g
Mjc4MjAgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktbWEtYjAtaHItYjAtODkudWNvZGUg
ICAgfCBCaW4gMTUzOTgzNiAtPiAxNTM5ODM2IGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZp
LXNjLWEwLWZtLWMwLWMxMDkudWNvZGUgIHwgQmluIDAgLT4gMjI0MTcyMCBieXRlcw0KIGludGVs
L2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1nZi1hMC0xMDAudWNvZGUgICB8IEJpbiAxODExNTA4IC0+
IDE4MTE0ODQgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc2MtYTAtd2gtYjAtYzEwOS51
Y29kZSAgfCBCaW4gMCAtPiAyMTQwNzg0IGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNj
Mi1hMC13aC1iMC1jMTA5LnVjb2RlIHwgQmluIDAgLT4gMjI2OTg1NiBieXRlcw0KIGludGVsL2l3
bHdpZmkvaXdsd2lmaS1zby1hMC1nZi1hMC04OS51Y29kZSAgICB8IEJpbiAxNzM3MDEyIC0+IDE3
MzcxMTIgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28tYTAtZ2YtYTAucG52bSAgICAg
ICAgfCBCaW4gNTUxNTIgLT4gNTUxNTIgYnl0ZXMNCiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktc28t
YTAtZ2Y0LWEwLTg5LnVjb2RlICAgfCBCaW4gMTU5MTk4NCAtPiAxNTkyMDg0IGJ5dGVzDQogaW50
ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWdmNC1hMC5wbnZtICAgICAgIHwgQmluIDI3ODYwIC0+
IDI3ODYwIGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXNvLWEwLWhyLWIwLTg5LnVjb2Rl
ICAgIHwgQmluIDE1MjcwMDQgLT4gMTUyNzAwNCBieXRlcw0KIGludGVsL2l3bHdpZmkvaXdsd2lm
aS1zby1hMC1qZi1iMC03Ny51Y29kZSAgICB8IEJpbiAxNDQ2MDM2IC0+IDE0NDczNzIgYnl0ZXMN
CiBpbnRlbC9pd2x3aWZpL2l3bHdpZmktdHktYTAtZ2YtYTAtODkudWNvZGUgICAgfCBCaW4gMTY3
OTA4MCAtPiAxNjc5MTgwIGJ5dGVzDQogaW50ZWwvaXdsd2lmaS9pd2x3aWZpLXR5LWEwLWdmLWEw
LnBudm0gICAgICAgIHwgQmluIDU1MDIwIC0+IDU1MDIwIGJ5dGVzDQogMzAgZmlsZXMgY2hhbmdl
ZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGludGVsL2l3bHdpZmkvaXdsd2lmaS1iei1iMC13aC1iMC1jMTA5LnVjb2RlDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGludGVsL2l3bHdpZmkvaXdsd2lmaS1nbC1jMC1mbS1jMC1jMTA5LnVjb2RlDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC1mbS1jMC1jMTA5
LnVjb2RlDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGludGVsL2l3bHdpZmkvaXdsd2lmaS1zYy1hMC13
aC1iMC1jMTA5LnVjb2RlDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGludGVsL2l3bHdpZmkvaXdsd2lm
aS1zYzItYTAtd2gtYjAtYzEwOS51Y29kZQ0K
