Return-Path: <SRS0=QZyZ=OK=intel.com=cezary.rojewski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7447AC3DA45
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jul 2024 11:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AB64C32782; Wed, 10 Jul 2024 11:09:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7C7BC32781;
	Wed, 10 Jul 2024 11:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7C7BC32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720609772; x=1752145772;
  h=message-id:date:to:cc:from:subject:
   content-transfer-encoding:mime-version;
  bh=siQdTkm5MktqOJK3NQXQTnTcxEVcSqaafgNEYJRTiVU=;
  b=Dz/EHVjyPmnOzMtWh4HCLjYhAAANJty+iRwW2hztpL3SGmguMHPLM5ce
   t9NINsrA9wl+emAhFaUQk4TXZixIkvqgVQfQlofEXfZmA0T5nKLHRG/ns
   y0mMn37yBXQjTF1zaHoDcZMkg3vgOk3dFqwR1iSCghYkXDfavHuKzMtAq
   vxA4gy7yPrBDHs3ZlJyUasZc+IeTWROY/q2dadNMWpFhhTd8vP6SazJTl
   /4RO1KyN4vsfuKYSKUCkLW1RU3eukSe0cgIk5Xn7vryhxyKZmWJpTjn4W
   zQAaZW2MyF9TxV5W0VbMrSFDPIrNDlBcyFqjlAqLRqKcE8vJzIH9sDeuW
   Q==;
X-CSE-ConnectionGUID: 1/kwDaCBSfqX7sMqEIP7Sg==
X-CSE-MsgGUID: X22L8KR1SoW1hJVGfsMPWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18061688"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="18061688"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 04:09:31 -0700
X-CSE-ConnectionGUID: XTf3SzdLRrS98leZd5j4aw==
X-CSE-MsgGUID: NRKzw7I/R52OhT76+n2J5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="52476772"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 04:09:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 04:09:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 04:09:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 04:09:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 04:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGShIRRkk9mJk4TleBnvgLqOeSuqCkEqPWJ06fnJQRr0idzbnMOvF+XDgSxc/FpKVm9n2pPKn9VMW/OoTVvBFDSC7QDnvSedAaWy2ERzNRXK8Lcn/efwwEQIl+LUJnL84y/YztAJbCYEpHC71Ag8jVyzuAuwPs9jXQv/dE7Y+B7HdZQJAdEk8Apzzs6sx+zOWbT7IrnRouSMW/EBVDnWDIJ3A4RH4kJxc3ZP+f9FXA7HCUQbRFYwta6CBvWehhV9jBnK30GWevypvnQKaJWpOQ28IPqjmf5XkV8RXxo837L2Jwii8hW8eRmGdsJNmj62BmEbMfepqXPVTjjebgndlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvphylBDkZghOpJhe36bvr6Quww8DHRdi8hpJGkLhWY=;
 b=Ox0cBUHTqeEAO4o6NTwy8bmMNG6dtk4hiG/9wiRqzpNqkn0sZ7oUCzC1pSB3/NRhA4vZFTXUBNDntYvc171A4cbzE2zqD7zhHB/DWpW2aZweo73kWOilSVHp/UBt5K7qu2t3Nfy7tEr9pFADwI90eFNfdqh0Tx3AaFsdUo80J6yQ4DaUAqfW6LSoAukIjFVLAaLZKkCdCQ1HZz12dYfIY9Rdmfr1RbIQjVczZNgGcdBQ6KSLLuIOTjPJjLCIY7513oP5e77P8ftjFdnDJEYu5+PuUp05yVhK2j9wwv1YTFekVpccprlVHTe4juMr7nopKbfFnD1PvxsR1JTjL5ClcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Wed, 10 Jul 2024 11:09:12 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 11:09:12 +0000
