Return-Path: <SRS0=Kiye=6K=intel.com=cezary.rojewski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0442EC05027
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Feb 2023 13:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6E6CC433D2; Tue, 14 Feb 2023 13:38:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4D38C433EF
	for <linux-firmware@kernel.org>; Tue, 14 Feb 2023 13:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4D38C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676381919; x=1707917919;
  h=message-id:date:to:cc:from:subject:
   content-transfer-encoding:mime-version;
  bh=UMBkOawg6prD47lqt4pW3Qb+OX3CNuBdFUDiath1wmM=;
  b=bp3uzHoQ1pN7DfMoBXckBhB1aj3iMRp7Ss2yV6Tuc4kwR72d1oKMx7HI
   Y1E3JcH5SHvyC3XYp0VnUBJz9Ibp+S62uzupXK5nHemwXxiI5KgH6lZPv
   JpfnIbGA9uBwEcm1z1W1n6CfeODwgqBpEzb9zgeqHwiIaR82gVsnBQUvV
   2NI1AIuhIwXD46SgVXV7XvhHDWKIbr7izZGIBjxW15lihhe332pZ2loaV
   1HsNlMsoFH3Po/+KOSY9D48x/OIIHsossb+2Fy1OiKYZOagy9YaPobpV3
   KlFQKAhhgn+JcXOme1RA0asXeTUFqTT0BHxl5OBz/LyRZcBQjQqtkG9eN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332470612"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="332470612"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 05:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="998082596"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="998082596"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2023 05:38:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 05:38:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 05:38:37 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 05:38:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKoBglWjX64f2A2vbMmtsWAaeTi8XZZ4FcVLZ5bjBdfoTy33OHJUG5fG+gEEiXkBOSptT1+PgaSyzYHZ7y3D8HjYPDmUfmEryXKAQL79vD4RyJXAEqUzP3r6U6xLf2pTk/W23/VChwcE5lUj+Ua9euYYn6xuZJrAS+TAyUmrUVZ03Mhdxg+rfz7vUzT6YQL/iHL1zB2YIFZRZ2PJdWlNRHhgjP2dn585GeQc6aZPaIMhgqsndgNML+/XKo1SuRiDbN7d/yzjoCw9U9/yPQ9A1TYLXfmpdiDd2DgwvMb5ViRZi/e6w5AYlxrUNl/BYWfW0WthTJWmLqcpY9R763syvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPW/TWo7wKeggLuIvVdx16XjQaHsJMRZ089CSrzY/+Q=;
 b=Nu8fqERqGrnRLYLiYEpagYceP338noIez4fuYzSfTwGZCe63j1YlF6gwamcLj1ojQP/hwHT+QP0PlQhyMfOiQ7Gkh+169OAvOq1PmPoOpXpL2O7KxF4g1iJq2WP0cknXEL+ViG+tCzZoKuiB7MshIToySwzzUwMvN94RvkAQvxkBbjFp5XPcFtRxb8FQWpOGXtBNeKBCGkQQeczSua0qlbDHb25FYR+gTS+TEuUdf1ogqshEQaURj0M3rzm7H2bVb71ydYn8KzbLj7iRE+fOu6xpia1l3ZtKN5X5K1XzCf4dGKA1/MJ7GZlwFdbn9bC1N918ixnQYIh44tp6eLX0AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24; Tue, 14 Feb 2023 13:38:33 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%9]) with mapi id 15.20.6086.023; Tue, 14 Feb 2023
 13:38:33 +0000
