Return-Path: <SRS0=Gxs6=XA=intel.com=lixu.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29052C369B2
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Apr 2025 08:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3452C4CEEA; Mon, 14 Apr 2025 08:18:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEF61C4CEE2
	for <linux-firmware@kernel.org>; Mon, 14 Apr 2025 08:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEF61C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744618687; x=1776154687;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bdE13WQJhn2XLCYKDFCATlOMt/FUbNMIozD3dWFr85Q=;
  b=YrvqL9FOPkek6G2ykEJ31T1C5qapjpVH1dsqabEWNcz2ZkAX3ZCdTlFw
   Nq2rOmvauYnE1iw1dIWyfjMqJwFloSQM5jlhxnf+8xyiuvEFS+qli8oKq
   OpyiTGsCkhUvSGXoh0WB9M5Dk99Y6BXk7WZM8N68Pu4Hvv1XnlX5D9uIi
   4LO1gOUqFuWyhCu5yenNMGQPWB+S5jqBHK3TMrNPss4B0GfxAJNE226pW
   totO1rEetg07AtfY+3mXFJN/lrnSzTesl/Zl1L0hieGX9sUCoOiAewDt+
   tT/cWLJq8w8znYvydb/Vg37xGrXEyacCbU3fnn5iksfi+lwbQWpwDYbMN
   g==;
X-CSE-ConnectionGUID: B6+P9o+cTQufWLtBbTvDfg==
X-CSE-MsgGUID: nopPRLX7Q/OOVlKE8ZTTNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57063931"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57063931"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:18:05 -0700
X-CSE-ConnectionGUID: 6UL7sjuTSn6JOtBr3hsckw==
X-CSE-MsgGUID: 5vELsNo7RnOGPJHEu7BiWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134724360"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:18:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 01:18:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 01:18:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 01:18:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHGig8S19lLqa+VZM/Wyu9mNVF0bi2yz6koduy1qroIRO6jRUse0crXZhRPt6Acu5v+xbZOwgbw8uhf8pe1mA49qIuetWWQ3WajiItXuKh0YXqFKGetzOXWztecrxfkiKWT0CxWJ9uPgBxvnSGGAaci7Bo7BT/48KtYr1FTdxBLKLbUZskjVggimKtrPXz/o0scCj27SCZbqkX03ug6N44rmvnTqLkoa+Q9Uhnk4MM7mPbAhSlwdEI4UEWWpjgNJuNn5sjtWCA85L1ucbKQyYpxqKaii02iqiMuHG4KWeCMu6Re6X/b+Z+aW/Pt0O1X0VzH6fWyUS3F5IE/RZRHrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdE13WQJhn2XLCYKDFCATlOMt/FUbNMIozD3dWFr85Q=;
 b=NCfNnCx5q9sr9PMINcD+KzKX1R2WIHlRZIZTfPZIab9b86STIi/qlM/7W0Tat9g0PA7xq83tRAOEFBopSq8smPnSRQQ50pvWJgt2xGBzIaHQdD8A/a3o7ITOeM7wHQtTGEXiISwVwJb5fX25Eibuf1tfLDlQSBPPFKOsF0LYXm8kaXbYcNUi/PNP2rbIjC18T01ykz+kv/0ivrLKAsyWOFKWSxSyto5IDwO6Mx0Wl0T8eOw0aLgE7uNqlrrHoIGO5CBRzyGShtrjVYaPnrwxUOZIOEV3kYxMnINgo2iHtDDC0NoF14RS8Ec43hS2z9GeNNklSr/luQcXaGkgW0t3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.33; Mon, 14 Apr 2025 08:17:29 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:17:29 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Hutchings, Ben" <ben@decadent.org.uk>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "Wang, Selina" <selina.wang@intel.com>, "Wang, Zhifeng"
	<zhifeng.wang@intel.com>, "Han, Hemin" <hemin.han@intel.com>, "Yue, Ling"
	<ling.yue@intel.com>, "Ma, Michael" <michael.ma@intel.com>
