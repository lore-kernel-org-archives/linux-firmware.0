Return-Path: <SRS0=0+E5=6L=intel.com=cezary.rojewski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E61C636D4
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Feb 2023 09:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAFE7C433EF; Wed, 15 Feb 2023 09:04:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 522B0C433D2;
	Wed, 15 Feb 2023 09:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 522B0C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676451893; x=1707987893;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l24EvVdIPrJ9+Z2sUdl9aPNz3g02aBxJjgyKpyc/DA8=;
  b=MFlvP0NXlg7nEcO2hXF4IsnwIloizoqsqrNg2Fs9ddV6KaH15BsMPQ2R
   H5RlqOBk07BtoU2hrzIiYjDuY6Y+3zenUJm5oLaDfw0tMLbxXBiyha4HZ
   JM2ui9Mi1iQddA5MMjsuNPt7RG1dwTLZw6HX5G0PDPnpn2ldUISIXAJYh
   Xt7uhzUFbMDSd86bMBSj0odFcwH+GB7DATngmhJjyI4kygJQ0XQBG0EjI
   IwNmyyBjPUrct2MLaaEgDqkIYsaWWAHXuJEoCV+lELK5/SZk/TR8kkvFe
   +XjSvfwS+mwjyfH/hIP4GP2oLzvTmWinhjXUo++omWEv/2kAaYykUTJkD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="393782964"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="393782964"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 01:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="738231010"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="738231010"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2023 01:04:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 01:04:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 01:04:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 01:04:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 01:04:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzIyMr3BbdV9yz9aCYo3ql5qW3PHrZ36vJvY9T2aCvT0iVAxGpq1/HGF2rNRwscepskSidQc3XTrn6D1L5pQjAmjA1e1GTr/L9ZzvDYBLIGhxIlsn0WigvgkxYgCceSPh2/+MIehMRHcfKd8CyKmT6aUDs7TbNQeIdooFrSben325lzngmS3csSQt4Dz4Vu8ZTZ/gzYFZq525yLjKqS7AZyt3bmxmZooYWm3UccAdxExS9Np2+tV2ZsJB1+jSRundQ5v+Dprs8IgVBBiQHU5N9RpWLvBEMNtwhBasR5jmDZjy+znCCO0KdQvd6LzczYHz7EF3kTN+F50Cs0IhBUPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSFT/f2Z0OajJ8FpotceM5N/SugFsvWzwGs+BhAf6Is=;
 b=MXErakkgHbBQCGTPtFnFrdW5NNwpFuVlDYHgwDXYH/shtvuO1Aid9WPP2f7YVKAGJIOdSDejjtiq2pMfOcN3jddBXVHNlJGDeC0JoaPNEqsgOZfhGQe0I/N13mBa46hGQ2W4VcJGGQNU6T660aAJ8iKMdXYDUispW2wI1tlUbp1hSHaN1VW3e0ghdeulXBt2z4wAN5yBJ6URfnzLSM3ECRZQ0o0xip/uNWvJd19w0Ce5YScLWOCCPnrJZ/7Ne1nOelK1/cqb2iKvoVQH2iqIZRxjwIqO0bukDnCDTzB+EeGrLjWBPXdGb2dz32LGORKpmN2epBnAsH2rQzh/pmVnHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Wed, 15 Feb 2023 09:04:49 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%9]) with mapi id 15.20.6086.023; Wed, 15 Feb 2023
 09:04:49 +0000
Message-ID: <1c5aae7a-8c2a-47b4-91ff-0848806c4fcf@intel.com>
Date: Wed, 15 Feb 2023 10:04:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PULL] intel: Update AudioDSP firmware for BDW/SKL/APL/CNL
 platforms
