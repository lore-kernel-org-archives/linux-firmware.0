Return-Path: <SRS0=ImDa=EN=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A0AC83F12
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 14:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15314C433CA; Mon, 28 Aug 2023 14:38:15 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B553C433C8;
	Mon, 28 Aug 2023 14:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B553C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEZJrVCwHIyTLePU30sEgiLelV0mKBPR/H0wzJQojc2BOhOQ3yGED7aORhIjjf2N54FU76IOS11TymI4nNNyhS7DnrPrLNSV4dM3wx44tJj6ZuNUbcRPOCSzQ67RRhRgeYSiJ2K8vGqmjau0jQOc+EJYaZVdCdFDDitZDPHog2+g5j/f6pzVPy5uMySnUk2eC3r+y5EQ5yuTbwAv17TVi5CTbe2SmXd5I7GJW0RkXdfjBY3wtLpPBj86AXWNjBcjd+VLEwgFEkF2+qNcB+7JUPz8HD5a4+wmnGDj/WqaXTZ7x8QpEVhoxLqLHJxVpXPzfm8vYey9qb9FdMtK7YM1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBkvOuqKmlxQu35Sqo37NbQHxRC2UOGZi2ba4PsOo94=;
 b=GrC5MPjgewWVbeIB/q4cAAiNcxAQy+pzLHYqpyQbaP/rjW4UzEvy6ol0nYtS0vewVYz4948G9HPkVRlLBnMWLu5GCVY973wuDKZc70ztyy3Hu31CEpCBFRFwJXdWi8nwQBPHw5Z/N7P1hBKavCUBaserlSWQeghPi9enwsVW5EN/UHJPE9AHuxgHAbUjcuu+w37w01acZLowXkTz9bwVt0Ep0BvDLX8RFmc/hbSY6mE5ZNndlYfVmT7sFhR7/c4ubfx7eshvw9OFGH+DOZug8hFA32oCIhHl1K8ZbUTuJaLycDDVfJ7brR4O7w7ySMDE60pZ21vUERxm4zcGRm7g9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBkvOuqKmlxQu35Sqo37NbQHxRC2UOGZi2ba4PsOo94=;
 b=q9jhQYM8PI8dXVd1iBrnjZ2J+/q7iw7KkC2zGy3uFzeAAI5C3oBA0GOZCG6mYt2+3WyfcMI24y8ieu1CxT73qrBQs4EdTfl64x2Yi5OQD8ftDqOY7i2/eNVXRD+m3tWwr7yaF+5Sn0wrE0Mr8L/9+KN4qsIVILfvIqywB0XOA0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 CYYPR12MB8964.namprd12.prod.outlook.com (2603:10b6:930:bc::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Mon, 28 Aug 2023 14:38:08 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::44a:f414:7a0f:9dae]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::44a:f414:7a0f:9dae%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 14:38:07 +0000
Message-ID: <dd01d36b-2ff1-4889-a409-e6fcec60af68@amd.com>
Date: Mon, 28 Aug 2023 09:38:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Update of amdgpu DMCUB firmware (2023-08-25)
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Josh Boyer <jwboyer@kernel.org>,
 Wayne.Lin@amd.com, Benjamin Tissoires <benjamin.tissoires@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, alexander.deucher@amd.com,
 chandan.vurdigerenataraj@amd.com, deepak.sharma@amd.com
