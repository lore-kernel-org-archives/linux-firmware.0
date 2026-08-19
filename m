Return-Path: <SRS0=cBgR=GM=intel.com=cezary.rojewski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11239C5DF81
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Aug 2026 14:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1CEC1F00A3A; Wed, 19 Aug 2026 14:52:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=fail;
	t=1787151156;
	b=a6cCnHaDHT/+bdOtF2VwNdZarJCCI6mk+h8vwzEacOTSXuM3l2JNzmXb858q9/xPHcs1
	 2KP8+53X7AJGXqWLl9nAHtxFc/wkkGTZteuVH+CQ1JE7BPQDzeSDUy4y9dqjSvcJMOutn
	 /5fKQPh2JblqlGOqtchQgWC+NUjhmnYC+v28WJifyxWDz5EK+sw+u86eKfGiFqh4lUZbS
	 WtrpgTIZ8ZZevChWi/fWssUda+wRG57JVJ9EgywPVEed0qyZYWIXowMcgwN0IMZotPX4J
	 7rN/j5ngXeB22iFqwdco9hlNqC+lOAg1YzOKaMLO4vT+0CqwB66/GF/kp/pHUcha36Q==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787151156;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:
	 Content-Language:List-Id:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=h/jgU4ly0eiZT9ZbFcvNjXzYC32jRRFfYVOLQ/vhTI8=;
	b=LEWLpgEU6U8Gaw0N1LpxdAolXvDLInL3nTJikaMVc8RcJ3V2O4weRNNlk2WxiFaj9iL7
	 Yw3OHQl5Bmfs9xFmpCP7ZjojSFl47MS6X3kQWSJDuJJb2DudvYDKjwS7WvMe6dRkGJMTC
	 FEZPKqQ5gkMXPKbjYs0z3PiLW5SYMUPsLAk4CjJuQzvY9qTr1NPjIdwXjpun1G+yz9Wu0
	 s9G/chuWjo13nxV1JGoyWdNV+PPZOu5fzwoJL0XzpjWUR7wUztRdm9GWXLH3rTLkBmaDP
	 wrRKifXXsL0ieffhZQdqBevqMKlq7kW9uO1IciZ7wA6eyqInynkhEfbWUAm3NdBLPMA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3GPmK7C;
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=fail smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 007F31F00A3D
	for <linux-firmware@kernel.org>; Wed, 19 Aug 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3GPmK7C
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 007F31F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787151154; x=1818687154;
  h=message-id:date:to:from:subject:
   content-transfer-encoding:mime-version;
  bh=4sq71Cl/FyKp5JvuS24d/0z9QnNULodOjHF6mIkFfqg=;
  b=a3GPmK7CMli8QGNOdz00sgrbCQ9jahaxF07dtOmDJlq6JS9ZxokQxiXI
   CtCVgMZfaTLa7CNhxufSg0erGrMKSmpPmU+oo8WXIovpgZyNr3j49vwPg
   RzDS0GUGtVSDdg2kLuYkmWn5mwVZi2QlKPEjOO5g79a16Yo/8BJZnv10p
   FyBF9+EErv6yAehuprO5VBXFi/LfNNlFSGd3cLMqxqGbzCd9u/ih0NPjy
   a5/NvCNaukS/GWc9Z+VwhKyxSKlk5Nn0V/T5vgbJCWSppejKgFew7sIAT
   tXehbHOsMlUMUTKt+Lxa23Fw3Imy3UPEMUCe/91TlOGVYKhEepjJDkZji
   A==;