Content-Language: en-US
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>
References: <dd9e09e4-f7fb-d6ff-60eb-d34c942f2f2d@intel.com>
 <CA+5PVA7sQi7JX=xQAV7MXLTKJvVQc67PVKr-Z-HhRtv08NvyRg@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CA+5PVA7sQi7JX=xQAV7MXLTKJvVQc67PVKr-Z-HhRtv08NvyRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::22) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 335ad9fc-3ef1-4f2b-9121-08db0f33b0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJwpHYI/YmpO06eSNp2XjMxaU3W6tDfCHeD1+qcOIU/BEr0OmZJZFK/s0MePdBT2ClFRFFDnLGRzGf7veqXZ8xYABSYQUKH9ynDBwF9XLFgzwToQPbT0Wy7Myyuw+pMLi9ONf/JPF7g1dlmN5jFNWvP4/gQ6Cl4EEc1jnmCGSKvt1DZEOydzMfgEQqkMhN27zNH6diE/HwMM68jiRvZ4QnzNgX7ppGnV2+qIATuBeBfNu7maENX+RXzflH0qhyMTtGFGJbCI+rXKafMJRnTP9bRJvrQyACLa2ie5N/qCLk8aHoUTUHbeUAsZzCfeNx4l4o5GjR6nveuILrnvkH5//J+bMC7UKogMuNXkd7josHPE8ExpN+z96TqQ0yKzVp5gbU2Ya1BfX3uKP3PGx3hKkxqR23e7NpTqYxL/rox9qAIeHcKKFbl0Kq/ycbsxG95LvsmAKvaIBqP1VubelYibRnTcz+8XoRx8BVeH3p0kIZxCsQdBUMVa/l/qm8UrpLXghvlHkd6rACcUiOCi0d1LT6oKn6Di2VhirThcsBuKjsOc5tV/jCkzFG/UUlS1eqQ8+zKYnR8GowimsVnQJFpYka3OzKAlI7zJYMKyGPbKZXV4lHPu2PcTikxX3qS34zA6b5Ko55BGoFUP+EjJc9jiFNrzPLRMs8KHS9L4w6Oz+FzIJvEyewPNx7/cwAdgxgFOh6HDEaznu3oy2BOBOzL3/8hFF0l2fJCiqfazHnWM4tY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(6486002)(478600001)(83380400001)(31696002)(86362001)(82960400001)(38100700002)(6666004)(6506007)(186003)(6512007)(36756003)(26005)(2616005)(53546011)(8676002)(66476007)(66556008)(6916009)(316002)(8936002)(4326008)(66946007)(44832011)(5660300002)(31686004)(41300700001)(15650500001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clpmZEQ3dG1FNSthK2U0TXBFRytpWC9nMUVMSk15MExDdGlxdEgzV0s5VWhM?=
 =?utf-8?B?QVo5VkhoM1c5SmNNbFJGczRIRDYyVUV5R0RUZTB3SkY5emI3Qk9OTGZaVWtV?=
 =?utf-8?B?YXc0UjRGejdLTDhGOHd2ODFHQXVSVlFDdFJ2dndaNGkxeEgxSk5EMWdNSGRD?=
 =?utf-8?B?dFFOSlg4ZHFGMzB3WS9TenEydW9YTnN4d3J1NU1HWmFQK29qT3dUWlhNd0tj?=
 =?utf-8?B?czFBVUt2WHhXcGduZDR6OW0zeVJXNUxyZU0xeE13RzRnWGtnL3Fmdk1yMUhL?=
 =?utf-8?B?c2RRQkFQcGppMndtV09jeUx2RkRxeDdHYnpzSFhLOFU5VUNGVVFqQVJHZjQy?=
 =?utf-8?B?TndET2pGZUU4cHptWHhXUnZtQkRyUVVNM3U0L3J5Myt4bjlGbXc5dm5oMHd1?=
 =?utf-8?B?R3k5QlZsK2d1azY4RXdvYXc1enhzT05rTVJxYkdVT0M3a0xmUXJYR2FFVURa?=
 =?utf-8?B?NHNRTmxxN09qVXY4TCszZDRSc1EvUWJIdHVEQWRkWWd0R0JFYWlaVlJqSWVX?=
 =?utf-8?B?dUpGMGJmeXNvM3JuTUpXT3AwNUkreEdzb2RFK21DOXhOTGMvQTNOM1BsT0hp?=
 =?utf-8?B?a3cvTnkxMEcxZG82SnpQTUc1M0p0ZkpubnpxWkp3MnJnQTdZK3JDMU9vV3J1?=
 =?utf-8?B?YXNpcGtkWUhtTlNrVVg3MmxYMGJzalR2eENJSUNTdW5FOFl6ZWRLcHZnSjVR?=
 =?utf-8?B?RHpWcGp3dytzb0gwc0FBbEVaVEYrQTY5MGlwdXNIaG42Q3BoSlh5THV6MVBM?=
 =?utf-8?B?U2NEVE1TdmFoajZpWEM1RjV0ZHhLK25vWnhkQ0VDUWY0d1dma2UwaEE1djV2?=
 =?utf-8?B?WHVkV00zTVdTRlZLYmxmbVNiSEdTUmFaL3FEL1VPeXBYMVZnNThYUFJ2L2Va?=
 =?utf-8?B?dVNXVUl1b29vRlZyMkR2MDkxK3VNK28vc3EwN2lyZUk4cjFWWTdrTGRocnJQ?=
 =?utf-8?B?elAzcjh3VDh1RUlUK0tiQ3J2MTRjV3NpajJRZVcwc0VWbDkyL3pQdXB3dHdp?=
 =?utf-8?B?MUZSaXF5YVJ4ei9pT1phM0NxYWtXRXZXQ0ZMS1hXSVh6dndva1Fla2o4eHd1?=
 =?utf-8?B?cTVZek5ySDNmWVZMcXdqcFNaUDV4aTVOUC9VS1hQbHlwMkoxUm80ZWo3RXFN?=
 =?utf-8?B?SzFBYnF0Uzlqc2hmeFZKNUViV0w3VCtlRDVzMHd5a1ZKZmFXZEROMkpUWW83?=
 =?utf-8?B?dzVDaWdOaU53T01pZTlvZS9lRjB6eHNucHl5WWY4U2VpdVRZMW1nWjcxd0dX?=
 =?utf-8?B?MkxXSk91ODdCbWxmWGljdmhuYi95eWVSYmVEblErMkxDVm5iSXRlU2JjV2tF?=
 =?utf-8?B?SGlCMVpsYlVlN3BhNXordVpQdTczbnRXblBnN1EyUWxIdWwzVGJTMjNCcmdR?=
 =?utf-8?B?cGNMUWN4cUFNQnQ0TEc3MEtTVi9wUFFtQjBIajBPQURjWGgyY2VuU2YvQlJy?=
 =?utf-8?B?eExiZFk5cU5LcUZhb1lxZkxIcGhleWU2azdwaW1NaUgrbTQveTVML0RhRDVN?=
 =?utf-8?B?aHI4b1J4b0VIZUswbUI5aUMvaWZPdk5XUHNSSndNQi9DMlIzb2Y3aUZkSGxD?=
 =?utf-8?B?ZzJjdDVNMHhVWFB4Umd5eHo0bFRxR1pRbWxOSUZxdFZVRlhaWW5YV3N3QXhk?=
 =?utf-8?B?eGNKcERJMTRlaFJlUzMydUEwZW13RjNmZXRCejJkVlY3YUhvRWtFNk5CUStM?=
 =?utf-8?B?bzdpQ0IyZHlOQ2llOXlqd21aUjJ0K1VJQVNPcFVKMThUS2lsbEYwcCtTNXdG?=
 =?utf-8?B?S1J3RVV5Qlh5eGtvQlNIalBvSGhzMnFlNDY2RFdNTytYK2NvWW51a2dIT0dv?=
 =?utf-8?B?U3lRMlNDVjJ2d3BDK1NabVlMR0VGRXpOOGdkUHlZM1RqUXpMSWYwbm0xNnlM?=
 =?utf-8?B?d0lhVXIya0tRMjRNVk4vNXE2SityYTRGR2R1ZHpTZEt6dk5reS9IUGhpODB4?=
 =?utf-8?B?aXp2ZGxveGN2c1dLejh0MElGVTYyTTdkNDlpaGZqdi9mNmlVSktrMG1Fbjc2?=
 =?utf-8?B?MUtuY3BTaWVKcVpQdlNscDQyY1F6RTUzZVRzb1ltUjdpbDA2NU9uT213dVRt?=
 =?utf-8?B?QW5uUWhnUHhYeHg4ajREakFXaUNWbFRHSWVZWHQ2V3NGMjd5OGhEOWFpTjN3?=
 =?utf-8?B?ZXpBNkx5ZjZsWElmMEFWTzVJUmdSaWhab2k0VnFCclNBdUltd2t1T2t3WEM5?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 335ad9fc-3ef1-4f2b-9121-08db0f33b0cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 09:04:48.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSi2QunlLt/icMLcrW/xdYF4dxJ2lqft4f+MdckZgbzSos8JR/e/yAhednW0Ypydhog3g9878x9srBiNQnh+JTu+KsGbCfnGtFG0Q8iPuvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
