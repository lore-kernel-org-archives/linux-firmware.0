Return-Path: <SRS0=2uLv=5E=amd.com=John.Allen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD64CCF9E5
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Oct 2025 22:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E4DAC4CEFB; Mon, 27 Oct 2025 22:32:18 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FCD5C4CEF1
	for <linux-firmware@kernel.org>; Mon, 27 Oct 2025 22:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FCD5C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYZdiht/CDLkTwzDgGuDCtGys38NgY7qjXoxhCNhiCyAPPe/A6X9kgWNY6eZNe/OgzKUMV7TVu5eBUO0u77voaPxNlH4MwUYsNXpY3vnKr5PuqEOiYHiftWiQAfnw2j2RywqMS7PWRSppDXVb8WFhDwozWy8q2zaMM2oRcjvW0rUgE+cjB0BgjlhshHlGQKds9gN7Ne3V0ozXCYcWM/VLjYcni9ZJF0JXSmpsRkU/N2fyUgyNPAMdSGcCp72I4Utz3BYOUmW3Fy1IIfWXUarkJMa9p7/xCfPgz5KI1vZB+KuHPWB/H5VkiFXoaY6URfQ2z27nibO32uhpdSZmdmqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxR6Xh3K7bReC5rPMkuUwfuGSOxwtdRlB9gjDGsgM/4=;
 b=h9Bi2GF1917s9t3F7uLkuqyuFoAIIE+LhLdPHwj1MlaLmaq+4ncNXFtSX8tHRVI4BxX5URFD+Xex/akm/hNFZQ/TXyaHfYPUymNhIlfNiuA2xC8NgTH/QxEu+L9p6usG7HuvYzkYXapFQn+bquyxdRhLdGQbr9x1WaoHb7vLDF076EjCHuwYxyPOPhKsHwPr8ip8D119vLL6N3U6wz95gWuD3odNbJG2tN2vwAWH6737xiXeEWJyRmiBYsVPY3IKBVlsv4CjAJYnjaEKDj/bSvHaWDS2RO1T1S7ZCoDhtGn8Z1gYABLuN7DFxqJfbbUrKDsiP7vx6moOqC7CCqXQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxR6Xh3K7bReC5rPMkuUwfuGSOxwtdRlB9gjDGsgM/4=;
 b=DG6TbIjhg7+zTPmWlxWWTXDgbJNINP0KDVQncrpTrBuCXhAbTi+Xs3hgydFo7Gnn6lQbVuc/qBU1tBlYkQMDvo33ZrPbXbW8aJuuHuwJU5iYeHzYRolGjPzeYA4LMe4O0KaCC6DTKDUAWM8oSvvOHPJr+GV0m2rxjHlNQ5yQZNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5995.namprd12.prod.outlook.com (2603:10b6:208:39b::20)
 by SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 22:32:10 +0000
Received: from BL1PR12MB5995.namprd12.prod.outlook.com
 ([fe80::4c66:bb63:9a92:a69d]) by BL1PR12MB5995.namprd12.prod.outlook.com
 ([fe80::4c66:bb63:9a92:a69d%3]) with mapi id 15.20.9253.011; Mon, 27 Oct 2025
 22:32:09 +0000