Message-ID: <dd9e09e4-f7fb-d6ff-60eb-d34c942f2f2d@intel.com>
Date: Tue, 14 Feb 2023 14:38:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PULL] intel: Update AudioDSP firmware for BDW/SKL/APL/CNL platforms
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 414af736-23e9-4570-3fc7-08db0e90c459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0wimJrY3diPxy9JYaWF7qGxc1lgj2Ne6PCba7/tPQEEqDWyANEt07UAR1r6OzUql2J84/UdmqJ8MHxw0/S2xLPIoqVy+R3ToUpeNqIHxICxtvLYcf/Fwav7RzMafikMrM1tsbG6H4ypSUtHXumDWbX83KyglwdUVPpcrKEjsYjeUrsymro5cNfYS66Yhbb6JAyjVaNB1Pth9f2nQaM1z/vm4xAG774xs5cg39AO+nR3JDXgBGHht7ot//bZ2ljwmRxc2LbEljaKcn4pr7PLvgcwcmQT2LGcWYDlPbw7SpO1D0q0OaOGgmjh+jFnHGbysSsILjX2YmGUHG9btvzpF74LvwwN6Z1qLG697iRSeyLCZuqy8KMCjBK7wMiszcFL8cz/zd2K/efT27zmZPsocbdCr/2MAhLU8U/mthz8jLgm3etR/k9/+a3GtQmAkK3sUbjo4WEpTZ9tJhRZYizY3iR/g95iWVOybzKRER+H59OizvRJxnaOO/ALwftFQKcgySK73N96SdC85kMR4BjlaXiLvhZgfQsCZBymLHK88h4+mm4f7wcPQOPpU/ClifAUsmgvSnByfrUNGPEsvGk9lJohqBzK0ys2O7I0TtxU7dH/PcTkw8mBSBNTh4y8HFZwqW8Hn3JNHl8wmC7uO8zudpt/642S6H8lteBeGrPHkbHK/b+0NIF5HkirHzRkTqkr4g+h5ujTsptAc2u6/HJT+xiZn9CRWFD0wjdS8dn8l6Tfp1x8bWCLR2ga/IqmcoVV92JHpQxKGWasl6ftbSdVVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199018)(31686004)(82960400001)(2906002)(44832011)(31696002)(86362001)(38100700002)(6486002)(966005)(186003)(6506007)(36756003)(26005)(6512007)(66946007)(83380400001)(316002)(41300700001)(6916009)(6666004)(8676002)(4326008)(478600001)(66476007)(2616005)(8936002)(5660300002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEJMY2EvcmtoTHlGa1hrTmxraXdOVlREYW00bEJSdDZJVjdaTnoyZ2N0bEdu?=
 =?utf-8?B?bG9SZXJBcG5NcXpyZ1cveTVsTW9qUVovaG5ndFErUkpZb3ZCMm91SnNlSmJS?=
 =?utf-8?B?QTZzZkZuaFo2K0ZsM0g1d21PMmlUa1g3S3V3MDRGVDluTUFoeXNpRW9NNm9j?=
 =?utf-8?B?cllpa21XUi9nOWFZdE80MDV3dzNjTFJnZjZZWkxpMGplMUlEUnRGRnBCSEI1?=
 =?utf-8?B?M1p1RFAyUmFrcWduSmt2ZmdZclJ6YnpNMG9idEZXaGNkNnNXVW0wREZaSEs1?=
 =?utf-8?B?MkQwVVNsbndVcEZoSzhxS1gvLzBvZ09EUDNvSnRPd0dOQWQvL2diVXZjcEpl?=
 =?utf-8?B?Y0x5bkhCcVJ2VFN6SXcrN1d0cFdCNXlWS1RDMWkxcUpLMENEQ1dKajFtdDVE?=
 =?utf-8?B?YUpDeHFnMlZDeWJ4NXF6U1MzcW1FbjJWUGNBOEVMOGhlUm0rWlMvMXJOMXF1?=
 =?utf-8?B?ZExOZ3ppSUxVbzA0d3IyOFBIYkplQTcvT1AzWDQ0RFRBZ3djZHJFYlVRWjFv?=
 =?utf-8?B?VG5Zb01ldUtjOHJSb0RraDFId3pPZTRnN2JsYlFUQ2VLRnZOV3czOVJOWnFs?=
 =?utf-8?B?bUx2UHJ2RFJSQmFRTk9tZGY2WkJiMWp2S2VRdlUyVEVQTWVtK2lncG12eHRl?=
 =?utf-8?B?NW9PVmtOcDBtQ3AyTHN5dWJsc2ZMd25MY3IvV1daa1M3TE9MeTZia2F2dE9k?=
 =?utf-8?B?SThYU01lWVFzYnlIN0EzbmxiTUtGUlpFUHhNL251YzRKMzY3VHl6TGNFTXFJ?=
 =?utf-8?B?dzJPaFkyWUE5YnFudnU5bzR4eWpRb09ONjVSMHJ5dFdFcWd4MGRZWlFsTDJK?=
 =?utf-8?B?ei9qRldQVFRaQzdhZWwrT1ZzUGxTdHIvbHpzT2c4aTZnUThUdFg3b3V2Mm5a?=
 =?utf-8?B?TzZkVkNQOTAzZ1RCdFJnMUxPOFdMMWdlTTVVTHlLUDhEWkZveXpGVzB6RXlp?=
 =?utf-8?B?dHp6K3NVMTBLZmtoYk1leUptUWJkRHlyUGU4U2VuVUpMeWJQOXhZNzhuUVJM?=
 =?utf-8?B?ejR3M2pSNEtadXZrM2kxR3VVYldjVkF3RU9VNUFlN29MTVBCQVJ4OWZqYW4x?=
 =?utf-8?B?N0hvZmkxYktXMEtEMk9DMXVUQnN4TnhIMlhjZlBNU3NzYzNJZXRCZUJxTDdM?=
 =?utf-8?B?dEZwL3hQSS9GdGJDa1BSeStXWFVYZ0xJQXp2alI1WDNnTEI2OEZKRW9DdjZw?=
 =?utf-8?B?cFIrbTBPeVpvVG5qdGFaQUo0MGpvZXExdUJQUGkrU2ZqL0JYVFRsNEtFVVZI?=
 =?utf-8?B?N0tVVm9Yb1BsY1hTUkluYnZ2ZDB1ZEtXSkcrT0JKblVSUjBGTktVTkFzZEl6?=
 =?utf-8?B?anYxeVZXOE5SWlhuVm1wdjFKNnliK25hWVExQVhuaFlwc2NZKzVyV2dEbGJv?=
 =?utf-8?B?UGNFb1g0bmhjcHB1ZlEvMkZKTGZ5eGgzdjN0dGcyT0xDamYrSHgyM1JLZFNu?=
 =?utf-8?B?MVU4Y2paMGZZQWUzM2NxNmVDK09FdmlyeEFQRy8xaDZ3b1lvaDJVL1p0eUNR?=
 =?utf-8?B?TTI3V0czNFFVZ0ZiN040a3haMGRxNXBESkFRNVJRbVUxblg4L1AvQ290Ui9k?=
 =?utf-8?B?dnhsS3pRVDdIWHdLa3EvWkdVTXhBeUttUklJcEVpb1d2NUdYYlMwVlVoQkJH?=
 =?utf-8?B?TTlHbTV4UWtNWXNZZDBHTFVQUk5DWC9nWlI0Z1AvSmFpUVppZG1JSS8zbzlz?=
 =?utf-8?B?VVJ3NTZmaExXdnJzbCtZNzhhbllFSStXdTd6a3ZkbXpGdzlLS09DVEM2dTRm?=
 =?utf-8?B?anBuVXJ1bTZqSHJwUWJQdlNtQXpqVjJiS1hBZFY5YTJ1QjJISyt5WFdkQWhD?=
 =?utf-8?B?T0t3bUtFT0R2a2xPWVNrSGJQOVpQU0ViNnlTdEZJZHZWZUZHR2dwZHlMdDd0?=
 =?utf-8?B?Ris0VWMralNaYU5jYW0vVzFUdW5EeHowUCtTQjRSdTlLd3dMeGFmRG9uL1M0?=
 =?utf-8?B?TTF6dGhROHVKY3p0cTZVQldVdTNISmxZaWdvTUVZeUh2Yjk0aWd0U05DcTFQ?=
 =?utf-8?B?aVJZZGo4d25OMlRZVGQvcXkyQ3JEVVpCeWVqbHB0clNrY3UyR21aWFFmUCtZ?=
 =?utf-8?B?ZUFnSWwzLzF5bTUrdlVVOVpvL1ltbERodjNBZnFZN0cwNzB3ZDlaVWsxaWpV?=
 =?utf-8?B?TGNiU2xPVnBwN3ZqZ0ZYWWtic1kxbFcvQjFNdWhEMHZ5aTE3SjNGaDN0cmpF?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 414af736-23e9-4570-3fc7-08db0e90c459
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 13:38:33.6726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WriGabtHQB9Ki3Lio/cNYsR3haFY5r9bMk0I8FBKu3fDV4Ns6FrplX+Z/Ptz24MMcejhaAk3FBkx3il0SzROolnPCf6+2AdS1LAxMByLiZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
X-OriginatorOrg: intel.com