X-CSE-ConnectionGUID: MKG47Rg+QmWKn204D/mY5A==
X-CSE-MsgGUID: wswV3vSBSO+H5rSAyLW6WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="91349246"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="91349246"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 07:52:34 -0700
X-CSE-ConnectionGUID: LOVW18tdSHuWGT4wBAVwCA==
X-CSE-MsgGUID: p67yNK/zQaaHjjGVvzsjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="290376325"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 07:52:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 07:52:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 07:52:32 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 07:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLlNf+J6o4cqsQHnpDUa3FSln8wtYbIX6B0A+sDKVUZ9Tmz02m4fWkbC1LceYp9vVE+n6FO9DXNL/+kH0RHq49sTXImIHHaVGwMJavi1FC1Av5QEO7QOwwhADfrB+dC34iZnYsBRWW4w4UJ9Ldo8DoO8PmSPFiq7JDSNF+RVdi6hynVNA5MQjp6D18nVFnnSmeiPo/4W861fYQTegOdwSCqLCL90kz2aaa+PawHkdNj021XmlcZrJPlt9OGxmy1xdc+xhgQVi81cerWNG9PIwPC25MHu2EZzOyJAPO96MBMWob+z1bq8T981f0cx5FbPP9/UAz5gaxtnnJ9VOVX2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/jgU4ly0eiZT9ZbFcvNjXzYC32jRRFfYVOLQ/vhTI8=;
 b=lEYeT5rwGMR8VusH0zAV7xuFidDttAGW0kYWtw0NtKhTUCfuaRGgkDnmn6b5/LBqA8SWLMn0d4+fqOlzZ4i2E7WPqFx7jtv8IcjHIfBqi0N5UF7A/0737mJGrZDK18dWox4Ku3EbW4CLF51JL0Y/DQCd3GfpLDCLAd8u7j4UXrM8Gk/3rV5h3cMIEOJ91k8eGdS9DHCPN/5Twc1YdYZk+IWUdpoT87Y+H22+tme3OQUaHQq2KV4Nwf8eFvXWsUTdm4D7hQl/YqVYe8VFplw1J8K137ekYTmv/5tTxjWstEig4WTpkHgH+7/nUd2R7X8Yd7h3odGGHecpCIgO/H10Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:52:24 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:52:24 +0000
