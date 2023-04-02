Return-Path: <SRS0=CErx=7Z=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C83C7619A
	for <linux-firmware@archiver.kernel.org>; Sun,  2 Apr 2023 13:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40D2DC433D2; Sun,  2 Apr 2023 13:55:36 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B652C433EF
	for <linux-firmware@kernel.org>; Sun,  2 Apr 2023 13:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B652C433EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgTWbqHtOjQmhFRQPtCNMWzu8X4KRvny3a6guyNOShs6VJXKiv6Gr/BDI68pGUESDXVDS+CtjShz3cdQuS8qeenDpE3ngBZBCnNlop79rkBVot7eHDdf08xtP9H+npJC0oV2eRkGXK24m2U1PyPOagxHUCpWzZ+XjxxUy11Q2ItQdJVX1FpWus9R9Y/Jyje2Pas/o09p+CBHPXwtfRSRrioxdmQUE/4bc2I2CzETrreFA6A/1wcAroFnfOOEsOPWRCeAW0jw+dTY+JuxtdDZmccz8Bl/ytl2kl7bGfWjTE7OAoO2xvsrxQ5ILCFwtuaElMzFV9VGOeAYCHVfgilwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90hfnVn4r/DWswKnCUDzQXMrgUWJKlyxHnhduc2CV5g=;
 b=ZuHDwxjQuryrveQRL6S4/EiuzyKR06Rp9r5USnf2FXDxa4s9e7h5udUszMEf7Zd1RBe3xOeD3vx9225tnpijc84LSxXG0gVgiako3XcW6PC2RfjBL6AMh09bn3f1j81lJiKb2sSlJe1We50iFOP5WeZqK7pxANjFN8F0cIojEUgoao5izb2SX4aGEEMInRWB3UHMTwwWO85SqEh24LeEd36/oysj0H6CrQ9IJ+ncri7H+qHsmyjo+0+26lLiJDxY8I8wyT5JjHdgTCNnBh/RMOrtM5OkYjUEP9RPg7ooHVVUN3+E49OoF5c1g4kjAhWroemLIGO9kw7J29gI/LNiNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90hfnVn4r/DWswKnCUDzQXMrgUWJKlyxHnhduc2CV5g=;
 b=dNhs98WSnIIqmQt6uRWIU8FRupUeTu9fLoRC6VgoI/gCobuZeof9QcrhCz9oMbROYfD+M31wVGvIGAUSpePxRxc7+roY/6eriKq4O2GotkvPhzeeoh4gbW6w88e+UQromTyKcZYatQgTyLfW1Vq2i0E3Q2PJPz/21UsXv9zquD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Sun, 2 Apr
 2023 13:55:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6254.028; Sun, 2 Apr 2023
 13:55:30 +0000