Provide the base firmware files for the skylake- and avs- drivers to 
utilize. Leave links for backward compatibility but put the binaries 
into a dedicated folder so it is clear which driver makes use of them.

---
The following changes since commit bf4115c1aa2bee686ec675595271da50611684b5:

   Merge https://github.com/pkshih/linux-firmware (2023-02-10 14:35:21 
-0500)

are available in the Git repository at:

   https://github.com/crojewsk-intel/linux-firmware for-upstream

for you to fetch changes up to 88bd1e152b9265e76bc0ba3cf2eab5f2a389a2fb:

   intel: avs: Add AudioDSP base firmware for CNL-based platforms 
(2023-02-14 14:18:40 +0100)

----------------------------------------------------------------
Cezary Rojewski (4):
       intel: catpt: Add AudioDSP base firmware for BDW platforms
       intel: avs: Add AudioDSP base firmware for SKL-based platforms
       intel: avs: Add AudioDSP base firmware for APL-based platforms
       intel: avs: Add AudioDSP base firmware for CNL-based platforms

  WHENCE                                             |  30 
+++++++++++++++------
  intel/avs/apl/dsp_basefw.bin                       | Bin 0 -> 505632 bytes
  intel/avs/cnl/dsp_basefw.bin                       | Bin 0 -> 588040 bytes
  intel/avs/skl/dsp_basefw.bin                       | Bin 0 -> 243016 bytes
  ...sp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin | Bin 0 -> 12288 bytes
  intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin}   | Bin 260320 -> 
260936 bytes
  6 files changed, 22 insertions(+), 8 deletions(-)
  create mode 100644 intel/avs/apl/dsp_basefw.bin
  create mode 100644 intel/avs/cnl/dsp_basefw.bin
  create mode 100644 intel/avs/skl/dsp_basefw.bin
  create mode 100644 
intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin
  rename intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin} (54%)
