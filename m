Return-Path: <SRS0=0+E5=6L=intel.com=cezary.rojewski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1388FC636CC
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Feb 2023 09:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4285C4339B; Wed, 15 Feb 2023 09:08:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10173C433D2
	for <linux-firmware@kernel.org>; Wed, 15 Feb 2023 09:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10173C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676452134; x=1707988134;
  h=message-id:date:to:cc:from:subject:
   content-transfer-encoding:mime-version;
  bh=L8UQ/7japxQfzwSnxHg85WK19rNoDLXpzxJhvT0gq2g=;
  b=P+zN1U4EycjVzdJ2eJ3w9XICAnQN5ueOVDTD5QZ7F1cO43hKFYDT8tv7
   J7pdrToOLD9qOWTla0efpwKFMFhuuG5sIl5oRdaOMgJn0ynplnfOAWQw3
   BKeaPsqSm1MRlXPajogzG/j2g790uC95v04CFlq3N22XcFYhxSiIbi1Cl
   qTGgfJNybOAb0RbZj+CqtTeGQnRXrKJvItnhn5S5cC+8F0mbmFZN216Od
   eWW6jN/Tc/Be5be+g91GrjJOGBdDIYa3F3LunJPk4SiogSPD1kPt/RjPR
   3jsLMgKJ+2E/slMYcxgsw2XjnNdvXyBJqtGyLQwNWGQJqYbi8DexMaeZ2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="330012162"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="330012162"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 01:08:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619361783"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="619361783"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 15 Feb 2023 01:08:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 01:08:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 01:08:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 01:08:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qmh8dVnqZXkpEG8mVyU9cs8Te53BDkZULfn9IpOq3uJ0LtHOKOGeKeKX4Y57w1Q10DC90Nt/fVPCq49DrU8N498AYz2MypmnhbA3yU2mi4d1sYEpq9kQnl+QSAPW88aUvlShPWn5fFu/eb8s4blvmX3GXlaOoIpPswqD7HvYfPdPiRUDsUVEgsFF7wi48qVkW7ma//Q/Hu+lDNx8o7RqWkuXa8e7pyyXcCMg0/IKsF633LrItH+TtJJuSzjKZQDnWSJRShm9TkBCnFcihecw0nyNhXRqBlm3KiMjppfDNAj2GGlAl57vROyS7nMO6+VtPwo/jIKT4gK4iltg9T1PsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BStgZKAAkaeAP38Y5tCT42X9dfS+sHeLLEv+79P3tTA=;
 b=mAtwg3e6V7MRyFeTTbhN3QVpqaHK55khosopS9crYtR5srN4Fn3iJq2EibW5tUogwHdJi7ry6smL5c+tubpa3VZrFOQ6K7aPy3k8Isvs+OK0/C3U6+3MClOz/nc25KNthkVfQlN2+MSiO8LITvori2HrgTZntNQOi62Jwxu18g/zBekzYgi+kaOOCDuVOn45a3zVY1F1v8dGnPt0Dcauia+DFhixKmJWv5F7tZDVWsqFVNFgUfybgShFRFvF5xSK6bLXwfuEWdJNHOWRjFavtSeFAZWtMd0yWveiKbFCIbYfcrlf6LAVAmUdFHllyysCAYlkbvXFPRNMSPUMRjhcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 09:08:48 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%9]) with mapi id 15.20.6086.023; Wed, 15 Feb 2023
 09:08:48 +0000