Date: Mon, 27 Oct 2025 17:32:05 -0500
From: John Allen <john.allen@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware <linux-firmware@kernel.org>
Subject: Re: [PATCH] amd-ucode: Fix minimum revisions in README
Message-ID: <aP/y5Zo4nNNocbJO@AUSJOHALLEN.amd.com>
References: <20251021132056.3158340-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021132056.3158340-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::19) To BL1PR12MB5995.namprd12.prod.outlook.com
 (2603:10b6:208:39b::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5995:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d687620-9a58-4c3b-b088-08de15a8aa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?85K4y9KyoTNDlLNyDLMwmmY1HnguQREbvKUDXnBQdN5uUdZYv6mDJ448AS68?=
 =?us-ascii?Q?7epXb30dOer0siuMB7RpMcx9Rlc6falXJ8uONIGtfQxkXr6BKQGNJMEJRPN/?=
 =?us-ascii?Q?eMVOEjMzdVCg99Bd+wM/6Sn+6dymgwuR6wI2k97uspDDACKUreKCulfEIrZF?=
 =?us-ascii?Q?A7uPPaa8lsOoUjhsYD289hpA5dA84CZokvDBWhy7iobuq71oW0kOVau1h/w/?=
 =?us-ascii?Q?dzZleD1X0XrW+/8X4wpcDtHNd9LKBykv4FUdgFPqNQZJszj88gDg22qvIULW?=
 =?us-ascii?Q?eQ2toIXehEGYrqSe7jayt4SL8oLK++sjRhnTYfb5A815SSTLPR0wrpjhCGKE?=
 =?us-ascii?Q?Ih0zS5VSg5OKMMquoiedWQ05mKjkCj3BF703Fc+zFtAq3J5wXylF3ReS5TJ2?=
 =?us-ascii?Q?tvjKIGeCB7bINlavqDJzAIQYW0YOojBm07/i3co3mP3xO5ntTt/iptuxAKJF?=
 =?us-ascii?Q?GKJyjMUeGa9kUOhIB7ItNJRRfoBKS9R32rzat8EC/76jX1K7k1rJ1ldWmc/l?=
 =?us-ascii?Q?CtU/43duQwuBBYSUCq11I4G5LHob0y0tRAmyACA5hFL5a+rIeazWq2lyZDDv?=
 =?us-ascii?Q?kLisoBsxIKNwe6P0hIFjAh3odS4pN/nvKeXNEDScbMHRRyc/DCDsBvolEtyG?=
 =?us-ascii?Q?2ab4/nkPa+E7WJNm3Hr5q08V142xgzE1oJkzKm7ACfhvSrc8Qjf3u0eCuRuY?=
 =?us-ascii?Q?GNEXduf/fuVJ1eutdMD6t+MXJutGALISZJDiK6NR10spFxWaNxZ0DOPMyj2+?=
 =?us-ascii?Q?QumUJ1F8Tjf38V2Ra9rFNwhTum/YlFhYsVT8U0cTE02pl+KhtHi//zTsrLYL?=
 =?us-ascii?Q?2T1VAWGY6dgERiHz1q0tBbX8/C12L2K8KV2f5yx8mgrZz6ur8zgH7Q106aRu?=
 =?us-ascii?Q?/FbUpVLdhmIQXJOua88jm5FX8z8zFWpphLHn78rfezmUTdxp/tPXVf7GlKXs?=
 =?us-ascii?Q?tppqLcDwDgIxVdYWDVAZOkMJMSfZcQ+NLGG2kysHuLSikLR5elxwNFBQSgPc?=
 =?us-ascii?Q?BgoVDLcmNPYXR8D4o6c5JfeyTtUVIodlWcP1BZ+YPfZAM77bPET4KvVes2qR?=
 =?us-ascii?Q?aPiKHbFFb7dWVw0QD6BzUZC05vD9/2GmIXS48tv6FjYO0cLDt7LRADyJQNzD?=
 =?us-ascii?Q?rlTPqYps44CTgSN/6eCkzXXokOEOhS2igfigjXItwa0gu6J6G0h8KcT7kaSq?=
 =?us-ascii?Q?J/HLh18F0+vswoGvDbRpSOKq+xnhvLEA3B96no2x3Mte8hSz/dYalHnDRR//?=
 =?us-ascii?Q?j5YRLXHZt2p6rTLLDZhI8L95zEaiTt2ATrhsBl2+fceKxVhpa6euBUrIkyR9?=
 =?us-ascii?Q?ujyYIRKsRqcylogHZSAt/+mcMAWAugp6TSOBPJfXTWywpjw+uUEglk0qga1V?=
 =?us-ascii?Q?RNjFRRktt6+rOqLv0kNuTAU28mfmmfjteHFj4DsbifPl3OCq2MXi2+43EG4S?=
 =?us-ascii?Q?BXa7TMD2fmsm94U4jFFgp6UGFMlkTaPw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5995.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mLtOQycXgejPsd+XU2MVukDlqBBAthAAPiRMhMizOQH9ImPwq6SJwIkT1zam?=
 =?us-ascii?Q?cea1egqSabQRLLJfqU+1TLC6yRzwrenkszzDf8UmERdL6WCQx7rqQtkCAcop?=
 =?us-ascii?Q?6yOUXU89Z/7d1sFuYcqCRqTL3ArN2Yau2M1md90JAy4JAgzggBrBvH7Ki894?=
 =?us-ascii?Q?aHLbweTiljT0ozSVHk4jTQ2/r7vUa/SB8z/di5M36qxUTHNGZHks91FV2bVI?=
 =?us-ascii?Q?a3hpv4RZx8uJy4gN0lXd3I5ZC1bc3fezKACwws3plkc97weOlZzb0khQp+v9?=
 =?us-ascii?Q?L6KRvJrLiIawyET/eXUlufz6m7uO0y+lxZhQKa16xd84sQXu6j8lXemK8VzS?=
 =?us-ascii?Q?h/2O4C6xUYE5TEa/JVubB/fh6fIL0whnpxruf9aDqmwcMN88pMkVFdYJ9L3z?=
 =?us-ascii?Q?Ve1XKPisam0pDK+b54sguoOxxR+3Xx8/GDqIPvqXbX+dFNzlGbRAlZKXjL07?=
 =?us-ascii?Q?Q2F98EfIqxt2VpemDrGb+u9f4jr5fhQUp0U3Q+kZsSg6fJttgLKfmijggHPe?=
 =?us-ascii?Q?NODcg5wn3nUODwh9sfwAlXpNpDDOpUsKdJLVhgYAynSbtyjFc8iriDjHRIY4?=
 =?us-ascii?Q?w4/hu76bmphon0RurIzRja+INkmjzBL2BC0LmVNeBijSRfEJngNfnvxekZQz?=
 =?us-ascii?Q?X0r3qn5WYSotbcjGSwVrlarSTuK8ZNpVirw+2CN55tMBBZyLnY5MxGDCVbvB?=
 =?us-ascii?Q?kK23A4FqWlTVyJFQDbqfv5vGDbBe/sv3JJ7HUt7+J8SPL7E3Wy0rCfJ/5BnQ?=
 =?us-ascii?Q?P3O6s4K//PVhciY934LUnm/T8JtwdBcZtzlXdUAIbuL1J/NM5HKMxezEDUmU?=
 =?us-ascii?Q?NOl6pLsiPcaIjWIEBxY8u7OT5R73/X+IzyeE/3cnLvfrm/+Wk57+n3eJ5Fxa?=
 =?us-ascii?Q?p3gAd7rnMgJfQza7yydRmHajsckV6iGLAiCTfFBUi26T2ylGiKdru1QKaoCA?=
 =?us-ascii?Q?xkTRqQxHOgf7wIfsF/e1/ydDdQqKPcndKxrBrMKOPiow2jus2ndnxTeTqfPP?=
 =?us-ascii?Q?0jYkJejSYvx3J1wPgLdgSJmkLmwUOE7I3JKnoMoDYM9jx+/vGpr5ACTm1EzN?=
 =?us-ascii?Q?ZlUctGJtBtov6kzPrBTBVVkcr5jXL93Fo4anhl7e5z7PTxOfC8u0UneKDbtN?=
 =?us-ascii?Q?QLzLQwbOIHGxwAgmIoXJOc33uHXsIk9/a//DjObsd8JIujEqTKEJIbcBY/zj?=
 =?us-ascii?Q?TxH44dmX+caY+50YHu+ar++EX+3TrJlAd+kK3mbTcwl+J5aA6vYaJTU+TX8Q?=
 =?us-ascii?Q?SxBdjvzXXLbkKc90EA4qclfMkJSTF/Q/AkHZ1cnRwZ5IuHwXSfZooZxbVbsC?=
 =?us-ascii?Q?j8ffQAtC/v5r73ZNAxBiOMd5p0BluFn2dld96UBBNuzyx60HrFZdfgX7doVl?=
 =?us-ascii?Q?AM6GwZQrb/ZVKflM/BHcIzG8pqkMtY9pIPPFZlyJbwU0pwAze7Wt9XV92Dv1?=
 =?us-ascii?Q?vuugNleLTlHFor54DOzfI1jdCGtLDz66GAY1V1DZ+TpaTkPqId++xa+vrjZR?=
 =?us-ascii?Q?UytmKSU9sWzhfFpr2Sb/GQX5x5+ZqcEHnkyTpoS+TNL3WnztntHoQIb7zHvw?=
 =?us-ascii?Q?pSgT0ctDhZaSZjNHG6M/6ofyuYqvt3IzRRS/rEV6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d687620-9a58-4c3b-b088-08de15a8aa79
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5995.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 22:32:09.3751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wr5RfNqhogKsOUFea2Y5kFYWvrpBsDJQwih6DQuizFRMDMInxToRrtK2xwkkUYLA9u1joggsieF0/+EdQJjfaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737

On Tue, Oct 21, 2025 at 02:20:56PM +0100, Andrew Cooper wrote:
> ... to match the minimum revisions stated in the binaries.

Thanks, yes these two minimum load revisions were typos and I can
confirm that the updated revisions are correct.

Acked-by: John Allen <john.allen@amd.com>

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: John Allen <john.allen@amd.com>
> ---
>  amd-ucode/README | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/amd-ucode/README b/amd-ucode/README
> index 669fbc19084d..0f6d6f9f5811 100644
> --- a/amd-ucode/README
> +++ b/amd-ucode/README
> @@ -62,13 +62,13 @@ Microcode patches in microcode_amd_fam19h.bin:
>    Family=0x19 Model=0x7c Stepping=0x00: Patch=0x0a70c008 Length=5568 bytes
>    Family=0x19 Model=0xa0 Stepping=0x01: Patch=0x0aa00116 Length=5568 bytes
>    Family=0x19 Model=0xa0 Stepping=0x02: Patch=0x0aa0021c Length=5568 bytes
> -    Minimum base ucode version for loading: 0x0aa00219
> +    Minimum base ucode version for loading: 0x0aa00218
>  
>  Microcode patches in microcode_amd_fam1ah.bin:
>    Family=0x1a Model=0x02 Stepping=0x01: Patch=0x0b002151 Length=14368 bytes
>      Minimum base ucode version for loading: 0x0b002140
>    Family=0x1a Model=0x11 Stepping=0x00: Patch=0x0b10104e Length=14368 bytes
> -    Minimum base ucode version for loading: 0x0b001040
> +    Minimum base ucode version for loading: 0x0b101040
>  
>  NOTE: For Genoa (Family=0x19 Model=0x11) and Bergamo (Family=0x19 Model=0xa0),
>  either AGESA version >= 1.0.0.8 OR a kernel with the following commit is
> 
> base-commit: 6a0152a5d1a9d7699e13ca7ed81df2caa1262a77
> -- 
> 2.39.5
> 