Message-ID: <4e12ab4f-5ad6-d779-1b06-cfef30b99c41@amd.com>
Date: Sun, 2 Apr 2023 08:55:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC] global: de-duplicate files with symlinks
List-Id: <linux-firmware.lore.kernel.org>
To: Adrien Nader <adrien@notk.org>, linux-firmware@kernel.org
References: <20230331115739.bytw7s35aacgrqic@notk.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230331115739.bytw7s35aacgrqic@notk.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: e123798f-51ac-4b1f-55a7-08db3381ebaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G5tkyCaFSyraIRSMAGMxjUApVrZexkj2t6S2K7TG+c8m6a0fBmHvgRrG74/V53ftUG797q5T17ytPOA13rhLQIDyZ3pWaGwzif5M81FFdhejO5uez6dVasWsGH9IMLV9pI9Oo1VyuTy3V0Y6abi7YasjmjEK56qMWE8pj3xleLoc2CR9HCxjx5qiDTqoWj9cFgnl/8P0ep9fWhp/uyJ0L0WoMpGqKj7hPwI5Sex3cJAJminUgg0tqZnBw5qHmvOGY+O/3RQYPE9UHMPO2Xpny4aSGu3o8Jvvx0CbP3+ArIH5vyUNfHHA1xjo0QiVDHVN5S5U9wiWo8ogEC0VwVlZ/z1u6u+b3WvwDKQxLYJy0TuDcoEJHyJQ7BgpzeRLpRGDYqdRnCzy+VNXXjxNq/81ovUnNyNeyyZyv8sXn0go87pEa7Xp9Uyx1fyzbt3ohUOo8JR91u+5WGPy2lOvcrcgOIg9azoPkaKqU741aV/Amv0M9eI4ycD87NQDA9JDGBXF3cl4kO6VIawUvuRYUITaQZaxqEy3V/YDfkvDadZtpvXs6e858VbufRHINpMbV8vCul03yFING8G/gDsG6qyke6BBANXjXaZNX2CbxOuGPq+YAYS/mWxkIfnMhyhX7o+nLrzDBFn8RnjTIzvW7ODdEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(41300700001)(8936002)(316002)(30864003)(5660300002)(31696002)(38100700002)(86362001)(19627235002)(44832011)(31686004)(66476007)(66556008)(66946007)(8676002)(83380400001)(478600001)(2906002)(6486002)(2616005)(186003)(36756003)(6512007)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGZFa3BzVHFPMmtLUy9MZ1FJVjg3NkdsSVlQUFJVcWFFNWlXTWZsZ0pVS3dY?=
 =?utf-8?B?aW1jOTZsa3BsOWI1dUtHUFZUbTBGNjBDRmVZYUY3enlySmdMcTUrSFBrMUVq?=
 =?utf-8?B?bVRtU3VPeW9xZzhpRHVwWUxncVRraHRPbHBQektsSE1YNStyWlFtRkhTRnRT?=
 =?utf-8?B?WjJFNXlKMkRhcUlML2R6YTRVUXFzRll0YkNiVTl3MUw4YzhMRUxPTHNZNmZ3?=
 =?utf-8?B?M05UYk9maFJJa2dKVEMyeWlhNnZySkpPak9nSXJ6VVd5N1JURkt4bzFtWHdk?=
 =?utf-8?B?YU12K1dtWnlZeUdQZlJXUWRQTU55UkJqNkltUytGVU1RTHgrVGRZbC9WTnVa?=
 =?utf-8?B?ZFRRSEY2OTM3MVZERlhTMGhiYlR1ekxqUEMvUE9remxnWTRHOUg4NDJyRXRX?=
 =?utf-8?B?V0FTZy9LSVBaT0JzM0MwaW5vaGhIa0NENHdCSzEzMVlmeDJNd1Nhd2ZZV1lI?=
 =?utf-8?B?a3Q0MiszSUVRVXhBUkYxWFcwK0VOZStNd09tQjNQUHczRkJSaG40UTdSZmtz?=
 =?utf-8?B?QnFRT1NlbS9OMEVrSS90bHF6M0hOMHFUSC9HMWFzcWp4VDNaSDk1QVN3SGNH?=
 =?utf-8?B?cGp6OHZsSndNOThXN0QyTEh4MWlqWm5UYzVtUVJ0MjNjcFU3MXlRSmd3VFJn?=
 =?utf-8?B?bWNETjJ2UTJkQytZY1dlaUV1Mjg5WnhXNDNVU0NleDdIa1FKVDJacnJiRHd5?=
 =?utf-8?B?NzAxR1FzSlJqU212ZTFqUC9ZQjZrWnE5ZG83V2g0NzJCdTVhYlpJT1ltRDNR?=
 =?utf-8?B?dVRQT2RuZ2RxZFFmeGtBeVZ2VmVRNXZ0SGdlSURlYWZDdno5bVloS3ZqempQ?=
 =?utf-8?B?MHJTaUZnV0gwbWkwanBuN04xQVAzdXhGQTdZeDFBS21sMWVQN0tpcDZZQ2Zj?=
 =?utf-8?B?Sm1GRVBUYzZjU1lxMmJBL3A3bFI2d0RoTkp2L3pPb2ZrNWt1SGlqYzRPYSth?=
 =?utf-8?B?UFlySVEwWUZhdHdDSFJTcU5JSTBhdUJZd0NjZTdnTUhwWGk0bzlFZ3JhUy9k?=
 =?utf-8?B?RFVpOFpCdGRiVlBwTnFmbXlHeG8vOXluSTAxL2VVNjNkVlZjemJwb0piY1Ns?=
 =?utf-8?B?TmhRYTFUNHZYaDhmSXFORjFFM1IzR3ZJQllQalRURmZ3Z1oyajRsQXRTM2dH?=
 =?utf-8?B?RUJPbWtkUHJCNjhWTzF2WG9OK2pYbkN6WWo1eXRXV2NBNTBybXRDTXlHaG1a?=
 =?utf-8?B?M3hXc290TzhHY2tkKzlrNDBxMkpJN3NhMkEvMk81UzAzVGVMLzVKRkV2cFZr?=
 =?utf-8?B?YVlTWUhBZWlpenpsdE9TUFlncmtDQXg0L21IUG1xaitJb2xlVzlld3hvMmcz?=
 =?utf-8?B?Um1JUGlEMURRUjZHVFRHMFVHM1RYaEdxUzNtV0NRemd3ckovdy80K0hmejla?=
 =?utf-8?B?bUxtcHdYM1lQYWd6TzNXaS9raVdsVmdmTkxtOE9CeWg1d0Uza2ZObVlocDBm?=
 =?utf-8?B?Z2VuSmxFRTdCbGM0UThGcy9XMWRlRGhOOGhodGR2Tmg4ZkhFUGUzSnhxamxy?=
 =?utf-8?B?UzJzQnE4cy9wVUUvcHJhbDdpTTI4SmlWWjN6Mk52bkh4c3ZIOU1pOU5zU0ZK?=
 =?utf-8?B?cDdCR2UwUTRhOUw5TXFvbmxNRzZ2ck9kaXZJUFVNMU9vVGQ0cFFObVpLTldp?=
 =?utf-8?B?VDYzUENwM0ZEb09rUXNaZ3NxTTB2d1BxRzd1U3NJbVpqTlNjT0lpTEpialBp?=
 =?utf-8?B?aWFRQlNYZGFmNGt5REVuQTRiYnl0TE05MzJ1c3VoYTJIc1VzQzkxZVBQTVpx?=
 =?utf-8?B?V2JYcWxtYk95czJNejA1Y1Vtei8vUXhWSVQ4Zjh2SC83N2l4b0JjNWdmUU9J?=
 =?utf-8?B?UWRsWTdFZEtrSzFXK1ptVWJJRm82TzlhUFMyWUhNVWJEemdhbmRRTWFVWG1k?=
 =?utf-8?B?NXRzNlQ0OWNFR1JZVzdhU01pTUpMdkdUMC9lSU5YOUVkUGRxUXZRNnJUN043?=
 =?utf-8?B?TnN3NEtBem05Y0xmVnhvS1V0NlVvcXJoSXZmcEx2RjZReVVaZ2s2M1YzQnRm?=
 =?utf-8?B?V0U1ZHZTcXR1WlpBdXMyMUhJZjNFdlowdnFiZDZmS3JHTU9mVmdmQnZjNlVl?=
 =?utf-8?B?bEtKTjBVMlkyOUVpTW5DWEtvd2VoT2N3S2xPbTh6YVdOdHhRMHU2TXRzMTYr?=
 =?utf-8?B?SmhFdUxoUDc2a0d6ZVo5VTZldFJDSTVtaFIxYmo2UHZBbG50S3Rud0UwbE44?=
 =?utf-8?Q?di7gvBKPw3KX336HyDiWKiI+/AdeuaQwSWlagpZjiAOJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e123798f-51ac-4b1f-55a7-08db3381ebaf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 13:55:30.3205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5zNigQO09B2VwqyXW6qbLxktPiOceZoo1WoDBSDt49bi5rKIC4ndcXGK908A9HCRZBBqsaH8smGviXRDM4x7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384

