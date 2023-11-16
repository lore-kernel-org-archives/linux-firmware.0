Return-Path: <SRS0=Y7O9=G5=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0B6C47071
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Nov 2023 16:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FD2AC433C7; Thu, 16 Nov 2023 16:57:06 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2067.outbound.protection.outlook.com [40.107.95.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE2DAC433C9
	for <linux-firmware@kernel.org>; Thu, 16 Nov 2023 16:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE2DAC433C9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLBHKbikuVFvzMoZie4nkKzuQjG40VrYWCWTvPx4aFnM0gTC4Vbp5jQiyVeUSTK+ii0paI5dpJ19/nkX2mOf+rZmmIWmJE6OsJ6N1dIU7pAaqByNljMlkqvUi8VGTMfVgwDo3O4QE7DdkU/6U4Q8EU1JJlGh2A+DHIKkAHdZ5QCTetKCMb1+1R9t1MjRHJsC1nwDqgONfEtVGQ2bl+JnXjB1nui/SY/3QNQzWVFSecr9Zv9Ys3EiknqRphAb5v8MqVy78wmzb2Y8XDUIdmgMW4nPVoD4ZPPKMqF4s3DqBk/aEDh5hR1Q8IYOdTbaI70sbQDxVWTkktMeVZmaL+nVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93S8fvUR2AGZ/STaYhSw4lmeuGvAazC/csyF+Td2otc=;
 b=EDFgUil89cpM35rdbKr2c3u9192YzbFCdTWsaU0qyhziNZREn7asrZ0fQU/UcFpuQJRIpShO7WVCW8F7AgiuscdbeEz52OWpApEsHiezDPr2qKMp3TaM8b189WQ2TCwiC4s3JIYsiZGHueKrjt1jqQnKYUkNoLQ+r3rezbOYhfsN0IVZD8Jt1ibIzmcTI+Lg02FgLZTklSlBMYXfBsZA/2DcNRSu+jdKuMrv2bQyX/btf0vpd0ZD9TU0764vKnLREHQopS8RaI9v4/z3b17tPvYLxWrT7i805BuNRMz+066SGKzNc9gTEOF8cw5HPJ/efCG8ncKKsOsneTXA+rfsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93S8fvUR2AGZ/STaYhSw4lmeuGvAazC/csyF+Td2otc=;
 b=yTT7NF9pPSRP+sVFKTUwXPkGLyV+b+x9sGGlyTKD0jS0bbTAWhmIXNGfX5GAlj0HknKwWd7SjG4Nw1BO8xTtJRgGtsCShCGWVlKEh/QzO4llZBzP3JDLq6PI08pSLyyl3BWEUZmeZmep1LOtqsupdT4lvwy2ghZCyTb7JPNS/Zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6384.namprd12.prod.outlook.com (2603:10b6:930:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 16:57:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 16:57:02 +0000
Message-ID: <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
Date: Thu, 16 Nov 2023 10:57:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Question: v20231111 adds rdfind dependency: why not at ball build
 time?
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Steffen Nurpmeso <steffen@sdaoden.eu>, linux-firmware@kernel.org
References: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 8127e316-440b-42f5-96d0-08dbe6c50dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycTET8evUDup4EAROMawX8TWyhG+IhJ06riXth7PyhklQDgjrn1sk5BB9q2dLYYPA+K/fyfmsv7szvSqlP4mUH8WSLbA6rq9HKwzewAlkEvpzkZHC/VL3QjfvvkpJFp1r5Aus2PHj/r/09EQ+4/lfHP6JUgq2k0ARxRUfswixahiOJA5qe3zrPzQTuANIszDgJWJUIOv7WhQEJXJw8XzRXXcBw95LY2dPDyF9Wib0XnolLpf8yc5gvsffjVhEG/p2ewR3qk+lLKEGOF7BpoKitEeUL/DbBiResvSA3gL5j41FPExegJ3WYf4sxrf+rNcpYbnE53PlTFzh8GPag14gMrOW6eHotFBKpbPVprCi8e/TKaC4QMpce+9cxV/JCTy098v+37gSY3jACYxW9VIOIo2LYs4vw/3q73atLalTznmacQRtaohR1rkh4Dm1jrInPWbQlrB1/mrOWVV7dNRX/oZqTe+Xb9ikTnz5P46H5AsAO6I5dmppOoVInnpAtXIxYpPad/KI1agafE+vbpXeA/mQMSWlIDnAmsa+FGYvvp/miSoqVpainDe8hTaT1i4jVXYEn5yf+E2Aa7bQvOWfieb8l/jjxtthQe5wLOV0t5i9EKiLKohiNOV3ZDRbZzQ6vp7BLGiQ3iN1JM4qhZMuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66476007)(66556008)(66946007)(316002)(83380400001)(2616005)(26005)(36756003)(53546011)(6506007)(6512007)(6486002)(478600001)(38100700002)(5660300002)(44832011)(31686004)(31696002)(41300700001)(2906002)(86362001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHFhT1NVRG1sR05paGdXR1hPQ1ErUXNVSUR5NUdKODc1MjhZdGN6Vk1YMXlq?=
 =?utf-8?B?cHFXMW5vNG1pMVlrT1VLcVNNVFVhOGNWWGcxVmZsYnkzUGdEYlRkT3ZPaENX?=
 =?utf-8?B?bG1hcjhMakRySnNYSmI1SWN2cjNBWFZlRWwxSzA1RXVEdk9TZTNJclNzZ3Fv?=
 =?utf-8?B?Sy9CUW1wbWpNZzBiV1Joc25XK29mYW1jaWRpK1R3VmMvbW5wTFFzSm9ISmZ6?=
 =?utf-8?B?N3FVNUx1S0Mwd3dNYnlpbml2ZUVvSEN3YXBYZHV4aVBXWjFMMWJBV21BTXIz?=
 =?utf-8?B?N1Y1ckJjOWNOcE14cW4rcTlxUGc5SHNSYzN5dXg5ZjJvVVh5Q3VHWS9YbjlB?=
 =?utf-8?B?aVMxMXFqSlhtQ1ZIbCtldHdGenc3MWIyRklHUnZldWlLTTAxaGYydytGNGxP?=
 =?utf-8?B?ZnNUem51d2sxMXZFNEdBaVFseDJRWjhQbWZLQXdKUERJUnJ5c0RXc3B0Wmda?=
 =?utf-8?B?eXl4TEcxckg1Y3ByK2t4ZFFhR3VFRDFSQlQxb0w1MGlFcnh1amlwMDhmR29y?=
 =?utf-8?B?UUZpMURWUmNIbHMwMTRVR3BNdlVPTVBrTldRUjRNQjdRYTJiNjIwbnk0MjNX?=
 =?utf-8?B?cnNOd3QwNDFRMDlOSUwrbjZBNEZkTDdhTVRySllZOWVibEMvN2Z0bGFXYWNH?=
 =?utf-8?B?MHR3bVJNT3dPd2l0K2FOODltNU5ncEdLY21EZlJxek9oNCsyY0o2dEN1U3lY?=
 =?utf-8?B?dUVWRWNhcFlaWHkvdlpObTlickVjM25KLzNWN3UzeFVwTUgwb0ViNm80NHhM?=
 =?utf-8?B?eW52cXBIODNwbHAvRzY5YUtnNEZZN09FcDB1UEFhZ0U4RWt1YXJUYUF3QU5t?=
 =?utf-8?B?S1hTSW1NVDBXdkw4R0VaTkx2MitsdGljaDV5WTluUFFYUTNjL0xFSTYzT05X?=
 =?utf-8?B?cXJINUQ5cDNXZkxLSmNac0Y2NHQvbjJQT29BeGMyc1JaelcrVHRNbEtkVHJr?=
 =?utf-8?B?YUwyRlNpVW5CTWRSWUk5QjFTZzI0WG42eFNmT0RFY014TDRzODJXK0sxc2RH?=
 =?utf-8?B?NVYxTjhiVGRleTBCN0RMWXQ2SFdrTmhWRS9heHhLYlNLY0pyZkhTRGpEYWVN?=
 =?utf-8?B?dWF4TkFjcFIvYzMxbUJsVllVa09GQ1EzSk9CMlhzMmpGOWhlcjNYK0NEVDlV?=
 =?utf-8?B?akJ6N1l3VkJ6SmRxemplTlRMM0JuYUtrWGVhS1RMbUFqazE3ZG5PSy81Mk5S?=
 =?utf-8?B?eUdTc2xFSFZBTlNQQytYUm0zOXU4NVJoR3RwMjRGR2xhSDRYMjlsOXlMV2hn?=
 =?utf-8?B?Qm1qZlZTTW5COFNVVUhCb1ZubkM1NGFic1NlSmpKak9hcTdIcW83SlJhMUpQ?=
 =?utf-8?B?VHIyeVU3eFFpeDd0RTRLT3oyN3k2SDR6N0dHWERmVW00bUhsY1hZV1ZmVHRM?=
 =?utf-8?B?OXhEaCtnUTVBaVVDT2kwTnZqby9wSW5yQmN1QlFsTWtmZU1qUzFqNnpLWmtl?=
 =?utf-8?B?NGh4K3lFeURzSGdzVkRMd3pZa3dUR0RxUmZKVXlXZUZGaDlzSTF0Zmk5dEs0?=
 =?utf-8?B?QVFRaDRjVWZHWUdxMUdWeVJ4MzZpZWRPTkFFdHJ6R2tGdGNYMmtvVmlaYWw4?=
 =?utf-8?B?Q0ZCRmtOTXd5YnR5ZEQ3UlQ1elM3YXBnc1lra2ZXcnM5dktINkN6NTYyMlVw?=
 =?utf-8?B?RVNENmYxRENaVUozeDBVaVZhLzNFdjA0QVNObkEyTTY3OStqWm9kV1NPaG1o?=
 =?utf-8?B?dUZQMHlOc0FuTVNXbDh2eXYrVkxoakNjZVhuUXNac3A1WmVsbEp1U2dQMTlW?=
 =?utf-8?B?UzBJalVzS1hzcW42VGMxTVZFVGhDY2IrdUthM09UWUN6K2NIdGxkcUVFd2xR?=
 =?utf-8?B?QjdpQTZyVUo5aDdqY29wdUY5NlQ5YnZVS09VYXhRcFNzQmpxWk85UGJmM2tM?=
 =?utf-8?B?NXNXV0FUeVF3RjVraTJtUWxpOUlOYkVjNzZaTkNCeCtnR1IyVXpHbG1jQWZT?=
 =?utf-8?B?aHkzRWwvVHNLMEdxQjVCQkFzV2NOc0tPSXlRNDBudEowNm5LTTBSRDhWSmlS?=
 =?utf-8?B?a1dPKzJCWW9ON21ZYUVDS1JBZGxNd0lnMnR4YWR1ZU5BdGZlWllXeDFZSHBz?=
 =?utf-8?B?clcyU0pHOUo5MDN6ajdaZEYzaEV6Z1ZGQmI1ZGVmcVBRd1JlVlJrc2pNVTFt?=
 =?utf-8?Q?jVM+thZwsSR9ZnhPGcoTO2Tmf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8127e316-440b-42f5-96d0-08dbe6c50dc9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 16:57:01.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvH3qX7PsbLegcmNykUjiIdy9eD0BGUbrFGcJvJ3lkvnOJqG64N7CVQUy0zBSuRNc2YrTN3fbzkqqrriQaNfYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6384

On 11/13/2023 15:53, Steffen Nurpmeso wrote:
> Hello.
> 
> I see my Linux distro updating its package, and adding hard
> rdfind(1) dependency because that copy-*.sh file uses it (and even
> added an error-out if not available).
> 
> That made me wonder two times: first of all i like that duplicates
> vanish, but that is not "a killer".  People downloaded the ball,
> and then they get thrown out because the ball is to be slimmed on
> their box.  And then, why is the ball slimmed-down on all those
> myriads of user boxes after having been downloaded, instead of
> once when the ball is created during release?  That is so strange,
> you know?

I believe it's because of the way it's created and signed it's not 
possible to run a build action before creation.

Another possibility is that we can just run rdfind on the repo and store 
a bunch of symlinks but I worry that if a vendor submits a binary that
used to be the same for two products but no longer is it will lead to 
unexpected results.

> 
> Thank you for all your effort.  (Not subscribed.)
> 
> --steffen
> |
> |Der Kragenbaer,                The moon bear,
> |der holt sich munter           he cheerfully and one by one
> |einen nach dem anderen runter  wa.ks himself off
> |(By Robert Gernhardt)
> 