Message-ID: <8da0d0ec-152d-4663-99ab-579badc6e5b4@intel.com>
Date: Wed, 10 Jul 2024 13:09:07 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, <linux-firmware@kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PULL] intel: avs: Add topology files and update AudioDSP firmware
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0025.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 1734a20d-b049-4a17-3106-08dca0d0bab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlF3SWUxR21aYlA0ditJSEpLb2lXUWdlNjdneHNQR0NLOWoyUjVhYUdML1ZK?=
 =?utf-8?B?M2JWcmEvM3VPOEhsbHo1NmloeEZ3S21NMjdjZTZybEtHZzJSS3o2d1pnYU5H?=
 =?utf-8?B?UnJmSHNrbUpSWEwwa2J4RDJxb0FKOW5zcXJnN0ZqT3Qxbk1YbzJTTjl5b0k5?=
 =?utf-8?B?VTFHQUZWSWxEaG9LMi9YWWQzZ3lBYXd3VGgyd3NLMXhwOVhPcjNwOElyL0Er?=
 =?utf-8?B?cEJLK0lyb1NReFVrcWlTR08xSFVxMVdKQXoydmxTbk5Cb0ZHVnZjVnIrdHUw?=
 =?utf-8?B?UDFjcTNOL3dPeGFVUE9NTjZOSHYvb25mZEhGeU9WVGZVdmtLWWJQUlRzVHFS?=
 =?utf-8?B?a3BURFFxNEtJanAzQ1VjMEJjNHBxeW5GWXVxSWEycWpBS2xDdFpWNzhhcFpJ?=
 =?utf-8?B?VTJmb0lZd2hodXE0TWYrZEc3NWNxVVNhbGY5RDVTaTlFWVlLSUh5SHFycXgw?=
 =?utf-8?B?dUlrQ1ZNY2YwMERxVmduOHFzc3JoV0lvL3RNVkxJYnhWaEF0bVNCYXhpeFVG?=
 =?utf-8?B?anJLWklUYThIdmZMdzNoYjY2SndoTWxET29JaWNGeWlQYUtyVDFCZld0SWNU?=
 =?utf-8?B?OTAzR0JtMWRjRUJJSnBxQ0NRWnBpRHFHd21CT2VpbDJjY3dJNUtHVk0xS3RF?=
 =?utf-8?B?OXJZdUN0Z1RlbEh0R2xST0lQQnVjRzIrQitDRHVsbVlhRnNpK3JyQndJWVhQ?=
 =?utf-8?B?V25PVGpCRWp4emdPN0lVMUxiMFRZWGpNL0x4VDRaby9ENHRYTUIxblZJdHkw?=
 =?utf-8?B?MHhIUDFwTjRLUDJCRVpVUWs2NGR4Rk1Rd0tvdG03NUl5SU54Qzk4NFhMWk5a?=
 =?utf-8?B?aDJhcFA5YmgxZ04wWC94Q1hPN3JwbUNRbmhlQWt3SUl3cWdHdzdlM0M3djhR?=
 =?utf-8?B?SXl4MFppeEtpNit4anFqMzhBRVhRL3MrY1ptWmRTZnpUK2I3YzhxQ0I2elBF?=
 =?utf-8?B?VXlrUElmZ3pEY1djSDJKUWZieUQrKy84ajlMamdENk9FZnJlSC9uSUN4dGl2?=
 =?utf-8?B?cGtJdis4YzUvR0xFSTFzMWZCL1hWeXZvRi9IZFY5UWhjY1lXaTliOGt6a3BS?=
 =?utf-8?B?bVhyN0tIUnFzUm5kelVFcnE1ay85VE5SZjVqVnoxZU0rNlhnUURYVjhQUytI?=
 =?utf-8?B?ZU9xRXRqYi9KOVRjVXFEQnlWSWlDc3BvYnpoeFNSYXNOdHJkWmlmZFRFUy8x?=
 =?utf-8?B?cVJtSzJzd2FYT3VUc0JQTS84bVgxampTZk5RaVAyOUJSWGRTcTNJZWZKWEcz?=
 =?utf-8?B?UGJQVnZHVzRHbVFGNmhHUGl1ZjkxRDVjNGpBODZJb291ZlZnM2d0cDFldXA3?=
 =?utf-8?B?K0YwTFl4MlFuUzE1bUxqemtMbXVEM1VvUWhMZEZzY3N5T0RYdkhOTm5ZbDJV?=
 =?utf-8?B?dFRFbyszN0pQdzJ6cnpqbkRRTWpVYVdKMXBzQ0F4U3hSVHk1Zmt3ek9qQ2Vm?=
 =?utf-8?B?dkxRSFZtZFZMTURkWEQxcU9wV1d6ZU1EcWZtTUEzMnNraTdRaXVCbGVCaUc4?=
 =?utf-8?B?elZXTTRPUUpmQ0IydW9WdWZJNU40TlpYL1o5L1pyejZneElwRFZ1Ym5BczMr?=
 =?utf-8?B?d1EwMjN3dnFnVW9tc3dmR3NiYXI0ZGFyQ2Y1UXAzQ0x5MC8zUk5maDBQSTVl?=
 =?utf-8?B?NXhiSWRiWFdZK0ZKbDZaY2lkUlpXUXcwS3RGNkhMd1BidmpjRHdJSGIxUmpT?=
 =?utf-8?B?Zk00NVZheE9DMXljaVg0M1Q4TU5FQ0FmdDRIMFdiMEE4VTJKb2dQNXZRZ1lY?=
 =?utf-8?Q?tptvOCRpxIOPOIoBxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi9Fb0RFb2pQbFFRUitvNldOQ2tabnNpaDJ0KzZRY3M3L0F5bFBKWXRjb1kr?=
 =?utf-8?B?bGkrdUFFZ2p1a0F3bmVxTTN2b3BWdkxPMjdlZEJMVktuNVozWlZhZHk5YjZp?=
 =?utf-8?B?cG92T0lpYVNmdHowVjBscFJ2N1UybkR2YXZEU2VhOUkxYzViUlplbTRyeE5U?=
 =?utf-8?B?NmJVdFZFcWI4MCtBZVRPSVhxY3Rnd3pqUzBTQUsrNC9NajNlUVBJZ0wzbk5a?=
 =?utf-8?B?Z0ZTdjJEVER4cFRoakRnZm95L1psRjZsa214M1l0ZFhXR20zaE5sODJhWmR4?=
 =?utf-8?B?YUVFN2dmMGljalBsVWVpaytYTWJyTmk1SitRM3VaelE0TmlIR1hCOHVUeFds?=
 =?utf-8?B?T2NHVGFZaEhCbktiR3hEaFFXUDhrZFdXOGNFT2V5WjJRZlJCMC9KYjJtQXIv?=
 =?utf-8?B?MXdDUXZxWmhYcnA2d082cUw1WGYreFdUMHVUa0p5MmxtUlJkRVR6cU1pU3pU?=
 =?utf-8?B?dVBjTzE3Sk00L2l6UGIvclJRamY2TnB4RWVNQ2J2YWFNVDFEU3NDTmZQblJX?=
 =?utf-8?B?ZVA3OVlkSDFiVmtpWmhGc1FZS0xScGxzdjFCeHYyK0RtMkVDU2xIamxsdXlG?=
 =?utf-8?B?RncyY21yZU9DYUs4QytGb2tyakd2WERJSmlHQVBKYk1DbzNCMXZGSlc0enBm?=
 =?utf-8?B?YmRYM3ZuMXd3TEN2YnBxckU0ckFmaHkxeWFXTVkzNjdSZTFPL2FsNS9xMGRX?=
 =?utf-8?B?UStqellVbURRTXVvaFk0cmxUWk5TN2liaVJyYlMvQ2FMZ0NxaHRNdVJPMWhC?=
 =?utf-8?B?Uk4xUnhSRjJRU25Nc1JxMGtNNjZVNTNMakprV1ZxRStMTWRjekJNdHVxR3Ft?=
 =?utf-8?B?UlF0UnNST3RXUDJ4R1FyNUFvZXowSlZJZ1lXZzJLS3M0RS9IZUsxQU1tZkdN?=
 =?utf-8?B?YytXK3FBa0VvWjJGaFhOMGZDdFdyc3JQZml4Ym9xZHllZXFoVzVYY3RLRnJQ?=
 =?utf-8?B?ZjJUUlc0bFhmWW5kZ0NIL0daYmhaT2hnQVNjaW4ySGg1U0xSeWVCcm1PV3lN?=
 =?utf-8?B?anZzM2UyeE5EejIzK2VwdjJ2aWE3Ujc4Nmp0aVU3VWRxL25NYlNuKzRCUzJk?=
 =?utf-8?B?eVRtMDM0bVpkQVVXNGdZMDE4ZnUrOEpLczZQL0tvYlFJSmFMMDR5TStaYWI5?=
 =?utf-8?B?cTRRcHhLUVROVzdLT0ExNVcxbWo5UzQyUUZ4WktjVXA1SlIxVnVmU2RoZDFN?=
 =?utf-8?B?cC9aVE1adlVDUXIzTkFFdGNleUI3QWxYSjUxZW0zNng2eDJaY1RpaVJpYjc3?=
 =?utf-8?B?ak9ScngzS1AyUUo4S2ZOaC9ZOWF2Sll6Tk5LZittbkFPV0JZTExGd3V6eXUy?=
 =?utf-8?B?YjlxV2tydm5BR0xzTkwwbHk4OHRkR3gwY3pEbUFuZGg2UDVGMEd4UHVjK2d1?=
 =?utf-8?B?QnVja1UxRjVtNEZaVTlKUExqbmFhSVdmV3hnY0tSOGtaTWtwbVphQkJwM2tR?=
 =?utf-8?B?TUw3dDQrWGN1empaQTk3S2NqYW5xdzdGVDhjbzdjSjV2V2lZRm8rV3hna3Zk?=
 =?utf-8?B?MXg5dFJudytTc0xqbjNWMFZCVUg5LzNuSnlaeDdDR2tIMG5Lc01ldEhCajhI?=
 =?utf-8?B?a1oxSzE5NjhMWDM2djJ1UTkySWpPY2dTRnNUekFBcVJzbW5jdXJQc3hEZTNu?=
 =?utf-8?B?c2YvR1VMQWFCTkdZeHg4eU5hWXpLSkk1TTFPU0tCRDVJNDZLMWQvai95bFY1?=
 =?utf-8?B?SXlsMHdLWVAxbStDZnBaOUE1djI2REZIMlJwOXJPM0VsSXMrd2dVSHNuM0pa?=
 =?utf-8?B?VWVGaFJLMmxJRGRwOWFJVjRjcXVWdnA0ZGgvaVRZVitPeHJjang5Zm12ZUFk?=
 =?utf-8?B?OWt5cXBkZm9PRVZ2M2dKc0RXbWhobDI2dHc2eHJmL2U0Vno1NTYxWkZvVEpQ?=
 =?utf-8?B?TktLNHM3Y2ZYS2ppajdZeE5XRlVKZHlKT1I3VlRSNlpHQlM2S1R5eEFGem5y?=
 =?utf-8?B?Wm1nbVlhT3R2SjBkRzV3TnlDbElNbVdJdUVTTlU0aS9RQ3dFRGFwbVVzWi9Q?=
 =?utf-8?B?a3FYTjI1NmpGUVlqUjVUaEFIQ3FpdUM2NVJoV2RvbnE4QlNuVkJSeThEWVJa?=
 =?utf-8?B?ZktqTnZhZnBVcEtOMVlKZXRNOGhCVlVrajBLczAwTWhNWHp6UTJtdWVzMHN1?=
 =?utf-8?B?VFF4OW9CeGZMOGtXcWJmd3gzMDZielBlVkhrOUVZUlJDcDRCeVBLemxQNVp4?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1734a20d-b049-4a17-3106-08dca0d0bab2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 11:09:12.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+iEAtEJDpEgIsUJpMStXix8yaeAMERssLR/fPiw06YtZSIT9KFGIz0adbFKwG+ims6rWscvCwx0z2VZI6rQPB2ZT/98jCjLv07kMYphlGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