On 3/31/23 06:57, Adrien Nader wrote:

> Hi,
>
> I initially wanted to post a patch but I think this warrants some
> discussion instead: de-duplication only works if further commits don't
> introduce duplicates. This is doable but also a change of habits and an
> extra step.

I think you can tie it into the check step in the Makefile.

We've talked about CI that runs that for pull requests.  The

conversation stalled, but this would certainly be a prerequisite.

> I'd like to discuss this nonetheless in order to reach a conclusion as
> to where is the best place for this de-duplication: linux-firmware.git
> or distributions when packaging.
>
> I ran jdupes on the repository. More precisely the following:
>
>    jdupes -rSHl --ext-filter=nostr:./.git/ .
>
> Summary:
>
>    Scanning: 2900 files, 302 items (in 1 specified)
>    346 duplicate files (in 195 sets), occupying 34 MB
>
> Since these files are often put in initrds and compressed, I've also
> compressed the output of git archive --format=tar.
>
> Compression                     HEAD        patch       reduction
> ========================================================================
> none                            906240000   871567360   34672640 (3.83%)
> lz4                             505770148   484870257   20899891 (4.13%)
> zstd                            349805171   343648683   6156488  (1.76%)
> xz --lzma2=preset=0,dict=8M     278950408   280633320   1682912  (0.60%)
> xz --lzma2=preset=0,dict=1536M  264220784   264429304   208520   (0.08%)
>
> Compression with larger dictionaries is less impacted because the
> dictionary is large enough to spot identical files even though they're
> spread over the place (but distros tend to not use large dicts). It is
> also worth mentioning that duplicates can hinder compression of other
> files by taking space in the dictionary windows.
>
> Overall this gives a slight but noticeable gain with no drawback that I
> know of. The only question is probably whether there will be a policy to
> only push de-duplicated files here and if so, how it will be
> enforced/verified (pre-commit hooks which runs jdupes?).
>
> If this is not done in the git repository, it probable makes sense to
> announce that downstreams should do it themselves. I don't think that's
> a lot of work (I guess I can integrate that in Ubuntu in a few minutes);
> people just need to be made aware they're the ones supposed to do it.
>
> Best,
>
> PS: git --stat below:
>
>   adaptec/starfire_tx.bin                      |  Bin 832 -> 15 bytes
>   amdgpu/aldebaran_mec2.bin                    |  Bin 268576 -> 17 bytes
>   amdgpu/aldebaran_sjt_mec2.bin                |  Bin 268576 -> 21 bytes
>   amdgpu/arcturus_mec2.bin                     |  Bin 268576 -> 16 bytes
>   amdgpu/beige_goby_mec2.bin                   |  Bin 268720 -> 18 bytes
>   amdgpu/carrizo_mec2.bin                      |  Bin 262784 -> 15 bytes
>   amdgpu/carrizo_sdma1.bin                     |  Bin 10624 -> 16 bytes
>   amdgpu/cyan_skillfish2_mec2.bin              |  Bin 268592 -> 23 bytes
>   amdgpu/dimgrey_cavefish_dmcub.bin            |  Bin 112116 -> 20 bytes
>   amdgpu/dimgrey_cavefish_mec2.bin             |  Bin 268592 -> 24 bytes
>   amdgpu/dimgrey_cavefish_ta.bin               |  Bin 218368 -> 17 bytes
>   amdgpu/fiji_mec2.bin                         |  Bin 262824 -> 12 bytes
>   amdgpu/gc_10_3_6_mec2.bin                    |  Bin 268592 -> 17 bytes
>   amdgpu/gc_10_3_7_mec2.bin                    |  Bin 268592 -> 17 bytes
>   amdgpu/green_sardine_mec2.bin                |  Bin 268048 -> 21 bytes
>   amdgpu/hawaii_sdma.bin                       |  Bin 4456 -> 16 bytes
>   amdgpu/hawaii_sdma1.bin                      |  Bin 4456 -> 17 bytes
>   amdgpu/hawaii_uvd.bin                        |  Bin 232752 -> 15 bytes
>   amdgpu/hawaii_vce.bin                        |  Bin 101072 -> 15 bytes
>   amdgpu/kabini_sdma.bin                       |  Bin 4456 -> 16 bytes
>   amdgpu/kabini_sdma1.bin                      |  Bin 4456 -> 17 bytes
>   amdgpu/kabini_uvd.bin                        |  Bin 232752 -> 15 bytes
>   amdgpu/kabini_vce.bin                        |  Bin 101072 -> 15 bytes
>   amdgpu/kaveri_ce.bin                         |  Bin 8832 -> 13 bytes
>   amdgpu/kaveri_me.bin                         |  Bin 8832 -> 13 bytes
>   amdgpu/kaveri_sdma.bin                       |  Bin 4456 -> 16 bytes
>   amdgpu/kaveri_sdma1.bin                      |  Bin 4456 -> 17 bytes
>   amdgpu/kaveri_uvd.bin                        |  Bin 232752 -> 15 bytes
>   amdgpu/kaveri_vce.bin                        |  Bin 101072 -> 15 bytes
>   amdgpu/mullins_ce.bin                        |  Bin 8832 -> 13 bytes
>   amdgpu/mullins_me.bin                        |  Bin 8832 -> 13 bytes
>   amdgpu/mullins_mec.bin                       |  Bin 17024 -> 14 bytes
>   amdgpu/mullins_pfp.bin                       |  Bin 8832 -> 14 bytes
>   amdgpu/mullins_sdma.bin                      |  Bin 4456 -> 16 bytes
>   amdgpu/mullins_sdma1.bin                     |  Bin 4456 -> 17 bytes
>   amdgpu/mullins_uvd.bin                       |  Bin 232752 -> 15 bytes
>   amdgpu/mullins_vce.bin                       |  Bin 101072 -> 15 bytes
>   amdgpu/navi10_mec2.bin                       |  Bin 268592 -> 14 bytes
>   amdgpu/navi12_asd.bin                        |  Bin 172544 -> 14 bytes
>   amdgpu/navi12_mec2.bin                       |  Bin 268592 -> 14 bytes
>   amdgpu/navi12_vcn.bin                        |  Bin 402112 -> 14 bytes
>   amdgpu/navi14_asd.bin                        |  Bin 172544 -> 14 bytes
>   amdgpu/navi14_mec2.bin                       |  Bin 268592 -> 14 bytes
>   amdgpu/navi14_mec_wks.bin                    |  Bin 268592 -> 19 bytes
>   amdgpu/navi14_vcn.bin                        |  Bin 402112 -> 14 bytes
>   amdgpu/navy_flounder_dmcub.bin               |  Bin 112116 -> 20 bytes
>   amdgpu/navy_flounder_mec2.bin                |  Bin 268592 -> 21 bytes
>   amdgpu/navy_flounder_ta.bin                  |  Bin 218368 -> 17 bytes
>   amdgpu/navy_flounder_vcn.bin                 |  Bin 577776 -> 24 bytes
>   amdgpu/oland_ce.bin                          |  Bin 8832 -> 13 bytes
>   amdgpu/oland_me.bin                          |  Bin 8832 -> 13 bytes
>   amdgpu/picasso_mec2.bin                      |  Bin 268064 -> 15 bytes
>   amdgpu/pitcairn_ce.bin                       |  Bin 8832 -> 13 bytes
>   amdgpu/pitcairn_me.bin                       |  Bin 8832 -> 13 bytes
>   amdgpu/pitcairn_uvd.bin                      |  Bin 219928 -> 13 bytes
>   amdgpu/polaris10_mec2.bin                    |  Bin 262824 -> 17 bytes
>   amdgpu/polaris11_ce.bin                      |  Bin 8852 -> 16 bytes
>   amdgpu/polaris11_ce_2.bin                    |  Bin 8852 -> 18 bytes
>   amdgpu/polaris11_mec2.bin                    |  Bin 262824 -> 17 bytes
>   amdgpu/polaris11_sdma.bin                    |  Bin 12692 -> 18 bytes
>   amdgpu/polaris11_sdma1.bin                   |  Bin 12692 -> 19 bytes
>   amdgpu/polaris11_uvd.bin                     |  Bin 375424 -> 17 bytes
>   amdgpu/polaris11_vce.bin                     |  Bin 166816 -> 17 bytes
>   amdgpu/polaris12_mec2.bin                    |  Bin 262824 -> 17 bytes
>   amdgpu/polaris12_sdma.bin                    |  Bin 12692 -> 18 bytes
>   amdgpu/polaris12_sdma1.bin                   |  Bin 12692 -> 19 bytes
>   amdgpu/polaris12_uvd.bin                     |  Bin 375424 -> 17 bytes
>   amdgpu/polaris12_vce.bin                     |  Bin 166816 -> 17 bytes
>   amdgpu/raven2_mec2.bin                       |  Bin 268048 -> 14 bytes
>   amdgpu/raven2_vcn.bin                        |  Bin 365536 -> 15 bytes
>   amdgpu/raven_gpu_info.bin                    |  Bin 316 -> 20 bytes
>   amdgpu/raven_kicker_rlc.bin                  |  Bin 39140 -> 15 bytes
>   amdgpu/raven_mec2.bin                        |  Bin 268048 -> 13 bytes
>   amdgpu/raven_sdma.bin                        |  Bin 17408 -> 16 bytes
>   amdgpu/raven_vcn.bin                         |  Bin 365536 -> 15 bytes
>   amdgpu/renoir_mec2.bin                       |  Bin 268064 -> 14 bytes
>   amdgpu/renoir_rlc.bin                        |  Bin 39928 -> 21 bytes
>   amdgpu/renoir_sdma.bin                       |  Bin 17408 -> 22 bytes
>   amdgpu/renoir_vcn.bin                        |  Bin 401856 -> 21 bytes
>   amdgpu/sienna_cichlid_dmcub.bin              |  Bin 112116 -> 20 bytes
>   amdgpu/sienna_cichlid_mec2.bin               |  Bin 268592 -> 22 bytes
>   amdgpu/sienna_cichlid_vcn.bin                |  Bin 577776 -> 24 bytes
>   amdgpu/tahiti_ce.bin                         |  Bin 8832 -> 13 bytes
>   amdgpu/tahiti_me.bin                         |  Bin 8832 -> 13 bytes
>   amdgpu/tahiti_pfp.bin                        |  Bin 8832 -> 16 bytes
>   amdgpu/tonga_mec2.bin                        |  Bin 262824 -> 13 bytes
>   amdgpu/vangogh_mec2.bin                      |  Bin 268720 -> 15 bytes
>   amdgpu/vcn_4_0_4.bin                         |  Bin 367136 -> 13 bytes
>   amdgpu/vega10_mec2.bin                       |  Bin 268064 -> 14 bytes
>   amdgpu/vega12_mec2.bin                       |  Bin 268048 -> 14 bytes
>   amdgpu/vega20_mec2.bin                       |  Bin 268064 -> 14 bytes
>   amdgpu/vega20_vce.bin                        |  Bin 173856 -> 14 bytes
>   amdgpu/vegam_uvd.bin                         |  Bin 375424 -> 17 bytes
>   amdgpu/verde_ce.bin                          |  Bin 8832 -> 13 bytes
>   amdgpu/yellow_carp_asd.bin                   |  Bin 168448 -> 18 bytes
>   amdgpu/yellow_carp_mec2.bin                  |  Bin 268720 -> 19 bytes
>   amdgpu/yellow_carp_ta.bin                    |  Bin 205824 -> 17 bytes
>   ar3k/1020200/ar3kbdaddr.pst                  |    2 +-
>   ar3k/30101/ar3kbdaddr.pst                    |    2 +-
>   ar3k/ramps_0x01020201_40.dfu                 |  Bin 264 -> 23 bytes
>   .../hw3.0/notice_ath10k_firmware-sdio-6.txt  | 1353 +----
>   .../hw1.0/notice_ath10k_firmware-6.txt       | 1353 +----
>   .../hw1.0/notice_ath10k_firmware-sdio-5.txt  | 1129 +----
>   .../hw1.0/notice_ath10k_firmware-5.txt       |  329 +-
>   .../hw2.0/notice_ath10k_firmware-5.txt       |  590 +--
>   .../hw1.0/notice_ath10k_firmware-5.txt       |  590 +--
>   ath11k/IPQ6018/hw1.0/Notice.txt              | 4095 +---------------
>   ath11k/IPQ8074/hw2.0/Notice.txt              | 4095 +---------------
>   ath11k/QCN9074/hw1.0/Notice.txt              | 4095 +---------------
>   ath6k/AR6003.1/hw2.1.1/bdata.WB31.bin        |  Bin 1792 -> 14 bytes
>   ath6k/AR6003/hw1.0/bdata.WB31.bin            |  Bin 1024 -> 14 bytes
>   ath6k/AR6003/hw2.0/bdata.SD31.bin            |  Bin 1792 -> 37 bytes
>   ath6k/AR6003/hw2.0/bdata.WB31.bin            |  Bin 1792 -> 37 bytes
>   ath6k/AR6003/hw2.1.1/bdata.SD31.bin          |  Bin 1792 -> 37 bytes
>   ath6k/AR6003/hw2.1.1/bdata.SD32.bin          |  Bin 1792 -> 23 bytes
>   ath6k/AR6003/hw2.1.1/bdata.WB31.bin          |  Bin 1792 -> 37 bytes
>   ath6k/AR6003/hw2.1.1/data.patch.bin          |  Bin 140 -> 37 bytes
>   ...5l41-dsp1-spk-cali-104312af-spkid1-l0.bin |  Bin 1976 -> 44 bytes
>   ...5l41-dsp1-spk-cali-104312af-spkid1-r0.bin |  Bin 1976 -> 44 bytes
>   ...5l41-dsp1-spk-cali-10431a8f-spkid1-l0.bin |  Bin 1968 -> 44 bytes
>   ...5l41-dsp1-spk-cali-10431a8f-spkid1-r0.bin |  Bin 1972 -> 44 bytes
>   ...5l41-dsp1-spk-prot-104312af-spkid1-l0.bin |  Bin 4920 -> 44 bytes
>   ...5l41-dsp1-spk-prot-104312af-spkid1-r0.bin |  Bin 4920 -> 44 bytes
>   ...5l41-dsp1-spk-prot-10431a8f-spkid1-l0.bin |  Bin 4944 -> 44 bytes
>   ...5l41-dsp1-spk-prot-10431a8f-spkid1-r0.bin |  Bin 4948 -> 44 bytes
>   ...5l41-dsp1-spk-prot-17aa3855-spkid1-l0.bin |  Bin 5008 -> 44 bytes
>   ...5l41-dsp1-spk-prot-17aa3855-spkid1-r0.bin |  Bin 5012 -> 44 bytes
>   i915/dg1_huc_7.9.3.bin                       |  Bin 589888 -> 11 bytes
>   i915/tgl_huc_7.9.3.bin                       |  Bin 589888 -> 11 bytes
>   intel/dsp_fw_glk_v3366.bin                   |  Bin 505608 -> 21 bytes
>   intel/dsp_fw_release_v3402.bin               |  Bin 247112 -> 20 bytes
>   intel/ibt-0040-1020.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-0040-2120.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-0040-4150.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-0041-0041.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-1040-0041.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-1040-1020.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-1040-2120.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-1040-4150.ddc                      |  Bin 9 -> 12 bytes
>   intel/ibt-17-1.ddc                           |  Bin 14 -> 14 bytes
>   intel/ibt-17-1.sfi                           |  Bin 625216 -> 14 bytes
>   intel/ibt-17-16-1.ddc                        |  Bin 9 -> 12 bytes
>   intel/ibt-17-16-1.sfi                        |  Bin 675372 -> 12 bytes
>   intel/ibt-18-0-1.ddc                         |  Bin 14 -> 14 bytes
>   intel/ibt-18-0-1.sfi                         |  Bin 625216 -> 14 bytes
>   intel/ibt-18-1.ddc                           |  Bin 14 -> 14 bytes
>   intel/ibt-18-1.sfi                           |  Bin 625216 -> 14 bytes
>   intel/ibt-18-16-1.ddc                        |  Bin 9 -> 12 bytes
>   intel/ibt-18-16-1.sfi                        |  Bin 675372 -> 12 bytes
>   intel/ibt-18-2.ddc                           |  Bin 9 -> 12 bytes
>   intel/ibt-18-2.sfi                           |  Bin 675372 -> 12 bytes
>   intel/ibt-19-0-0.ddc                         |  Bin 9 -> 12 bytes
>   intel/ibt-19-0-1.ddc                         |  Bin 9 -> 12 bytes
>   intel/ibt-19-0-1.sfi                         |  Bin 801128 -> 14 bytes
>   intel/ibt-19-0-3.ddc                         |  Bin 9 -> 12 bytes
>   intel/ibt-19-0-3.sfi                         |  Bin 801128 -> 14 bytes
>   intel/ibt-19-0-4.ddc                         |  Bin 9 -> 12 bytes
>   intel/ibt-19-0-4.sfi                         |  Bin 801128 -> 14 bytes
>   intel/ibt-19-16-4.ddc                        |  Bin 9 -> 12 bytes
>   intel/ibt-19-16-4.sfi                        |  Bin 801128 -> 14 bytes
>   intel/ibt-19-240-1.ddc                       |  Bin 9 -> 12 bytes
>   intel/ibt-19-240-1.sfi                       |  Bin 801128 -> 14 bytes
>   intel/ibt-19-240-4.ddc                       |  Bin 9 -> 12 bytes
>   intel/ibt-19-240-4.sfi                       |  Bin 801128 -> 14 bytes
>   intel/ibt-19-32-0.ddc                        |  Bin 9 -> 12 bytes
>   intel/ibt-19-32-0.sfi                        |  Bin 801128 -> 14 bytes
>   intel/ibt-19-32-1.ddc                        |  Bin 9 -> 12 bytes
>   intel/ibt-19-32-1.sfi                        |  Bin 801128 -> 14 bytes
>   intel/ibt-19-32-4.ddc                        |  Bin 9 -> 12 bytes
>   intel/ibt-19-32-4.sfi                        |  Bin 801128 -> 14 bytes
>   intel/ibt-20-0-3.ddc                         |  Bin 9 -> 12 bytes
>   intel/ibt-20-1-3.ddc                         |  Bin 9 -> 12 bytes
>   intel/ibt-20-1-4.ddc                         |  Bin 9 -> 12 bytes
>   libertas/gspi8686_v9_helper.bin              |  Bin 2140 -> 19 bytes
>   libertas/gspi8688_helper.bin                 |  Bin 2140 -> 19 bytes
>   mellanox/lc_ini_bundle_2010_1502.bin         |  Bin 12300 -> 27 bytes
>   mellanox/lc_ini_bundle_2010_3020.bin         |  Bin 12300 -> 27 bytes
>   mellanox/lc_ini_bundle_2010_3146.bin         |  Bin 12300 -> 27 bytes
>   meson/vdec/sm1_hevc_mmu.bin                  |  Bin 16384 -> 17 bytes
>   mrvl/sd8688_helper.bin                       |  Bin 2616 -> 29 bytes
>   mts_gsm.fw                                   |  Bin 13847 -> 11 bytes
>   nvidia/gp100/gr/sw_bundle_init.bin           |  Bin 7664 -> 33 bytes
>   nvidia/gp100/gr/sw_method_init.bin           |  Bin 11928 -> 33 bytes
>   nvidia/gp104/gr/gpccs_inst.bin               |  Bin 13307 -> 29 bytes
>   nvidia/gp108/gr/fecs_bl.bin                  |  Bin 576 -> 26 bytes
>   nvidia/gp108/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>   nvidia/gp108/gr/sw_bundle_init.bin           |  Bin 7680 -> 33 bytes
>   nvidia/gp108/gr/sw_ctx.bin                   |  Bin 6000 -> 25 bytes
>   nvidia/gp108/gr/sw_method_init.bin           |  Bin 12288 -> 33 bytes
>   nvidia/gp108/gr/sw_nonctx.bin                |  Bin 2496 -> 28 bytes
>   nvidia/gv100/acr/bl.bin                      |  Bin 1280 -> 22 bytes
>   nvidia/gv100/acr/unload_bl.bin               |  Bin 1280 -> 29 bytes
>   nvidia/gv100/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>   nvidia/tu102/acr/bl.bin                      |  Bin 1280 -> 22 bytes
>   nvidia/tu102/acr/unload_bl.bin               |  Bin 1280 -> 29 bytes
>   nvidia/tu102/gr/fecs_bl.bin                  |  Bin 576 -> 26 bytes
>   nvidia/tu102/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>   nvidia/tu104/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>   nvidia/tu104/gr/sw_ctx.bin                   |  Bin 6936 -> 25 bytes
>   nvidia/tu104/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>   nvidia/tu104/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>   nvidia/tu106/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>   nvidia/tu106/gr/sw_ctx.bin                   |  Bin 6936 -> 25 bytes
>   nvidia/tu106/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>   nvidia/tu106/gr/sw_nonctx.bin                |  Bin 3856 -> 28 bytes
>   nvidia/tu106/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>   nvidia/tu116/acr/bl.bin                      |  Bin 1280 -> 22 bytes
>   nvidia/tu116/acr/unload_bl.bin               |  Bin 1280 -> 29 bytes
>   nvidia/tu116/gr/fecs_bl.bin                  |  Bin 576 -> 26 bytes
>   nvidia/tu116/gr/gpccs_bl.bin                 |  Bin 576 -> 27 bytes
>   nvidia/tu116/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>   nvidia/tu116/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>   nvidia/tu116/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>   nvidia/tu117/gr/sw_bundle_init.bin           |  Bin 7456 -> 33 bytes
>   nvidia/tu117/gr/sw_ctx.bin                   |  Bin 6936 -> 25 bytes
>   nvidia/tu117/gr/sw_method_init.bin           |  Bin 13424 -> 33 bytes
>   nvidia/tu117/gr/sw_nonctx.bin                |  Bin 3856 -> 28 bytes
>   nvidia/tu117/gr/sw_veid_bundle_init.bin      |  Bin 176 -> 38 bytes
>   qca/hpnv21.302                               |  Bin 6830 -> 10 bytes
>   qca/hpnv21g.302                              |  Bin 6670 -> 11 bytes
>   qca/nvm_usb_00000201.bin                     |  Bin 1859 -> 20 bytes
>   qca/nvm_usb_00130200_0105.bin                |  Bin 6316 -> 25 bytes
>   qca/nvm_usb_00130200_0106.bin                |  Bin 6332 -> 20 bytes
>   qca/nvm_usb_00130200_0109.bin                |  Bin 6332 -> 20 bytes
>   qca/nvm_usb_00130200_0110.bin                |  Bin 6316 -> 25 bytes
>   qca/nvm_usb_00130201_010a.bin                |  Bin 6623 -> 20 bytes
>   qca/nvm_usb_00130201_010b.bin                |  Bin 6623 -> 20 bytes
>   qca/nvm_usb_00130201_0303.bin                |  Bin 6623 -> 20 bytes
>   qca/nvm_usb_00130201_gf_010a.bin             |  Bin 6463 -> 23 bytes
>   qca/nvm_usb_00130201_gf_010b.bin             |  Bin 6463 -> 23 bytes
>   qca/nvm_usb_00130201_gf_0303.bin             |  Bin 6463 -> 23 bytes
>   qca/rampatch_usb_00000201.bin                |  Bin 54432 -> 25 bytes
>   qcom/sm8250/adspr.jsn                        |   22 +-
>   qcom/sm8250/adspua.jsn                       |   28 +-
>   qcom/sm8250/cdspr.jsn                        |   22 +-
>   radeon/CAICOS_mc.bin                         |  Bin 24096 -> 12 bytes
>   radeon/CAICOS_me.bin                         |  Bin 5504 -> 12 bytes
>   radeon/CYPRESS_rlc.bin                       |  Bin 3072 -> 13 bytes
>   radeon/HAINAN_mc2.bin                        |  Bin 31452 -> 13 bytes
>   radeon/HAWAII_sdma.bin                       |  Bin 4200 -> 16 bytes
>   radeon/JUNIPER_me.bin                        |  Bin 5504 -> 14 bytes
>   radeon/JUNIPER_pfp.bin                       |  Bin 4480 -> 15 bytes
>   radeon/JUNIPER_rlc.bin                       |  Bin 3072 -> 13 bytes
>   radeon/KABINI_ce.bin                         |  Bin 8576 -> 14 bytes
>   radeon/KABINI_sdma.bin                       |  Bin 4200 -> 16 bytes
>   radeon/KAVERI_sdma.bin                       |  Bin 4200 -> 16 bytes
>   radeon/MULLINS_ce.bin                        |  Bin 8576 -> 13 bytes
>   radeon/MULLINS_me.bin                        |  Bin 8576 -> 13 bytes
>   radeon/MULLINS_sdma.bin                      |  Bin 4200 -> 16 bytes
>   radeon/OLAND_ce.bin                          |  Bin 8576 -> 13 bytes
>   radeon/OLAND_mc.bin                          |  Bin 31452 -> 13 bytes
>   radeon/OLAND_mc2.bin                         |  Bin 31452 -> 13 bytes
>   radeon/OLAND_me.bin                          |  Bin 8576 -> 13 bytes
>   radeon/PITCAIRN_ce.bin                       |  Bin 8576 -> 13 bytes
>   radeon/REDWOOD_pfp.bin                       |  Bin 4480 -> 13 bytes
>   radeon/REDWOOD_rlc.bin                       |  Bin 3072 -> 13 bytes
>   radeon/RV620_me.bin                          |  Bin 21504 -> 12 bytes
>   radeon/RV620_pfp.bin                         |  Bin 2304 -> 13 bytes
>   radeon/RV630_pfp.bin                         |  Bin 2304 -> 13 bytes
>   radeon/RV635_me.bin                          |  Bin 21504 -> 12 bytes
>   radeon/RV635_pfp.bin                         |  Bin 2304 -> 13 bytes
>   radeon/RV670_pfp.bin                         |  Bin 2304 -> 13 bytes
>   radeon/RV730_pfp.bin                         |  Bin 3392 -> 13 bytes
>   radeon/SUMO_me.bin                           |  Bin 5504 -> 12 bytes
>   radeon/TAHITI_ce.bin                         |  Bin 8576 -> 13 bytes
>   radeon/TAHITI_mc.bin                         |  Bin 31076 -> 15 bytes
>   radeon/TAHITI_me.bin                         |  Bin 8576 -> 15 bytes
>   radeon/TAHITI_pfp.bin                        |  Bin 8576 -> 16 bytes
>   radeon/TURKS_mc.bin                          |  Bin 24096 -> 12 bytes
>   radeon/TURKS_me.bin                          |  Bin 5504 -> 12 bytes
>   radeon/VERDE_ce.bin                          |  Bin 8576 -> 13 bytes
>   radeon/VERDE_mc.bin                          |  Bin 31076 -> 15 bytes
>   radeon/banks_k_2_smc.bin                     |  Bin 61932 -> 27 bytes
>   radeon/bonaire_k_smc.bin                     |  Bin 130796 -> 27 bytes
>   radeon/bonaire_mc.bin                        |  Bin 32336 -> 24 bytes
>   radeon/bonaire_rlc.bin                       |  Bin 8448 -> 25 bytes
>   radeon/bonaire_sdma.bin                      |  Bin 4456 -> 26 bytes
>   radeon/bonaire_sdma1.bin                     |  Bin 4456 -> 27 bytes
>   radeon/bonaire_smc.bin                       |  Bin 130796 -> 25 bytes
>   radeon/bonaire_uvd.bin                       |  Bin 232752 -> 25 bytes
>   radeon/bonaire_vce.bin                       |  Bin 101072 -> 25 bytes
>   radeon/hainan_k_smc.bin                      |  Bin 61876 -> 26 bytes
>   radeon/hainan_mc.bin                         |  Bin 31996 -> 23 bytes
>   radeon/hainan_smc.bin                        |  Bin 61444 -> 24 bytes
>   radeon/hawaii_k_smc.bin                      |  Bin 130796 -> 26 bytes
>   radeon/hawaii_mc.bin                         |  Bin 32796 -> 23 bytes
>   radeon/hawaii_rlc.bin                        |  Bin 8448 -> 24 bytes
>   radeon/hawaii_sdma.bin                       |  Bin 4456 -> 26 bytes
>   radeon/hawaii_sdma1.bin                      |  Bin 4456 -> 27 bytes
>   radeon/hawaii_smc.bin                        |  Bin 130796 -> 24 bytes
>   radeon/hawaii_uvd.bin                        |  Bin 232752 -> 25 bytes
>   radeon/hawaii_vce.bin                        |  Bin 101072 -> 25 bytes
>   radeon/kabini_rlc.bin                        |  Bin 10496 -> 24 bytes
>   radeon/kabini_sdma.bin                       |  Bin 4456 -> 26 bytes
>   radeon/kabini_sdma1.bin                      |  Bin 4456 -> 27 bytes
>   radeon/kabini_uvd.bin                        |  Bin 232752 -> 25 bytes
>   radeon/kabini_vce.bin                        |  Bin 101072 -> 25 bytes
>   radeon/kaveri_ce.bin                         |  Bin 8832 -> 13 bytes
>   radeon/kaveri_me.bin                         |  Bin 8832 -> 13 bytes
>   radeon/kaveri_rlc.bin                        |  Bin 10496 -> 24 bytes
>   radeon/kaveri_sdma.bin                       |  Bin 4456 -> 26 bytes
>   radeon/kaveri_sdma1.bin                      |  Bin 4456 -> 27 bytes
>   radeon/kaveri_uvd.bin                        |  Bin 232752 -> 25 bytes
>   radeon/kaveri_vce.bin                        |  Bin 101072 -> 25 bytes
>   radeon/mullins_ce.bin                        |  Bin 8832 -> 13 bytes
>   radeon/mullins_me.bin                        |  Bin 8832 -> 13 bytes
>   radeon/mullins_mec.bin                       |  Bin 17024 -> 14 bytes
>   radeon/mullins_pfp.bin                       |  Bin 8832 -> 14 bytes
>   radeon/mullins_rlc.bin                       |  Bin 10496 -> 25 bytes
>   radeon/mullins_sdma.bin                      |  Bin 4456 -> 26 bytes
>   radeon/mullins_sdma1.bin                     |  Bin 4456 -> 27 bytes
>   radeon/mullins_uvd.bin                       |  Bin 232752 -> 25 bytes
>   radeon/mullins_vce.bin                       |  Bin 101072 -> 25 bytes
>   radeon/oland_ce.bin                          |  Bin 8832 -> 13 bytes
>   radeon/oland_k_smc.bin                       |  Bin 62692 -> 25 bytes
>   radeon/oland_mc.bin                          |  Bin 31996 -> 22 bytes
>   radeon/oland_me.bin                          |  Bin 8832 -> 13 bytes
>   radeon/oland_smc.bin                         |  Bin 62260 -> 23 bytes
>   radeon/pitcairn_ce.bin                       |  Bin 8832 -> 13 bytes
>   radeon/pitcairn_k_smc.bin                    |  Bin 61712 -> 28 bytes
>   radeon/pitcairn_mc.bin                       |  Bin 31644 -> 25 bytes
>   radeon/pitcairn_me.bin                       |  Bin 8832 -> 13 bytes
>   radeon/pitcairn_smc.bin                      |  Bin 61280 -> 26 bytes
>   radeon/si58_mc.bin                           |  Bin 32488 -> 21 bytes
>   radeon/tahiti_ce.bin                         |  Bin 8832 -> 13 bytes
>   radeon/tahiti_k_smc.bin                      |  Bin 64364 -> 26 bytes
>   radeon/tahiti_mc.bin                         |  Bin 31776 -> 23 bytes
>   radeon/tahiti_me.bin                         |  Bin 8832 -> 13 bytes
>   radeon/tahiti_pfp.bin                        |  Bin 8832 -> 16 bytes
>   radeon/tahiti_smc.bin                        |  Bin 63932 -> 24 bytes
>   radeon/verde_ce.bin                          |  Bin 8832 -> 13 bytes
>   radeon/verde_k_smc.bin                       |  Bin 63804 -> 25 bytes
>   radeon/verde_mc.bin                          |  Bin 32044 -> 22 bytes
>   radeon/verde_smc.bin                         |  Bin 61776 -> 23 bytes
>   rtl_bt/rtl8821c_config.bin                   |  Bin 10 -> 19 bytes
>   rtl_bt/rtl8821cs_config.bin                  |  Bin 25 -> 19 bytes
>   rtl_bt/rtl8822cu_config.bin                  |  Bin 6 -> 20 bytes
>   rtl_bt/rtl8852au_config.bin                  |  Bin 6 -> 20 bytes
>   rtl_bt/rtl8852bu_config.bin                  |  Bin 6 -> 20 bytes
>   rtl_bt/rtl8852cu_config.bin                  |  Bin 6 -> 20 bytes
>   sms1xxx-nova-a-dvbt-01.fw                    |  Bin 85656 -> 28 bytes
>   ueagle-atm/CMVeiWO.bin                       |  Bin 161 -> 9 bytes
>   ueagle-atm/CMVepWO.bin                       |  Bin 151 -> 11 bytes
>   wfx/brd8023a.pds                             |  Bin 625 -> 12 bytes
>   344 files changed, 14 insertions(+), 17691 deletions(-)
>