Message-ID: <c78cb789-7904-4493-81d8-374a5225eff0@intel.com>
Date: Wed, 19 Aug 2026 16:52:19 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PULL] intel: Update AudioDSP firmware for BDW/SKL/APL platforms
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0050.eurprd09.prod.outlook.com
 (2603:10a6:802:1::39) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9cb86f-9f11-4acd-e9c9-08defe017aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: i5RITAZvkF3aupjsOxL1co4pGjwKwfTJ1fzNMGR9m4VuocRXMhRoMXn1Qwx6uJ3Hd4izIozH9puaEJCyVcl4KMQbnzZqz8Phv2XUjJDE89aPaG79yk9gChmrd8gB0QS3VAjHf87YibpUz3DEnSSn//5w45VJLGhKlWKA+EhVrJrgY/BFvtALoUmHsmfhaA/hXQwh9HcNo7SjAcJzgBQu9EmDPwnmJDO1O/yYQ6uGU3jPkkqhEBkWrYUY+HKeRJjnXFCZIjaik5FZwh5aOSD86eIZhMxYM1EY29Xc1PZQ9HJ+9vbbQKozUia6XIHMY+SJq61HRmUvcF70ngTVpt/bpYJi0+6NKJ1th8v6v69IaIPydsmdcMnwj4ylAtbE/bp+AZbNuoChCpdAdWFX0Y6MqASbKNpdedwpz+/aPvia63lF9DYGz1LB6NSZVFEjSilMRYJ5XDA7n3PG8SMy6poy4UWXT/0KLe6fYlhhwgjGoA+yuUxb3n/NQNPqwZ2/4zEkAUSJbQzmZMyXKlKCGjdioBNKEAwbysaC77tFg8Zh6az/tD5vVrKT+dIouHjCZWWUmirWsA+smYyJRu5rCtd3z5eGktb4oXlkp/tK0lZdC/qZlDHRNUb8FG+PMRYvpeOuD1d9Z9w5bSHq3oIJzYGkhVy2iq6tISoGao4nJPKVEu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1l4eWRoWURuTjd3Y1YvUFVVUCtnUitPWW5FSWVrWC9iMUg1eG9NUTlDZHlk?=
 =?utf-8?B?SVYra2ZPd3VXQmZ3b1RUNHhPbUpReFNpdFRFRG5welpVTXcrSGRMbGNsNnR3?=
 =?utf-8?B?TnZkSnVqQjVUdFhvTE12YmtmQ2dFVTVSSGtkTU1Ub0FhbGYvZ2ZiT3dxUjBU?=
 =?utf-8?B?V3RGaVRpQkhTLzRybGpWUFZhMkFhTEg3Y0MxMkFLS1pncFlXWEVPRFNhL0hY?=
 =?utf-8?B?SGp0VnhIOW80ZEJOMmd4aVhYYUZDaWRNQm1hWnFPWG1YWUNlNXRwMlNEU0VF?=
 =?utf-8?B?RjBNaE5DU0hGai9zTWQ1VkcrOENDTmNEL3g5cVR2bnZMQlY2Z0o4WDBJeTlY?=
 =?utf-8?B?RUQ0YWFSdHdOS3RNWFpOUGtmRjJiV01IeFVvQ3IwQUViTlQ1d1Bla09RWnFY?=
 =?utf-8?B?R2lpZGRObXR5S2JlMnhuN1dhbUdGU2hOcnB6TmFHczQreDJsUmRaU2hlSDlE?=
 =?utf-8?B?UWZLb20rbmE3dDNOeTBVNzJIczZ4Y0Z6WWZoY1RISElDWDNEd3kvTHZzb3VK?=
 =?utf-8?B?anRCc1duMVJGR2ZVZVErVkdYeEFtaTcybm1ieERBcTR3UlQzOVo1SlJSS28z?=
 =?utf-8?B?dXVXMVNVMUhEUVNHOGlNelBDUnpEVDU2SzVrQS9uR3k4cTFQMUFTclJsZnhC?=
 =?utf-8?B?Yy9sdStYb0NyTFMrcGRlVnlRbit2SWg4OWNBM1VWOHhOKzYrdTdFcmlLSmc2?=
 =?utf-8?B?ZHlES1VCTkd2NEtLZGlmNXYwQmY1QTVRWjY4NlNUbjV3S2NzaThIZzZiSDI0?=
 =?utf-8?B?V2h4NnBZK21nbERnVlE0c3RKRmwzbTZmUUxuWi9FRjZzSmhSTmp4SUdoVnky?=
 =?utf-8?B?SWdLeGlMTjUyM3Y5TXYzM1RPZkVTQWVRNXBRcGN0TEJhTFJMVTRzVDlIN3l2?=
 =?utf-8?B?UXdyNlpYWlpDcXFnL0drMGhqcjVsTHA2NW9tejMzZjJUZmNCeHhrSC9ac2lj?=
 =?utf-8?B?THp4eldMVmhqMmJyY2tBTGVCVUthRGJtQ2RIU2xRTGdobDdVdkFqWHc3YUp4?=
 =?utf-8?B?R3cyTzlzd3BaMmFuci91YWJMZ0dSQ2ZRT0pnUlYyemhxZjZnZWlLMzFpejJa?=
 =?utf-8?B?WHViTzQxMXZqWW1jbldDd3pJOTIxVlcxTWptUVYxY0pqcmZvUm1xU21JdGVq?=
 =?utf-8?B?dHRaU0JkMGZ0aktpdGFSWEtpbGdidVpYYlpwdVVaTDl5Ui9qcDh2V0ZLZkxs?=
 =?utf-8?B?ZWw4L1g0RncrYW1raWFCNjRWQjhGbVFwaXRXSmY4UW9FSjY0QUtDaDFHUjQy?=
 =?utf-8?B?MHNWREZmazJzb0Q1VmF1cTNDK2Rkczl1dEVzQ1k5SmJiM1pFOUMvcFpZazlP?=
 =?utf-8?B?bUxsTXNDZlEya2h3dW9LbWhTaGJOMGNnYll1bmFkdHhyUWlmMjU5WUZTb1dJ?=
 =?utf-8?B?TGJLVnp1TzJFalFQeXJsT280Q3ppVUxscWlQL2p0NzRTMGcrdDY2anMrWHhk?=
 =?utf-8?B?QkZvV0dUQ3FJRFAyRGRDVGpmaGdZTTFKSzd3TEovS2lmYzRhaG8vT29paVlG?=
 =?utf-8?B?VTBYNy9TNkUrOVQzcUtHUVA5MFZrREFLTHNwTnBHNHZwTTFPNzVsQVBYUVpT?=
 =?utf-8?B?TXV3STh2TUJCSmljc1VhVWh3MnFmRTFVTzlBU0tqZ0xtSVZ1ajF0bkRqczNT?=
 =?utf-8?B?YXhXUHVRMUZSWjBnT2lYR3VFa2xWY1NKWG9nd0VwYmQ1UTViQnQzOWpQNk1J?=
 =?utf-8?B?Vk5rUUVTdU5Ib3IzdStFTmcwZVVoZEhwMEhzcWttUUNQNTZVSXBISmNOMnkv?=
 =?utf-8?B?SXdWWmtNQ21YYXU3dWtCUU1YS08xUjloS3pjR0FMY1pEeGJZR05mV3dCKzlI?=
 =?utf-8?B?SWtlb1J4WHRXK3A2d3NOZTN1dGNFK0J4STFRYWt6ZDNzS3VBcHIxbjBsZkx1?=
 =?utf-8?B?RXVJNlBIblZ6c0ZMYm9wNlNiOEVQYzZneGpRdW8vR1FIVDFJL2RINUx6YWxw?=
 =?utf-8?B?MnVKZHFFMk5PVTRkdDMybUNoUzJQZUpzTG42SHhvLzJQYVg0b1Q5NUdiR0FC?=
 =?utf-8?B?MzhoMFVlVTZIa3JaMWZkdVpQYm5uaWxQL3RGd1VRZXZRSHdKK0J4eDQ2dUZK?=
 =?utf-8?B?NllJQXVQVXZBODg2NW9vd1Q5N2swWFd1d0lsQzdZUHE1dlBkcnBMRENXSkVr?=
 =?utf-8?B?akhmanlkcXBNcnZyeklWbkJsbUNEL2xFRGcyK1JNQnVnTVJZY1FHcWw5V29n?=
 =?utf-8?B?aVhiRlJrL0JwNHo4dCtqYjFJejF3aFl3T1BmUTlNeTZOdlpCK3l2eFpVaXZI?=
 =?utf-8?B?cUJVYlM5WkY4OURzMGtIemN1Z3FLeXRTUmxpbnVqSmNWY3d2MXVMd3N5d3o3?=
 =?utf-8?B?V01JMzNTWUREci9hZk0xOFZuWk1sWUZRZ096L1lETkdOM2NjOGtaMFJwTUZM?=
 =?utf-8?Q?hUU0udFeqz1HntQg=3D?=