References: <20230825202041.194349-1-hamza.mahfooz@amd.com>
 <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com>
 <12e4c4eb-df91-4a7a-9072-ccfac8679c85@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <12e4c4eb-df91-4a7a-9072-ccfac8679c85@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0151.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::21) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: 63689019-d9c5-4085-4d65-08dba7d464f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QJEp+L9IoAbiWkajw3FkEy/CyL+yvDWYveRhswwFmRPWJpmpo3gElIZMyG9MZSaQQBf4KPcbZ0/m+aidfZ+W1xhJ8On4OvluGqU9ExqT1dyOV2tqAy047ojYtJLGfVasL/IJ+tCGPIxGVj//rYLy80+4Xtq0de7StiqW6UWJoCZKH9xpNaeGScQYyfgUVtKz+Yo2wL0Vb5Dxr2wlUM8oA8m9S3vT93X6k32LyORxFzQcJMvqWyAgJRkw/AIXVzKkDYjUKh/qRDLFcYdXO31IRL8Yw4yEanoI+Gi8/4BRo5IE6OBP9JvX1XUuOF+qMpL1gvhtqhaRBH1hqm5u1308X75Gx5D8bXxywv+3O9ViCXZu6/QFomu8eLUKFcNj4LuLsIspe9eD+zjWPMRooXy6qLNilXzzXNYAslqYqCqCRbd28r1LQU2Hc4t9m2XgaLeS+lEvMlvZq1x+CmJWHS3r3j9xsFhERpmao56+6GhbHW3Vr8SZinHQ5ojk+jkm+V8Pk7XKjHOVwRCa38FrYIdhmivZFNCTme+gDfwWLUcTGBKQMZdkKxje+DoHlhKMsXbI6xaD1kQDIayZiNeEGLmleblX8hSPdS3sNGurNCUm5IUH49dA9IRbs9EyRYYBep88qobLifYPQDJps9IVAw+sKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199024)(1800799009)(186009)(31686004)(6506007)(6666004)(6486002)(6512007)(36756003)(86362001)(31696002)(38100700002)(2616005)(2906002)(26005)(83380400001)(53546011)(478600001)(110136005)(66476007)(66556008)(66946007)(41300700001)(8676002)(4326008)(8936002)(44832011)(5660300002)(15650500001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJTMldCMGxyOS9KWnh6R2krUUwreUxxLzFuN3dGM1FWa3pKVmQwOHJ0VllP?=
 =?utf-8?B?NTc1S2laL3BpcVVIbmsvY3hVSkRxU3N5VDBEejhPQzlqT1UzVU5VRVA1eUw2?=
 =?utf-8?B?UzBtRlMrWTl3M25Xa0w5U1NRSm1YSDREY25VOFVOaHVidVVEWVVLY1BTQzFh?=
 =?utf-8?B?a0hvVStwUnFpNjRVLzc1T3NQNW1mMUpYVlhWQzFWS3RLT2ltOXhjeXRBMVRU?=
 =?utf-8?B?dnJ1RDhoQTd1K1QvN3ovT1dDb1ZlWXA5RHhUcjZqR1htV0hrU2RmQ00vNmRL?=
 =?utf-8?B?NjA0N2xEeEdXU2U2VDJIL3FTR1pMcjczdkRLdHhVbS9HYjZ3SGFuaUZTejln?=
 =?utf-8?B?N0M3Si9VOVIxNkRRTXZPTVVIbUQvTlFDWVZBdjVWVVBVSVBMME11amYrK1ZE?=
 =?utf-8?B?WWJBSmhtb2F2OTVNNkZVWTR2NU5DNE1rU1d3dGxKb205N1kxdW8ycndmdFU1?=
 =?utf-8?B?dHdDTzhOMEJ0b3I1SVZNQ2pzNitEbFJGbTNWMTJsZHpRL1ZlTkl1TmZSRlNV?=
 =?utf-8?B?YWk0MkN6RElrbnQ5YUp3ZGVzbmsvRUxmaHNicHFiUFJxZm5XeTZkRjAxdjlY?=
 =?utf-8?B?bnNpNlVoaUxBQ0VXWm5ua0F1b3RQTFhmR04xRDAyU0FUOXNZNFdCaisyR3lo?=
 =?utf-8?B?eExDOUx0VDZDcW1UZmkzQmRXcDFGUjgydEt2clRNc0hRUDhxNjhIVjYrSjRD?=
 =?utf-8?B?SGRBVkorVFR2MzZpeUt2ZmVUYzMzUDc0cy9ZZ294d0l2QU8ydHc3cE1DZXRh?=
 =?utf-8?B?ckRtOHVHYmpqb21SVXZYejNFNHQyVmFYckg5L3NIY0hHODV5OXpQc1hsL1kv?=
 =?utf-8?B?cmJRTGdXejNkOEVOUDBUa0FCOUFBbEF2K0NmQ2VHLzNZYmJJdnhLWHNCK2Vt?=
 =?utf-8?B?NDZ2SVRZVEI5S0pUMzIxTjZURmp6Y1ZzTWpjS1ROMExQTTNxSFBWbGlPL0F6?=
 =?utf-8?B?NHl6RXA2V1BMT2hkZEdhVEo3ZTlXeVFnZ2lDWjZHQ211RTVZOW1WcSszanpt?=
 =?utf-8?B?c1ZrcVpOdm5HVUhOYW55bWZnQ0ZiUU1IOCs0T1MvS3JlSDc1Yy9BcVRsNStM?=
 =?utf-8?B?TkZTQTVSSFdRK3Z0M1Fyd2pISlVWVnd6bHZ2b2ZQV2dSdGl1bnFMeVowZUtm?=
 =?utf-8?B?NmFPMWVmY1RmSjhhU0FzYngzYjhwNGlvSlc1TDdhelB6bEFBbkp0UWJXOGVk?=
 =?utf-8?B?aXoyRE5kaTZVWUZaR0tVY09VSHl5SXZBbW9rczQ4eWRkRWp1cWtnanZURVQx?=
 =?utf-8?B?ZmhicW85bzJPblc4STQ1Q0pXRSsvVjM5WVFVbC93cEVsVW9lWGkyVFpnRDBS?=
 =?utf-8?B?OTlGUXJIbzZVYUcwdzlMMmtRUS93dC9IZG9EQVhqdWJOcEVrb1Y2RTdoOGNQ?=
 =?utf-8?B?MnhpTG5XL3Qra2g4ZDNrNjYvajFsQ3d1cmhhb0pLUDVmVkZzYWxtZzNYZ25F?=
 =?utf-8?B?djJ5bmNXVDA1cUpmclNIcmVWQUllbnI2SFk4MzlVZnh1OGlqRTBMbEErdGFj?=
 =?utf-8?B?U3Jsa21CcXNqYi8xb2VwWmJrNFExemg3c3dPaHlsaHF0T0xITVRzTmdKNXpl?=
 =?utf-8?B?S3lNWFJGWWdvMVoxY1pEUkNERUZ1ejBEdktHak9qWUZSWmJUVFlQUUd6OEQz?=
 =?utf-8?B?RUJtT1kwVmlSVDRVUEpMbmlIZlBMTDVXVGxHeC81VWgxclBUNjB5a2tTYkpm?=
 =?utf-8?B?dmh3VThaQUlHdTRWRXJPWFF2REN6NTVzVUdtN3YxNXIxWStlTGZjREM4R3hB?=
 =?utf-8?B?UmE4T3JWT0w4N3BYZjJGTmJNY0Fnc1N6aU1kSGkxOGdEMkgyOHlKZnEwZ0hC?=
 =?utf-8?B?eEEzcWs4SSt2NndpYm52d3QwZWIrclhBOTl3UVByZWlVZ0oxUU5QWmpCTHVz?=
 =?utf-8?B?RUlkL2plWFc5U0dveDQwYWFFNnZlaURxVDJWeWlGVHdXcWJKYm5nbjBYNWpD?=
 =?utf-8?B?clg4NEJ1dFkxK3Ivdzh3VndtSjRtK3BCa0lCc3A1N2FsNFo4V1J6M2ZMcHFD?=
 =?utf-8?B?MWFkREdjYU04empyYmY5NVBORlhrZFByZXdsRjV1TmUzNlJ6cExJcFp3b0li?=
 =?utf-8?B?aUVYVklTZGp4SDlUWTRsSXhncG5xYy80VlpNc2szZFFXWm4veWxnQVFLeWcz?=
 =?utf-8?Q?I8aODPlyMTBUYzch/4P6bb0QM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63689019-d9c5-4085-4d65-08dba7d464f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 14:38:07.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyJA04NVrH8dT7Va9kDk+hY5rZxCMBrc16Ww9VhfS+WIOgFhfl7oEyyPRazy3ipLIlVkoOjNi4ANkazsxpTrNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964

On 8/28/2023 06:47, Hamza Mahfooz wrote:
> On 8/28/23 07:12, Josh Boyer wrote:
>> On Fri, Aug 25, 2023 at 4:20 PM Hamza Mahfooz <hamza.mahfooz@amd.com> 
>> wrote:
>>>
>>> The following changes since commit 
>>> a33f8f1abd1df344798188807de4b4397d7484d3:
>>>
>>>    amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs 
>>> (2023-08-25 15:25:00 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-25
>>
>> Does this replace Wayne Lin's pull request for tags/amd-2023-08-18?
> 
> No, that is updating a different ASIC's fw. So, it's still needed.

But in this case the tags are sequential and from the same branch.  So I 
think pulling the newer one will be sufficient.

> 
>>
>> I can't get to gitlab.freedesktop.org at all right now, so I can't 
>> pull either.

+bentiss

Presumably you're aware FDO gitlab is down already, right?

>>
>> josh
>>
>>>
>>> for you to fetch changes up to a33f8f1abd1df344798188807de4b4397d7484d3:
>>>
>>>    amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs 
>>> (2023-08-25 15:25:00 -0400)
>>>
>>> ----------------------------------------------------------------

