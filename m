Return-Path: <SRS0=PlKO=EN=amd.com=Hamza.Mahfooz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F39C83F11
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 11:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FB0FC433C9; Mon, 28 Aug 2023 11:48:06 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAD5EC433C8;
	Mon, 28 Aug 2023 11:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAD5EC433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbgKuxxDcu2L8+oogW69J2rr52nNIdQo32JF7qqfKsyRojpY7oHaJcSqXBcsOODq3SNc5a6xtZva0JbJw9j1SRCW6wFnfCbJPwldlks6jgF6QWDBMvAzmNlBBf90A2AseiOfxXpjtOe/R+7X3JVTsZ7sh5XPbknB9wkzUyA/b0TKbFdxzaSPwD39KIl9oQtXmUWdSiEZwdu58QtQ4OhMF8FmQ3MtsR9d60iF0MKTT3mhAuuf5Zl1lkDYRP0yyqF58do/7TMSocIfIkOeHSOOiutHS9Qx0PbgV5lBy99AKrbVJL7/MlPYJUqPSyjrLx5i8gvUo/n8Dcj0u00ewIy6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwU1jmnFfSnUi1KfeVp+zWdnZj7Sob7DfttKK523GC8=;
 b=cDjZYOjnc2ckR7lU1K+vN7o0Wyu7seESNHCYyznKNxHsp1f89V9Hn5qJCIAajNSSgD0lxOJA4pCXLdhV/dV/S2t5n3LLaKBBWpldN55pZ1r9yWfa4JrowgjqPS9FF3hKZpNQ8DO+Ws6S16b8IQQEALAJV1p/KtW15qJkj0cvwgVG4+AUL0dssjBDY9sy2b4l0et2s7CIteDlqaq7Lyqudn5QuUDMKbIfxIexgS3ZQE+Xt8x8nPRFngwj9KcS6C5IxYPk5u0Uit+CEdjRPeZW+S6d5MbFbnM3xl0XNUz3UxdB/KpumhKNUOBL787L/FOBPql2GXpSOFGWmetnLTq1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwU1jmnFfSnUi1KfeVp+zWdnZj7Sob7DfttKK523GC8=;
 b=prTBXxC27pK6YQKMfOG2LotFAPoLW0cCsOUx/eG5z9pWiBBumupna8NryYqbnOjqk4Dp1yUMaEi0NSKGhfP08GvvWQb1IHDuXK7r+x1y+SMR3txv2zV4hkaorI6keLJ1cRVPwGXfKMXCwe3jPe6Fb9lMLKcZKmn2hNLAclNRbFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.26; Mon, 28 Aug 2023 11:48:02 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:48:01 +0000
Message-ID: <12e4c4eb-df91-4a7a-9072-ccfac8679c85@amd.com>
Date: Mon, 28 Aug 2023 07:47:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Update of amdgpu DMCUB firmware (2023-08-25)
Content-Language: en-US
To: Josh Boyer <jwboyer@kernel.org>, Wayne.Lin@amd.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, alexander.deucher@amd.com,
 mario.limonciello@amd.com, chandan.vurdigerenataraj@amd.com,
 deepak.sharma@amd.com