X-OriginatorOrg: intel.com

The patchset starts off with updating AudioDSP base firmware for 
APL-base platforms.

Follow up is addition of a copy of Apache-2.0 license for descriptions 
in WHENCE to reference.

The rest is composed of the topology files utilized by the Linux kernel 
avs-driver. These are licensed under Apache-2.0 [1], just like the tools 
[2] that are used to translate their source XML version into a 
kernel-friendly binary format. Each patch carries a link and a commit 
identifier to the source given binary has been made from.

[1]: https://github.com/thesofproject/avs-topology-xml
[2]: https://github.com/thesofproject/avsdk

---
The following changes since commit e94a2a3bc8bdfc6a4a7b05eed7803b64a409c9f5:

   Merge branch 'add_intel_ish' into 'main' (2024-07-03 05:34:26 +0000)

are available in the Git repository at:

   git@github.com:crojewsk-intel/linux-firmware.git for-upstream

for you to fetch changes up to 5bdbfe469f340279211d17cb62bfcea47c15a8cd:

   intel: avs: Add topology file for I2S Analog Devices 4567 (2024-07-10 
12:19:02 +0200)

----------------------------------------------------------------
Cezary Rojewski (17):
       intel: avs: Update AudioDSP base firmware for APL-based platforms
       Add a copy of Apache-2.0
       intel: avs: Add topology file for HDAudio codecs
       intel: avs: Add topology file for HDMI codecs
       intel: avs: Add topology file for Digital Microphone Array
       intel: avs: Add topology file for I2S Realtek 274
       intel: avs: Add topology file for I2S Realtek 286
       intel: avs: Add topology file for I2S Realtek 298
       intel: avs: Add topology file for I2S Realtek 5514
       intel: avs: Add topology file for I2S Realtek 5640
       intel: avs: Add topology file for I2S Realtek 5663
       intel: avs: Add topology file for I2S Dialog 7219
       intel: avs: Add topology file for I2S Maxim 98357a
       intel: avs: Add topology file for I2S Maxim 98373
       intel: avs: Add topology file for I2S Maxim 98927
       intel: avs: Add topology file for I2S Nuvoton 8825
       intel: avs: Add topology file for I2S Analog Devices 4567

  Apache-2                            | 202 