Subject: RE: ish firmware is undistributable
Thread-Topic: ish firmware is undistributable
Thread-Index: AQHbrI1GE6yS1GTQh0WkE1KZ85IPx7OiZp7A
Date: Mon, 14 Apr 2025 08:17:29 +0000
Message-ID: <DM4PR11MB59958EB64E425A736D342CA193B32@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <91d589d2c91c4c32406d27ad280a5187ca773a8c.camel@decadent.org.uk>
In-Reply-To: <91d589d2c91c4c32406d27ad280a5187ca773a8c.camel@decadent.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|DM4PR11MB6360:EE_
x-ms-office365-filtering-correlation-id: 1be6271b-331e-4fd9-d385-08dd7b2ccc44
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?alcvbmNyOWJXZlE2bEJtVnBBcTc1blJpcFNzY3RwTVN2ZXpwS1luVkdnQlF2?=
 =?utf-8?B?a2FMODN3dkJLcUthQjJkWE43cDBDWEdZTXR3empCZlc3S0hvcTRqekpUcVFo?=
 =?utf-8?B?MmNtWXpMZFFwcUViUitYU3R2U2loZGxJbDMxWi9Cbm1nRHR0bDNuNStkajVK?=
 =?utf-8?B?QnFKL05TMFlDb1M2WHV0SFpUdUkvLzdxQ0pqMDExWno5clZXTy9PdjFTZzBa?=
 =?utf-8?B?QnV5czQ0dDBJcXpsN0hwRVIzVFRCaHd6V0lyUm1vd2ZzL0g1NEo0Y2JVRTgy?=
 =?utf-8?B?eUc4R0VLTzJOWmM3bE5DQUhGb1o2dnp1dE5MT2hLOERyM2ZqRDFkQWZITEVw?=
 =?utf-8?B?Z1F6U1NtQVVQQzN1RTVZYnBJbS9keXRKU3d0empheUZ6cjRyWmJITm5YM0tO?=
 =?utf-8?B?TVZ2dHl5R0Vud00yNjdlYWVuclR3TCsrNzN4cS9kWkFoKzBnVlMzbW1mZ0Jr?=
 =?utf-8?B?bW9GcHRRSDNjTHZvYVVRZElTSzBFNWJsV1pqYTllR3lyQlR5M01wa3JqNHVs?=
 =?utf-8?B?cmxiN0FjZ0s4MFZyMnB6S2tVQTVMR2dtK1dTYVhBR1hFbE1sMWNvUm9EaVZh?=
 =?utf-8?B?dGNvaE83bEV5VnJjQlRvdXd0Sk8vcTlxTHFBSkdNNG4vWlM4cHVYZ3hJNytZ?=
 =?utf-8?B?YXlIMWZ2a0cyVWZjUzJsQVorazA1bWM4SVFYZHpIRWNnVzJmcUZ0ak1SMytV?=
 =?utf-8?B?MnUzSzg1Z2N2MDdmNDdUOEZJdUg5U3pEUGlCN1JFaWZRWkRrN0lrdGM5MUVY?=
 =?utf-8?B?SDNiVlpGQ0Zud1hlQ29zZkpiS1UwaTdFamJzTUhTUWZnd3dEOTcxVUxiUklE?=
 =?utf-8?B?Tzg3bVJZL3FXN21sNjFJWVN2bjZRL1UzNzN6MWdwYTBsa3ozcDB3VDYzdXpC?=
 =?utf-8?B?cllqRXZUeEx0Qnc4dnJMQU5mR2dPNXpoeEtWWnFMUDRERWJKYnVNK2F5Nzcy?=
 =?utf-8?B?RjJtM2t2c3V6TFJKalQ4dHN2MzhDNnIrQzlvaWM2Sys1a3c5YUMyN3hYNHBr?=
 =?utf-8?B?R1psMit6OVQwTVlRclNRTUx0VXQ0QTVpd0NLcjNYc3UvZkx3Yzl3QnFyeURU?=
 =?utf-8?B?dVB4cC9JWlVUOGxoM2E3MnlyVmJWVy9kQ1ZEQ0ZkVlZqallEaDUrZU5oNERN?=
 =?utf-8?B?c2dQZWt4bUVBck1lekRlenozNyszbmtMQXdVQ0xYYWdiMTIwMEV2L25hSE5S?=
 =?utf-8?B?aDc5VGRjU3NwcktVREJLYlRzZkNmL0VwTjZSSWlIYjNOWmxML256eTRtRkI4?=
 =?utf-8?B?TGZyM0x1YjBTVGl2MGdSb1luNGdDek8wZFdjcWhEZmIrcm1ybFJzYUhTbEJZ?=
 =?utf-8?B?YWZrTWZVUGZrSSttQmsrcTkrVHZHRmJxR1NYSjBMSW95bnlqMFAzQmhtdG5h?=
 =?utf-8?B?SWlvUG5vNjcxN2tIdDJmdG15czhkUnllWk8zcnNYQ0ZnSHM4TlYwQnFFNkZU?=
 =?utf-8?B?d2svaDdQNHViUnlVeStHUVlCdlNFL1R6c3kyU0kybW9TV1dMb3NOWi9QMGhh?=
 =?utf-8?B?cHoxbUZta0N5Nm5RMFVrNTdVUmtkUWRqOFhFRzQ2Zi9Kb1kxbmVmSXV4OFFZ?=
 =?utf-8?B?SDJtRnFsOUg0bnNQV2RadFZUemR4T2w5L2N5Vkl0a0hQRllIMGxQY0k3SThI?=
 =?utf-8?B?UkFrVWlpWkNwNzNzRWg1RmNjYkNPNzZ1T3llSGFVUnpJSXdhSFlwTVdnV2Ji?=
 =?utf-8?B?L0x4V1JWOFd2YnJsS0JvL1k0U0VyYzkzRitCaWxVamh6SnB3eFkrYnlRR1Uz?=
 =?utf-8?B?N0ZjMXhFSmUxZC95eEM2ZnlucmtRcW5DYzRMb0VLaHcvNndFUVg4N0M3djZx?=
 =?utf-8?B?NEM3dXRSVFpUVXdOUUpNa2RPQ0RiZTdpb0ZBV2lVbmtOQTMrUjg2MzFsY0Nz?=
 =?utf-8?B?N2RMVWJuK00xckUyZURtdUo0dGwzNzVTbDFOZW03bC9jaGxyalNQK2ZnaXpB?=
 =?utf-8?B?ZEN2OFhNSWFZR0NGcWhwSmJLVE5WTW9MRVpUeWdaZ2RrWVpldEVMN093ZUVy?=
 =?utf-8?Q?3VmojInxbX5qUnoRnlc2Z3/kNzvnLo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3pvUEx3MUZpK0Y2Q3FDUmtTN3h2dzFDT0x4a1g4ZmNGcjY2Yjh4a3BtbW9h?=
 =?utf-8?B?SXQ3bXJnYUprelhzZ1c5WUp1OEpvMXZVUXJYd2tjaGVBVXpCSG84elhPZnFx?=
 =?utf-8?B?MllEVnpNamQyMDk1Ni9VdjB5RytrQWRrY1lqLy94ZWhjMTFDM1BrQmRBdnZv?=
 =?utf-8?B?OElzb055TGh6U1dNaUJEOU1hdjJJWTQrNC9YZllwZ2xMKzhCSGxicmN0aHlz?=
 =?utf-8?B?NFNwZWNFNDVQa24yUWI1bS8xQXFpVHZYN3hBZmVoTkNlY1Qvckg5VHZpZGN4?=
 =?utf-8?B?a3ZJOHI1SGVqUURVVkx3RWdKZzRkRHFRNHFqTmUzRmE1OFc5V0xUWElodnRF?=
 =?utf-8?B?K3NabWdaWXNCeEJvM2V1Z1Z2T1JKelBobHJHV3pQMitUaTd4VnJPYVNnWFZE?=
 =?utf-8?B?WEp4OUJveVpJalJ6NU5sREwxeWt1bU8rVXNLdmU0RDRMa01LSjAwcXVDSC9Y?=
 =?utf-8?B?SWNqdnRwbUhrYnZkem0yckNtcW5scC9iakR3c1BJVW8zc21VT1YreWNiUTdY?=
 =?utf-8?B?dDJZNlp5ZTJzSklCSkNObzdrNDA1YXJ4TWxGbmF4dWxVWTJFT2VuUXB1RGRI?=
 =?utf-8?B?OXFMcjdPSmlheE1IeGpKMVNCM0VUbTRZbWhHUzNGNndZNTZncE43bklveVUw?=
 =?utf-8?B?dnl3R3M1K1haZys4dDBXczB0STFqRGFHRU1QSWpvekd4TGluRi9kUEJGMS8v?=
 =?utf-8?B?NjFnOEtaOElwRnFDUVh1Vlg4cWZlZ0JSYm5kK1ZBdG10WGJUdE54K2wrSGlZ?=
 =?utf-8?B?bmpNTmlTemtQM2tEbkRBQTlWUGdOVDFtY1FnVUR6NFZkRE00U2ZJSmVOMlVp?=
 =?utf-8?B?MmZOQjYyRVc1Q0F5VW05a3ZOZURRUFNYRkI1cHpIRUU1WUE1YkxFVlhJWmRo?=
 =?utf-8?B?NXNLNEtEbUlwSy9SdCtnYm03Z3RvSEFrZVF5ZTlxTk16WUxnSGVjdkI3dE5G?=
 =?utf-8?B?ZXVWRkJqMnlrdEhJbUZyQjE0c1lkcnRyejhrMzNtSWtpa0lvMjJOcmYwVDAw?=
 =?utf-8?B?YU56b1hCRjRYVkcvaitZdG92QmVwNXdCZ3JuWkdXeUE1WjdIdUY2WE84eHlt?=
 =?utf-8?B?SE80NXdoeDN0aUgxd1BSaE4vQzFsVmc0cDJwRlZxWXNyamM4bGM0Q1RhVTRX?=
 =?utf-8?B?ZTVoNWI3UmNFNjR6OGhObjQzOWZjbkdFZjBrTkJjZjVpcjFkZWtnRkp4RXhY?=
 =?utf-8?B?NXdXUjdVS0JFMGVOTVVtV2dFaU9HWm5zVEE1eFdJZWNFdm5mM3IzR1A3OGIz?=
 =?utf-8?B?Rjd5UTZEMHZvdmJhc2JJRWVSSkF0cGNDTXBlYlhqYm9NcmhwWUlKeVg5cHBY?=
 =?utf-8?B?MjNnWUc0NnI1Zm5WVUF6WnBzam1NTVNaUWhjZVlrb1MvaktVUzhEd2xIaEZy?=
 =?utf-8?B?WGV1RnBlYVZxaDRnbVlOaTBpYWVZU0M3Z2xXanAyWTZEZnlYdytkWTR4RUk2?=
 =?utf-8?B?RGtzL05pUmJ3MWJydytpVDV5YjJVTmtPWTlSQjZXYXhhZFJNZGZzbnhWdnFs?=
 =?utf-8?B?aDBzbHpjQVFBSnFoa0h5QlE2dWwyYkU5V3orSjlxVXE3ckhiNFhCa2VhR1dC?=
 =?utf-8?B?WEZDQ0NsMVJCcWJGdDh3bzZCMVFjZ053cjlLa2VxUUN5Z0M2bXZnc1ZyN2Jn?=
 =?utf-8?B?Q1JBME9xYUkzL0lRVzdGSEZnWk4valZFN2tuU1EvN3piUk1Rck1aN0NlV0U1?=
 =?utf-8?B?eitIc3I0ZWpxbnc1c2FTYnR6Tmh0ZkNhRVl1MzBPMmd3NEh0RnpsVTM5S3Uv?=
 =?utf-8?B?VldwNk1tOHphbFVvZU1lcyswWEFycDl2QTN3eGhwdVZuenVhbXI3dGxrdzdk?=
 =?utf-8?B?bEtjdEU4OWhxRm1NRm54QlhyM3lKdlVOVmZXcEwvanJ0cG1CYnhQejExTGdQ?=
 =?utf-8?B?dCtvTTNkTlhDUGJFMVFUV1hDNWtJWFFzZjNaT3Yxd0YvS0JsVUhDRUF4Vk1O?=
 =?utf-8?B?eDJEd2p4bXZsdTFjZDNMYk5oSUU1OXNiQkxRNmRVUGdVY21FTFUycTR2d2F5?=
 =?utf-8?B?UmpDcWZrS2RGUGIxeWFxVEluTk14aXlmajJVYWt6bENEa1VXRDRGeEFueC90?=
 =?utf-8?B?RFlmbHVKcWZRZjlpOGpOMjNmZ0RGU0puSEswOFVtVFVLSkIxdjJ6TzNieXdl?=
 =?utf-8?Q?XEbu9UMVzGml+XwgZBbA30jjp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be6271b-331e-4fd9-d385-08dd7b2ccc44
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 08:17:29.2183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8NJrGsBB4NVEgCHMyQxKPD2q4Ls+r//R2tFaYrssTgq0TbEwT71b/Fsf2Si5CYwm/I/XXArVTluMYw8twuqoXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
X-OriginatorOrg: intel.com