X-Exchange-RoutingPolicyChecked: mV7aBaJJYObDPlRzVVZCaijNNTyQLv/x2ae8a4BQSwbAZa/b1tMxHJdKONNnjREYSYtU3bAypqrliUiOPuS5nAoG44Xq4ayncCHoABqiig6nSSNkNNhgTHqGfkaBg0f0hfpqV93JjTB0js1QpKIvrlIpkurGBX7AuVpItncg488j0F9/SFbfZmaTaDVc46ZoHC05w2YGey2+XpPwit0FIzyAGQgBXkEdt1GAGl3vZy+JyAShnu5xjmuImYoCi3KtrwpT/UhqYHL3iaiV1v1YrzWzq3ssw4wHqbRbVkmB1nrNrj2BbYIXOe/saiENJ41Nn1MksvwIXfdfdeMPxAnAKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9cb86f-9f11-4acd-e9c9-08defe017aa7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:52:24.1563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmhSRaBrG2ndztA1sBgzJyWjoJczWTup2f13XAWQ84TJXwhaNgxWtchLFi46W6GZ0QfPd/fRseszQw0Fq3n/ZOGhqvfsfa/YfuvK1/pKX+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
X-OriginatorOrg: intel.com

Update a number of AudioDSP firmware binaries to their respective 
maintenance releases and add missing binary for LKF platform.

---
The following changes since commit 0a6871b19abf5d6e024b5d208b101ae53e7fa0de:

   Merge branch 'robot/pr-0-1787066669' into 'main' (2026-08-18 15:29:47 
+0000)

are available in the Git repository at:

   git@github.com:crojewsk-intel/linux-firmware.git for-upstream

for you to fetch changes up to c8d7cd5ad3f84c414576068ca6d0c696ad57fe1a:

   intel: avs: Add AudioDSP base firmware for LKF platforms (2026-08-19 
16:09:45 +0200)

----------------------------------------------------------------
Cezary Rojewski (4):
       intel: catpt: Update AudioDSP firmware for BDW platforms
       intel: avs: Update AudioDSP firmware for SKL-based platforms
       intel: avs: Update AudioDSP firmware for APL-based platforms
       intel: avs: Add AudioDSP base firmware for LKF platforms

  WHENCE                                             |   8 +++++---
  intel/avs/apl/dsp_basefw.bin                       | Bin 505632 -> 
505632 bytes
  intel/avs/lkf/dsp_basefw.bin                       | Bin 0 -> 624732 bytes
  intel/avs/skl/dsp_basefw.bin                       | Bin 243016 -> 
243016 bytes
  ...sp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin | Bin 12288 -> 
12288 bytes
  intel/catpt/bdw/dsp_basefw.bin                     | Bin 260936 -> 
260608 bytes
  6 files changed, 5 insertions(+), 3 deletions(-)
  create mode 100644 intel/avs/lkf/dsp_basefw.bin