++++++++++++++++++++++++++++++++++++
  WHENCE                              |  22 +++-
  intel/avs/apl/dsp_basefw.bin        | Bin 505632 -> 505632 bytes
  intel/avs/da7219-tplg.bin           | Bin 0 -> 4576 bytes
  intel/avs/dmic-tplg.bin             | Bin 0 -> 9064 bytes
  intel/avs/hda-808628xx-3ep-tplg.bin | Bin 0 -> 7264 bytes
  intel/avs/hda-generic-1ep-tplg.bin  | Bin 0 -> 7372 bytes
  intel/avs/max98357a-tplg.bin        | Bin 0 -> 3228 bytes
  intel/avs/max98373-tplg.bin         | Bin 0 -> 3748 bytes
  intel/avs/max98927-tplg.bin         | Bin 0 -> 3748 bytes
  intel/avs/nau8825-tplg.bin          | Bin 0 -> 4576 bytes
  intel/avs/rt274-tplg.bin            | Bin 0 -> 4976 bytes
  intel/avs/rt286-tplg.bin            | Bin 0 -> 4976 bytes
  intel/avs/rt298-tplg.bin            | Bin 0 -> 4976 bytes
  intel/avs/rt5514-tplg.bin           | Bin 0 -> 3144 bytes
  intel/avs/rt5640-tplg.bin           | Bin 0 -> 5652 bytes
  intel/avs/rt5663-tplg.bin           | Bin 0 -> 4576 bytes
  intel/avs/ssm4567-tplg.bin          | Bin 0 -> 3740 bytes
  18 files changed, 223 insertions(+), 1 deletion(-)
  create mode 100644 Apache-2
  create mode 100644 intel/avs/da7219-tplg.bin
  create mode 100644 intel/avs/dmic-tplg.bin
  create mode 100644 intel/avs/hda-808628xx-3ep-tplg.bin
  create mode 100644 intel/avs/hda-generic-1ep-tplg.bin
  create mode 100644 intel/avs/max98357a-tplg.bin
  create mode 100644 intel/avs/max98373-tplg.bin
  create mode 100644 intel/avs/max98927-tplg.bin
  create mode 100644 intel/avs/nau8825-tplg.bin
  create mode 100644 intel/avs/rt274-tplg.bin
  create mode 100644 intel/avs/rt286-tplg.bin
  create mode 100644 intel/avs/rt298-tplg.bin
  create mode 100644 intel/avs/rt5514-tplg.bin
  create mode 100644 intel/avs/rt5640-tplg.bin
  create mode 100644 intel/avs/rt5663-tplg.bin
  create mode 100644 intel/avs/ssm4567-tplg.bin