Message-ID: <38913aba-3717-fa26-bac8-96f8e9cf112a@intel.com>
Date: Wed, 15 Feb 2023 10:08:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PULL v2] intel: Update AudioDSP firmware for BDW/SKL/APL/CNL
 platforms
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ee5fde-62cf-4f48-984a-08db0f343f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHAOEew8LgFG7Fw4EMM36ba0eGfKrVoCMUgJc8aGY5TnEQppE8y3nvBrZGCUdkXNRHjvGQGbjYWBs1nZqiplrnVPHKpo/MQc9nHUdpus4aauETR7+skQvfxcMO7Ec7bTYyOVtH9b/uf6KF8ILoCiIPKtvJwz4vEnMi0K/3WWILsY1MGz6HawR4CacGd6Cn15WgN9th+vVBNg0sE7wLP4ql7defHPwoEuYenn/yP3xDCZpdQIMAkroWTVCOwSaJycZzlw9lwKCWXWLl9S4aEwbd51wY+yaZ2wFg5NlurKPEHpMntspoqx5dwmPSVA8wPsD+KdsXMm5dY8y6uaOa+zXkMxGGa8ma2wKq9VIey6N72U3wFc6CEs/RXhEkOQJfAiyLSVDq1ZqvSeLzJuWFglN1fpmM9PXw37B6UlQ+UjCjQJQPuc2Adv21H7K9Hh3W+Q9TVAI2gva7tgU5CnQfF+5otbmAD3NRntmwaBzaT6k26XH6xKN05UXjlm6Q56ESeYgAejSL+RuBxqNGGoUrjth261K83HkVAx/k021zPgVNOuK5BBy35SVr1UgA73iLkZzs2wIs/kll8eMgwCfq0AA9abafz5R5PSvrlDkLIYWdL8XGomFv3ZbmVmYZRzBNwdyxB9410r1/dHYTmpBWu+EjuuHJH1XHPlYzvSMvWXiXiOzLYkBUY32lRY8tGyXdhOqY6LzUUN+D6SHX3UNoSQ11Dbn5jFtVBKdeQxjjfTjXRgjYzSTqMc2Y3bRRRcDN3fzhM9UbQYLoA+wJQWIQWw5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199018)(6666004)(6486002)(966005)(478600001)(66556008)(6916009)(66476007)(41300700001)(8936002)(86362001)(82960400001)(316002)(66946007)(8676002)(38100700002)(4326008)(5660300002)(186003)(26005)(36756003)(6512007)(44832011)(6506007)(2616005)(31696002)(83380400001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkg1OXdmY0FNcUt0SzVPdkFMOU9JMU90MG13aG9IRXk4NWl1NlVnVlJ1Mm9j?=
 =?utf-8?B?dUZYM3RDeE53V1Y5a2xYOUNiRjNqMnkzbXU1cmN3UTFxZjU1TFpMczMvbVFD?=
 =?utf-8?B?YndwSlVnV2hTMVh0cWUrUzNieVlIY0pQN0o0M0J4dGtwY1pES244UU9VeElD?=
 =?utf-8?B?c0x3TWZlT1J0VWk5aHAvWmVES1Ewa1lrKytKdzdHUnFjMzdZY2VKbnJkdGho?=
 =?utf-8?B?MFZtSU5SVWxyV2hUSUp4MDJRUTlaUWtNNit0OWFzZ0Y5L3dPLzExUEJuWkV3?=
 =?utf-8?B?MmpWMjhaekQzVTNIRVNxQzBMKzErRjJzckM0MkJqVGJhTXdLcndzdE81aE80?=
 =?utf-8?B?NW5WRmliMC9rbTQ3eXUvTHc1NEswbFNNNVlacVlFbElKTFg2eHc3WVU4SmNR?=
 =?utf-8?B?TmlMVThwcHovVThXRFo1S3BsSVNHVjIzT2ZoMTlJcy80WjYxaXB4NEdrcXpB?=
 =?utf-8?B?V3RPZzVDZUp3MU1ybFhlNGE4NUxPVGthVGl4RWdsKzgwNU9wdzl4Nlo2THNn?=
 =?utf-8?B?dVg5Nis1Q0Yvb2hYaVQybWk3VTNZbFE5US9yTUhDV2UzWTdFS2w0REZOZkE0?=
 =?utf-8?B?cndDZ3E0K2ZsdmpCcEV4bEg3ZXVIRktsT1BEZDJCZlA2cXNZR3ZYVE5kalFJ?=
 =?utf-8?B?YUp5Q1BCVkt0U1drVWR0QUYzaVlQbG5sOGJEQzI0alZ3RFZsbXZFWVVXTGZH?=
 =?utf-8?B?OGVVYmFaYW9qdFI1d1YwNXJiamRwVnY5bUVDeVhCVWxvZWNRaXN0UGRKZE8y?=
 =?utf-8?B?aXRSK0Q0Z2s5VWFjRVkwNE8vVW5TQThUL2wwZ3VscFB0WmxVVjNEV2FMTlcw?=
 =?utf-8?B?QUlEYVcwRmZadFV1U2djUm1hRm1tbnZxOGlhdkxQaGJOZUZwR1F4RmNyY1po?=
 =?utf-8?B?dmpGMWp1MGJoRnViZXhPWU52WnR2SmM3RE9lbG5EeC94Mjg0aDVLaEl0dTho?=
 =?utf-8?B?MmVsa2NscC9qQXNvZVJqTGhnYzFLeUI0bnkwbjgranpvbTBPSE11UmRMaTZj?=
 =?utf-8?B?ZEZIMXpxb1pEY3VJdFJUbDFDZTFNNVNyNXY5L0ltYU16VHQwczErV0x1Z2R1?=
 =?utf-8?B?bFl1RGRwcllPRldhbnpudVF4V1FFNytRTzNiRnkxUWo1TTdGaTNyeUQzVkZW?=
 =?utf-8?B?ZkgwSk5seWZGS24rU0J1OXB4dWlpYkJNT2ovVDNXUEthZFptQzZFUzBYdUho?=
 =?utf-8?B?dU9KMVNxSFZYNEo5eFkrUmR4NHRDbHBOaURudVROTWJGc0o1VHNjN1FnVHJs?=
 =?utf-8?B?V0VBWmpJRTQ0UnFsYTk1Y1hYay9EV1YwcmtjUmc3TVRDRHRBKzB0ZVhVWFc3?=
 =?utf-8?B?U21yR1lzSnpPRHBDdWNDMDhzb2NlOXRDV0FZaGdualFOcEZSVlBBTzl4MUl3?=
 =?utf-8?B?Q1RkU3VLM0ZZcUpLMmhGVDZSVFZqMkw1WGcxNS8yMmR1SzVsNHpiRWF5NHlZ?=
 =?utf-8?B?K1l4UjdLSXNOWlJCcHhJKy9kbmlRS2t4U3BLODlXZWY4WXgrZU83U2E2blEy?=
 =?utf-8?B?cEVVN2pQT1ErTDVOb3dVTDcrMnpaYlM4cDBCczZ6YUtNbVM1ZGFvUXRTVStm?=
 =?utf-8?B?cTE5SExMdlc2SFdvclFMci8zQVJ2cE9jd25SYUtqL1YzbEdudkNZVWdmcFlu?=
 =?utf-8?B?RENRWXZJUVdBTHpsY3B5a2RYLzlXcnUycHVKNEQvSUdJYUp5L3NWSUN0UVQ5?=
 =?utf-8?B?ZmpDRDhmTXBwUE9zWEVTWDQ3VTYrZmtOOVBvdGo3R0hlNk5PVTdNdm8xZmlt?=
 =?utf-8?B?T2l0SitmdEY2NlN0a3Q4TEpZVUd3b09lU2FqM3NPSlFOenRGaXhXK3hNbGc5?=
 =?utf-8?B?WjR0YlczdkhxMGtlUFloK1J0cGx0eXRLeWpXNis1cUN3WVVRYTVGdGx0VWtx?=
 =?utf-8?B?QVJwZXkrT2ZuSGRoVXNnaUVaTnVBTWZmQzZ1UnVaT2tOVzF3ZG16VEs3RUkw?=
 =?utf-8?B?RlBMdU0zZ1ljU0RLZk1pcUwxQ1RIcWJCZ0VWaUMxdEI5QVJQTlBsbnpqYnBt?=
 =?utf-8?B?ZHl6Mk9xSllFVXVMYmlOWlIzRDVkUWxEZGo1T2RWckVlNko3dURzMkRGOWN6?=
 =?utf-8?B?Q1lvNGNWaEV4ZmRicFRyMUFnWUt0Wk9QbTNuV2Q2b2lQa2U5YWF3SVlNenNn?=
 =?utf-8?B?NDZBQ0x4WmZUa1NSeTFzcW4yU0hqb0ljRWF4ZGtWRDNsdlVrVDNXR1dMV0ZM?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ee5fde-62cf-4f48-984a-08db0f343f7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 09:08:48.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YQpHRKr+D40Zpn7zUsKT9UZ7BksP+gRTdWxofWYTmvAaHq8zLrwoEdZcFw7cxF8QiGMzuFJfJVWnCD12sM8JfwEZpXSspEMlbGTOY/cyJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
X-OriginatorOrg: intel.com

Provide the base firmware files for the skylake- and avs- drivers to 
utilize. Leave links for backward compatibility but put the binaries 
into a dedicated folder so it is clear which driver makes use of them.

Changes in v2:
- added missing file to WHENCE

---
The following changes since commit bf4115c1aa2bee686ec675595271da50611684b5:

   Merge https://github.com/pkshih/linux-firmware (2023-02-10 14:35:21 
-0500)