SGkgQmVuLA0KDQpJIGFwb2xvZ2l6ZSBmb3IgYW55IGluY29udmVuaWVuY2UgY2F1c2VkLg0KSSB3
aWxsIGltbWVkaWF0ZWx5IHJlYWNoIG91dCB0byB0aGUgcmVsZXZhbnQgZGVwYXJ0bWVudCB3aXRo
aW4gb3VyIGNvbXBhbnkgdG8gYWRkcmVzcyBhbmQgZml4IHRoZSBsaWNlbnNlIGlzc3VlIGFzIHNv
b24gYXMgcG9zc2libGUuDQpUaGFuayB5b3UgZm9yIGJyaW5naW5nIHRoaXMgdG8gb3VyIGF0dGVu
dGlvbi4NCg0KVGhhbmtzLA0KTGl4dQ0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5G
cm9tOiBCZW4gSHV0Y2hpbmdzIDxiZW5AZGVjYWRlbnQub3JnLnVrPg0KPlNlbnQ6IE1vbmRheSwg
QXByaWwgMTQsIDIwMjUgMTI6MDAgQU0NCj5UbzogWmhhbmcsIExpeHUgPGxpeHUuemhhbmdAaW50
ZWwuY29tPjsgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw0KPlN1YmplY3Q6IGlzaCBmaXJtd2Fy
ZSBpcyB1bmRpc3RyaWJ1dGFibGUNCj4NCj5IaSBhbGwsDQo+DQo+SXQgc2VlbXMgbGlrZSBuby1v
bmUgYWN0dWFsbHkgcmVhZCBMSUNFTkNFLmlzaCwgYmVjYXVzZSBpdCBzYXlzOg0KPg0KPj4gMyBD
T05GSURFTlRJQUxJVFkuIFRoZSB0ZXJtcyBvZiB0aGlzIEFncmVlbWVudCBhbmQgdGhlIE1hdGVy
aWFsIGFyZQ0KPj4gSW50ZWwgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGFuZCBzdWJqZWN0IHRv
IHlvdXIgdmFsaWQgY29ycG9yYXRlDQo+PiBub24tZGlzY2xvc3VyZSBhZ3JlZW1lbnQgd2l0aCBJ
bnRlbCAoQ05EQSkuDQo+PiBFeGNlcHQgYXMgYXV0aG9yaXplZCBpbiBTZWN0aW9uIDIuMSwgeW91
IG11c3Qgbm90IGRpc2Nsb3NlIHRoaXMNCj4+IGluZm9ybWF0aW9uIHRvIGFueW9uZSwgaW5jbHVk
aW5nIHRoZSBVLlMuIGdvdmVybm1lbnQuIFRoaXMgQWdyZWVtZW50DQo+PiB3aWxsIG5vdCBiZWNv
bWUgZWZmZWN0aXZlLCBvciB3aWxsIGF1dG9tYXRpY2FsbHkgdGVybWluYXRlLCBpbiB0aGUNCj4+
IGFic2VuY2Ugb2YgYSBDTkRBLiBUaGlzIEFncmVlbWVudCB3aWxsIHRha2UgcHJlY2VkZW5jZSBp
biB0aGUgZXZlbnQgb2YNCj4+IGEgY29uZmxpY3Qgd2l0aCB0aGUgQ05EQS4NCj4NCj5TbyBub3Qg
b25seSBzaG91bGQgdGhlIGZpcm13YXJlIG5vdCBoYXZlIGJlZW4gc2VudCB0byBsaW51eC1maXJt
d2FyZSB1bmRlciB0aGlzDQo+bGljZW5jZSwgYnV0IHRoZSBsaWNlbmNlIHRleHQgaXRzZWxmIHNo
b3VsZCBub3QgaGF2ZSBiZWVuIHNlbnQgZWl0aGVyLg0KPg0KPlBsZWFzZSBlaXRoZXIgZml4IHRo
ZSBsaWNlbmNlIHRlcm1zIG9yIHJlbW92ZSB0aGlzIGZpcm13YXJlLg0KPg0KPkJlbi4NCj4NCj4t
LQ0KPkJlbiBIdXRjaGluZ3MNCj5PbmNlIGEgam9iIGlzIGZvdWxlZCB1cCwgYW55dGhpbmcgZG9u
ZSB0byBpbXByb3ZlIGl0IG1ha2VzIGl0IHdvcnNlLg0K