References: <20230825202041.194349-1-hamza.mahfooz@amd.com>
 <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <CA+5PVA6vBbGK4DznO45gp3N3OEL8ERzyjUfe_fLGMCEZ2NjgYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::15) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 61971fdb-6f7f-4ca6-42cb-08dba7bca1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OE19SJgKdwmH/TNNoVvw9LrVN2ZGHwaMLhLDYBSyap6ppgenHpjB7LrXN/CDzhVRzwmTT1fr9VCVdIva+Y0twAYOMc/3fq5P1QJinqRqD5U3qa2T3JghWo0fC9zN8w9ZcgBGu/T3kQPR/vWD/PHNzlMKkKzXFCH0YvxDn0HeisYwTyrsk30kgbijrvb69NkyiYMQwdF69RqAjkyGENw9O6fFNMokB++1lEf7l1JMtnUI3ATZy7HvNddcNC/+yvarThcScL8LqSytSZfKJgdvcbC9vj6p8TEN+reGSgIFmy/maRX2WwmM9CQztLDzB6bgVtHgTn1wMWv1Ljmr3otPMPwIPKsUag1OdVbTk9JWtPIQ/i3o9SFPRd3Z/Y6sV9wqxIsTBFCH7v4P1H/vQTap4v0la2llLjkt5kme0NXGyTgdhHuR2EuN5KstP1KKz0NNnr8b9UxjooaJIVzrxjMJHmMOaNeDzbjfuGxf824JDv0KoXdkN6mcgkjJsve6U3SE5SRzU3k5PmsOh3IKNsrHQKHCU2d7xPR0vDO8Sz0G0wrJHJqV9x80x5PStejciYfSCaLaZxMNF2rCiUsUOdnPN6Bw/IsP6W7mV/kpw15/9Pm+HM1JnmrMJUcMf1IlU0fbkEWd0Xjy8KUB0Mtn9TXWNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6280.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(1800799009)(186009)(451199024)(44832011)(6512007)(6666004)(66556008)(478600001)(6506007)(66476007)(316002)(6636002)(66946007)(53546011)(6486002)(41300700001)(5660300002)(2616005)(8676002)(4326008)(450100002)(31686004)(8936002)(86362001)(31696002)(26005)(15650500001)(83380400001)(38100700002)(36756003)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU1KYndxRy8wcWJMRityVTNjUWhGU2xmQ3hvbGFjeG9ML2xHbEJHQXFLMU11?=
 =?utf-8?B?RzFQbzFkTDJaMzA3NEFvcG0wZWdTcnA0bW5helFBOEVRRzY4c05zanRHNTFT?=
 =?utf-8?B?TkNkN29XdW1CN1hmbmM4TFBiaVBQY0RUb2JiZm5qeFU3NHdWdmlNQU5McUNv?=
 =?utf-8?B?VzZ6QVRyL0I5M2s1SlNyOHQ2TmlYTnd4d2QzNzVVbTJKQjduK29Ick9FNkZV?=
 =?utf-8?B?S1llMFBBQ3RyNVhsOURSUnZ5ZXgvUTFjWUthQTAzOEdkaUtYM1Z0VmZ2azM2?=
 =?utf-8?B?SFQzaFBQeUx2TWdJNTVRU2Noa0w1ZGp6V1ZjZ3JSL2x4SFArd3lodFFyS2dO?=
 =?utf-8?B?V0x2MytQZmNyblltQ3gvS0dXUWd0aGk5UmUvNk5BUVJqdXhLQ3d2bnNTQUlO?=
 =?utf-8?B?TDdxY3pLSnNtK2VSYzVtajg4WDNNTVNXUWMrc0twTDJGQ01Bbk85NjRweUEv?=
 =?utf-8?B?SE5YYjBLWWJGQ201ZnpTM1l5SjF3TG51NVoza0ZVc244ODMwaVFnMHkrNDBE?=
 =?utf-8?B?YVhPRE5Ob25KbjNJV2FaSzlVL2JHYUJRdnFwTG5pdnYyTjJQaS83WkFoYlgr?=
 =?utf-8?B?dGJpdVZmdXdsak1KTE1kNmJ5RTQ2aDJVa2ozQUtIcmxPUW8yN2Y1S1JEOGZM?=
 =?utf-8?B?OW5GMndpUUtjTGkwc3pOaDFkTVJQam5ld0NCSmZHZDUrNUNQUVFsNk02VkU0?=
 =?utf-8?B?ZkNDQ0NLQStIQVV0L3hmczZ3MTN0dEN4MklKNm9GYzI2YUxRYTF5ZlhOOFF1?=
 =?utf-8?B?OHk4RWJyeXFxTk95WFgxU2dQN0I1WG5rYUJkL29wMjZDdWE5OGdBLzY1KzJE?=
 =?utf-8?B?TjlBUy9acFBrUXlVNjNybFBHNnJCMTdHdXZ4NzRzamNnTWtGdUlvVVNFZGFu?=
 =?utf-8?B?QmRDMlJjVjhlQy82Y1JnSW1HWlRIdk94ZytLTmlOTkxVeTZoYnNxY25mS1kv?=
 =?utf-8?B?QXdDblE3bWsrUFQ4elRVNmFoanRZeWN3aWdHazFmbWVLb1R6TllEMS8zeFlk?=
 =?utf-8?B?eEpRYTkyOWU5UjUzdEk2OFFlMytXbVZXaDRiQWxtakM2N0daMG54SHl3U2dw?=
 =?utf-8?B?NjNyNGdPMnROOHgrUTlMT0ZPREgwZnNiYVFpYWdXejB1em56WkFNRWJRZmFx?=
 =?utf-8?B?OUV3Rm9BZFYyM1hkcUlHdDBjZE1YRnNwYmZDcUcxb3hpZzk0TFBJeFNvMXA0?=
 =?utf-8?B?eFZ6SmNYU1lETkZ1VlZGYXE2SVlvZHVyOTV1ZUZmNkNnMzhxWWs1eDJwUDQ4?=
 =?utf-8?B?ZG5EK1ZyWkRJZHZEQVltVnRqREpEZUw4TW1UbVVHUUZTWDRlcDJWUkNEN0Ur?=
 =?utf-8?B?R1lBb0dta25QNFFGcVNrWGZhZVh2dFhXMUxWNGlmdTlyajcrc09FV0xxa3cy?=
 =?utf-8?B?UlJXOGU0ZUxjSGU2QWNxbTdPTytZYzVLNW4vKzl1ZDBGVEZsWUdsRzI2dStl?=
 =?utf-8?B?K1I4cEhCaHZDeVVBa1ZQaXU0eWJtY2M3dnZwUnlmRzc0aitsN0FqSWRxaDhN?=
 =?utf-8?B?VUxjUEhnOWx2YlRxcURLekZqK0xxMVVHS0VrT1RkVVhmYUEvbGxYaDFybUFT?=
 =?utf-8?B?NkxNczJ2TzJqWEpwRkRub3hpdGkwNC9wRVk0OTIwOXRsSTFNZ0VuSnlCbFlB?=
 =?utf-8?B?NjVwUUhFajNoTytxK2xuTmNaaUNqZEhZcXNocmRxUHNzY1NLcVIrUkZiV0x0?=
 =?utf-8?B?akpWalVWd2xSdHJ1Tlc0REpEaEwwdzVPWEV2OHVDRzVsc1NXdUdzbWI4Q2c2?=
 =?utf-8?B?TGtIMlFYemQrLzJsaW04aDJUaFVFQVZ4SUUxd2crRWo5VmVPdlQrRDIzY1V6?=
 =?utf-8?B?cVdxbUhTQlpOM0hqYVNVcXNLa2VZd2gxTHdNRzNjdWNjVGtURS8wd2lTTS83?=
 =?utf-8?B?MCtYcDU2alBGQVVDWGc5eXdHd0RTNkVPNWVIU3RvSlhwV3Y1OU5lWGJhOWsw?=
 =?utf-8?B?a3J6ZkVtbjlhZVJrc2dIVUFtRzNzTUM4NjdZVDd6alY1SUdxVXlwSnZqclVT?=
 =?utf-8?B?VjYvYUExYlNGYy81UnExTDV3RG1SclNuRHYxU0RzZEI5dE9SZURkK3RyZUlQ?=
 =?utf-8?B?WW9xSXlJb2owNzR2UUkzanZwcDBtTVFaelBOd2tpbCtTY2VGNks5cXVOZFhk?=
 =?utf-8?Q?awMeBdc+aFFlK5mkmftMI0h1L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61971fdb-6f7f-4ca6-42cb-08dba7bca1d9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 11:48:01.6507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cD96rLGzp5AE2Y6Ukl7o+LKWlWLxMkQt3hy/nyx+t4gw0v4QeFeTN0HMEdGA0N9DB1znDMUR9Gxlm/l06PqbSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323

On 8/28/23 07:12, Josh Boyer wrote:
> On Fri, Aug 25, 2023 at 4:20 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>
>> The following changes since commit a33f8f1abd1df344798188807de4b4397d7484d3:
>>
>>    amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs (2023-08-25 15:25:00 -0400)
>>
>> are available in the Git repository at:
>>
>>    git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-25
> 
> Does this replace Wayne Lin's pull request for tags/amd-2023-08-18?

No, that is updating a different ASIC's fw. So, it's still needed.

> 
> I can't get to gitlab.freedesktop.org at all right now, so I can't pull either.
> 
> josh
> 
>>
>> for you to fetch changes up to a33f8f1abd1df344798188807de4b4397d7484d3:
>>
>>    amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs (2023-08-25 15:25:00 -0400)
>>
>> ----------------------------------------------------------------
-- 
Hamza

