Return-Path: <SRS0=rrts=BK=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C6EC7EE23
	for <linux-firmware@archiver.kernel.org>; Sun, 21 May 2023 13:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E77CC433D2; Sun, 21 May 2023 13:14:10 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C843CC433EF;
	Sun, 21 May 2023 13:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C843CC433EF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXayhBHmuTTdfAZopHrbuDKifZ4B8Zcq1JIBOdPlIAkq5/p5jH9LWVbBMFjLbu5xtOw5Y2XjL+4A2YJ6gQ4FvTaKe3hK3F3wv0473MsK/rX64vOKQ2Fu/GqpVonLLEMXC2w1pN6coEryFAZR7bUbp4905l7OJWc+gTpYZswp/sY9UzHTNrd8HlAEhfYaF2WeM4o/olkSjglzvx+dJ5MC6I9+6tO1ttbRJOXbuOzKQZPkwNgV7oStcUFhQam5hIqo9SihEotHN8XzVaKC4oojSviI6Z9Ggu2hE9w3faKVY0sllqMyBActUSbH/p37rrAH58vkeDrfaeA0wTd+6W5wEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ekHgRjlMcD1aT9JEJ/rWn7KHEvhZrmu+L8Ctj7JA5c=;
 b=fvaJ5lVcgO8IkLUt/iBo/UbxbAdb6DNxhsN/pcEdPkhTw4W65gEEejivlrOprwbLaXrdXJO2KyRFOw7Tcu4pF+ySkO89BwPqyRoB7NQGvUar5bBEFvR6DMvkS53A2O/hQGeeTQbW6u7U/bOsHBgW+krQSkGFQzE3jgt2KZvIDEjjkiOONhDrG3P5F4iJKsW3JGLemOOBDBgu9ItoUpLxkEKEpjI2xM6MbDOZ8MkRPDDTxd5jfKfrf4p7SQda2szLhp1sBPKr4mbtvmJGm3CB4tCx/QofnkFha2A43s7Q1z/Gl6qrkHmCaSGlC4+prhTLb18OfLFCm4eeDCvlrli02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ekHgRjlMcD1aT9JEJ/rWn7KHEvhZrmu+L8Ctj7JA5c=;
 b=GO+hb71RUOpVVGAosPRsj6SmultW1C085UB7/cYVCH2z9ZXNEehLXHmf79v2Vf0XPCHQterBsRfpcp6sK/pDqiO+r+zaEyhLMk7t6EpTuSfrwkgR7ekg6hrRLLKCiRgGqsmFaINRVRuDu5jUxEQ+1bRzEBqCZjV1zaBb1Kls/+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7423.namprd12.prod.outlook.com (2603:10b6:510:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Sun, 21 May
 2023 13:14:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6411.027; Sun, 21 May 2023
 13:14:04 +0000
Message-ID: <290555d2-6bd6-b9b6-121c-3919fd951b75@amd.com>
Date: Sun, 21 May 2023 08:14:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Updated amdgpu DMCUB firmware
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "jwboyer@kernel.org" <jwboyer@kernel.org>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "VURDIGERENATARAJ, CHANDAN" <CHANDAN.VURDIGERENATARAJ@amd.com>,
 "Sharma, Deepak" <Deepak.Sharma@amd.com>
References: <CH0PR12MB5284B5BDC32C5CDB44DB05168B7C9@CH0PR12MB5284.namprd12.prod.outlook.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CH0PR12MB5284B5BDC32C5CDB44DB05168B7C9@CH0PR12MB5284.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0177.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: cf363485-8cf2-4864-f2cf-08db59fd3ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fOqLfrE24+z8OEmEsc7mzYvFlVPTDJA2IwEc5B0VJySIYQLffRedIckuLWEjFYGIzv9H95aaEC5BPud8ez+z69GTP5HKi8ZY+HtgC/M61RqepYnIm3wLSSLc+s1seV5cOhPLcrOTVmgOAJUZoqBxAbvsYPHgclQOlXk/VkhJ/zBVWZI62nf35mZB+XIwhInYAovOa/uvZ/qOJFyQA0x0vfohQvsqXulymGL4h8a/3OwO98wfyK8q7jaJZ0YcHF23CmxE5BR+mgQL3XxRDjkEsMOCK+cDMn3l8fkfpj0ZUK7FlzbFRn3kL1Y5myLG1JtMq0vPbAhc9MYTTYKjCczeCjv2q4dcDgivaE9MNc+ANlBawNjqfrwF8YYlsuRptgFVdwEQD5vtyEMMe6LeKH/fV6UhoHTonNYCGg6A/dFNQcn1RSfL8gl05KE4d5wE3M7p7Osx10Jn5829eXjHnMaUyCNI0HfbMA3kfTwf71RQRNw440eGkwfuj5Suu3hwDqSoDRPIjOwW8sgeTqK9sycyfUELryWCeHJYJ0XOfMG9hHnFowK335cfx9Xs8eQrb+1Es3ir4XGZRfadT2tQqhOqm/PpSsBFyR+hRK4pf7Mgu40YWJvS+I7+dfkEDLgEWcBPdbYcGNaR8scAPqIIMFt3nw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199021)(53546011)(2906002)(6506007)(41300700001)(6512007)(4744005)(186003)(8676002)(8936002)(44832011)(15650500001)(5660300002)(2616005)(83380400001)(31696002)(966005)(6666004)(6486002)(86362001)(110136005)(31686004)(54906003)(478600001)(36756003)(38100700002)(316002)(4326008)(66556008)(66946007)(66476007)(3480700007)(450100002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnY3UnZhc2F5aGF2cWxjL2RhbUo0WmMwRVB4MytkUVhDR2RIRkhOR1E1Snp0?=
 =?utf-8?B?RDlNb0IwSEN3MXJkdDFicWRZcE1nSEd0ckRmb25OZDhMZFhXRlBKbG5FVkNX?=
 =?utf-8?B?L0V5bWxMREV5eGU5RHpVdnRNejVBM201TmpWRk9GLy9YN3Mzc1dCY29iZmF0?=
 =?utf-8?B?Y2dHSml3RVZ5ZG9LZ2IxNmE1bUFIMU1qTy9YYnpibXplQm1qU1o1UXlzenFP?=
 =?utf-8?B?RTFpVXRaMkI2SEZDaHMybUg0SDdpNEo5bnJXZFZiRmVsWWZyMG1DeUhtU21C?=
 =?utf-8?B?OGxONnAySUUrMk9pZHlyemlaaGVMd1N5Mm8wejVTS2hQTXpOb1Y4RXlialJy?=
 =?utf-8?B?TXl3emlFMURUOEhwcmdkenYwY1JNL1U1NG1TbWtzN0EvOHdXZEhOU01melVm?=
 =?utf-8?B?eHp3RlZ5WGVRcEJYNi9USkgxU0I3UHVHUVFMdkdaNzJkYkI5dEthSVhNMVdQ?=
 =?utf-8?B?VG0yTEl1azlGNG16MHhQdGNkNUJPWDhqcU1XRGFmRWRJV0Vza1RiZGQ3M2c5?=
 =?utf-8?B?Y2QyZU1GM2hkZ1FlTnVNeXlZMXl2RE9vNW5iMXdaOVBlSHRRSTI4eDYzclN2?=
 =?utf-8?B?OFBFeG1meEk0TGIwZkZMUyt5bVZqOGZzZEFwaW5IcVNha1N4bWRNS0xQZHNn?=
 =?utf-8?B?MlNyVkllNGwvbmhmRFl0MmZ5dEpobGRzRXRQbzlqUFJpb0hEN0c0M0VJNi9O?=
 =?utf-8?B?cFNSMlFhcUNOaUErQlJxbjFLWmZFOGUrMG9WZVF6bGJxaVErbWx0dGsyN1ps?=
 =?utf-8?B?clVXT09pWmNoZFF1dFdDdjlPK2FmVW83YklKZFIrNDdEQlMxYkc4eHVVUlFn?=
 =?utf-8?B?VnBKR2cxUDRtV3liVlhZYXdLWFBmSEtLNHdna1J3UWk0TENhVS9CQzNvWURj?=
 =?utf-8?B?K3loc3VTZHJDMGI2UFlFWEZXeHJHT1FKMkJVZ3VIRE1tUUQ5cXRpeTZETlFm?=
 =?utf-8?B?QWR6S3hlR291Wkp4WnYwRkZubGtHK29PakhQZHJ0RWRIckxpL2RNUlJyMnRn?=
 =?utf-8?B?QVRWNGNVK3QrM3Jid00xaEs3RXk1MDlCTzgxMzF4RThmWlh1enNud0ttR3Q4?=
 =?utf-8?B?YXpFTkcrWVUxK0kxZVMxem5DZlhyTFd1WUVQUUZwZG1VV0U4bUNFVE83cU9R?=
 =?utf-8?B?TSt6ZVJOMmVuM1Y0dEVmOWtneEZOTmFJd1ZiNTdLVkd6ajU0a3ZOeE83SjFJ?=
 =?utf-8?B?ampFa0l1NkpKcUVzeUNHY0U1VlRrQjZnSkk4UlVUd29oek9adW44WEJjc1Zt?=
 =?utf-8?B?VjViLzZmWWV3anBnOFRvekpuS0Z0K01iTnJiM3J6Wk9YRlhjSzFMQ2lsN3VX?=
 =?utf-8?B?SGxWa09JNkxwbGpEaVYyUS84bkgwTU15U05Jb2JkZFBOcU5CVm5yU3RwNDYz?=
 =?utf-8?B?ZEdzdk13c2xtc3VpOE1udTZQTW92WnIwbzBuQkNtZ1RJQS9wK0IzVnM1MmFZ?=
 =?utf-8?B?NUF3K0pnVTBrMnVzS0l5N1hncmo1Z2V0Wkc5OWc1U0dKcFZCM0RqWHlHOTl0?=
 =?utf-8?B?UllVK1JqbU9OZVNJbzI4U08xdE04Z0JSUXBYVXhPVzVMNW5TTllvalNXcHBE?=
 =?utf-8?B?OWZXejlNcGtHRzBnMlhWRlVQQysyV3lWRTJKd2JNRVJZMWtGbmFqZ284Qzhy?=
 =?utf-8?B?QlRQN3NIbEdTbmVSL21kcnJlbjE4YzFRcmJOUm5ES3VPbWVJcG44RS9JV0dT?=
 =?utf-8?B?QlFlSjZMMTJ5MTJZQVRYRjdteGJmcjA0ZHY0akthQUVUeTA2b2ZZL3V2SzBl?=
 =?utf-8?B?cW52d0lWTjBIWWlRQWQ1b0tENnJ3SFJCRENUMlRablc1d3UyZXdRTnNKUXZv?=
 =?utf-8?B?NDl6cDlQK09ZNWZPSko1dDRDUFQycllRdDZ1QmUyK29Pb1dJQWkxZnd1TmM5?=
 =?utf-8?B?OHFMbmF0aUhUeTljK3dVZzhKSEpJS1czcGNBVXFraFVYVUhlL3NaNnV2VnY1?=
 =?utf-8?B?N2FYSGZVa0R4N1hrb1QvSFBBQTZ3eW9TTzFtZGdFeWw1aVRxby9vRUc0dk1q?=
 =?utf-8?B?TFlnMmlZM2xTYno3Z3pWREEwSG5zUHNka2g0cXVBb3p2MVN4UDdwOFMvdkQ2?=
 =?utf-8?B?NkgzL0hKQk9BVTRHTERVTHd2UG53TmZTUGx5cGRKajNBaGdWZURkOExrUkFa?=
 =?utf-8?B?MlFjdGppWUg3by85bUtsRUNtcjBPZ3lVa096UkhQR3FNN1Z6UnVRdUt1Sm5V?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf363485-8cf2-4864-f2cf-08db59fd3ff1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2023 13:14:04.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzZroBDGy0612sSzCV3aWKxUMRBSHPf/B3tlwVixXiPVkc2lQXbiNQkOyfI8lwYJI1zILyo/zpYxyP3ZU4JGIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7423

On 5/19/23 15:53, Pillai, Aurabindo wrote:
> [AMD Official Use Only - General]
> 
> 
> Hi Josh,
> 
> Updated amdgpu DMCUB firmware for various display IPs. Please apply.
> 
> --
> 
> Regards,
> Jay

Jay,

I don't believe linux-firmware@kernel.org is an alias for 
linux-firmware@vger.kernel.org.

You should resend this with the correct target so this submission and 
conversation is archived at
https://lore.kernel.org/linux-firmware/

 >    DMCUB Updates for Navi2x, Yellow Carp, DCN321, DCN32, DCN314, DCN315
 >    From interal git commit cb0677a0552d880383b1ab787377d26c550c32d6

Also, is there an update for DCN316 too that should go at same time as 
all the others?

Thanks,