are available in the Git repository at:

   https://github.com/crojewsk-intel/linux-firmware for-upstream

for you to fetch changes up to 23afbfe8a2e817079edc4f7eb0290951cab028c3:

   intel: avs: Add AudioDSP base firmware for CNL-based platforms 
(2023-02-15 10:16:46 +0100)

----------------------------------------------------------------
Cezary Rojewski (4):
       intel: catpt: Add AudioDSP base firmware for BDW platforms
       intel: avs: Add AudioDSP base firmware for SKL-based platforms
       intel: avs: Add AudioDSP base firmware for APL-based platforms
       intel: avs: Add AudioDSP base firmware for CNL-based platforms

  WHENCE                                             |  31 
+++++++++++++++------
  intel/avs/apl/dsp_basefw.bin                       | Bin 0 -> 505632 bytes
  intel/avs/cnl/dsp_basefw.bin                       | Bin 0 -> 588040 bytes
  intel/avs/skl/dsp_basefw.bin                       | Bin 0 -> 243016 bytes
  ...sp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin | Bin 0 -> 12288 bytes
  intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin}   | Bin 260320 -> 
260936 bytes
  6 files changed, 23 insertions(+), 8 deletions(-)
  create mode 100644 intel/avs/apl/dsp_basefw.bin
  create mode 100644 intel/avs/cnl/dsp_basefw.bin
  create mode 100644 intel/avs/skl/dsp_basefw.bin
  create mode 100644 
intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin
  rename intel/{IntcSST2.bin => catpt/bdw/dsp_basefw.bin} (54%)