X-OriginatorOrg: intel.com

On 2023-02-14 7:01 PM, Josh Boyer wrote:
> On Tue, Feb 14, 2023 at 8:38 AM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:

...

>> Cezary Rojewski (4):
>>         intel: catpt: Add AudioDSP base firmware for BDW platforms
>>         intel: avs: Add AudioDSP base firmware for SKL-based platforms
>>         intel: avs: Add AudioDSP base firmware for APL-based platforms
>>         intel: avs: Add AudioDSP base firmware for CNL-based platforms
>>
>>    WHENCE                                             |  30
>> +++++++++++++++------
>>    intel/avs/apl/dsp_basefw.bin                       | Bin 0 -> 505632 bytes
>>    intel/avs/cnl/dsp_basefw.bin                       | Bin 0 -> 588040 bytes
>>    intel/avs/skl/dsp_basefw.bin                       | Bin 0 -> 243016 bytes
>>    ...sp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin | Bin 0 -> 12288 bytes
> 
> This fails check_whence.py
> 
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: intel/avs/skl/dsp_mod_7CAD0808-AB10-CD23-EF45-12AB34CD56EF.bin not
> listed in WHENCE
> [jwboyer@vader linux-firmware]$
> 
> Can you update it please?

Sorry for that, sending v2 with an update.


Regards,
Czarek
