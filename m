Return-Path: <SRS0=jAfk=EQ=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70825C83F2F
	for <linux-firmware@archiver.kernel.org>; Thu, 31 Aug 2023 18:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29E84C433C8; Thu, 31 Aug 2023 18:42:23 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADF43C433C7;
	Thu, 31 Aug 2023 18:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADF43C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aychZpH75sWQvsn7Jfp7j+7/meSqyT3bP1ZbaJQgqejEuV7x7eQ/OAGh6RL6WQVG0s89Ls7XMfNfzPjBVeyRBxq7mbrJjhAY4u94fy9cjjy2iNlu2aSw6ZjeGutJw5z69kQJdKi7xHSuSaMh/J6nogLeTyoPhLrXg848/IZNCzDejlHVuTSSF6YHjNWsmbaywTy8mdZUY37o7qNGhIAtJdReNAtDasFstk2Tm9B0QjyZlpoGt1W0qIDrLqaWX3t+IKM4NC+Gw6bVxYz8XYYP+H261dxUMk/SjUzkk4N371SvXKyJNTYz+GHlNC6MXYweMsNTBARC6P3jKzqUEFW4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+2tqSCUVzSNIN1Ys0SJE7iHscJTqu57N970BeuI0Dw=;
 b=CRA7/Z/IbyAZfrD6QYkJmN+f6xHzUcYJ38/rkev7PDHSGLe36XSLRZYROxQn6xEX6eGx6DCK7jvNE0BkqQNXGPW5Jczgbc/KrYIVRsaecUrRkyqLi7I9FYLqBj3LppC4s+nPuEgyZiNUtRbeqWdrTRK3dI9R7OqthlVMAYFhu24HnIyysu+H9Kz+M7dkdXn0pbAuG/sDm+LXwXsi8eMLYHx3i6ecgysfCtIc7PWMhhoeCXqPQnLYdOe247INxfPOkXeyhX6arXbU9GCMF5PQe1ug2jN/e46Q6urkXTfyuTUXui3jA2SND8hElTZ3PySoll8jCVt1qFjbv49CwYPG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+2tqSCUVzSNIN1Ys0SJE7iHscJTqu57N970BeuI0Dw=;
 b=3r2P/k3ji39T8nd8c5wi5hBFfGITGMdu54V57nSnHaX717gGAhHbTAXY89y/ju5xU9IuNUDWtJiGR/tvB2UsgNUEi5NkvpUSTTFZzRRvS1N8NzdH1J+vHA6E3syxnJtCLYYIPygElLxwcS0t+RcZH6tdL6hSNhwrQq5uQ7Jt3yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 18:42:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 18:42:19 +0000
Message-ID: <41fb7957-98e8-4ad6-b958-1e673e7476e0@amd.com>
Date: Thu, 31 Aug 2023 13:42:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Support RawFile in check_whence and update WHENCE
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>, linux-firmware@kernel.org
Cc: jwboyer@kernel.org
References: <20230831081345.47699-1-juerg.haefliger@canonical.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230831081345.47699-1-juerg.haefliger@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:806:21::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 35819ea0-f6b1-4b62-bf9a-08dbaa520152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Awgoscq5qNr+QgguN7R53RS6JUb/Wd5Z+hWDFjKRyNj4EBYA//i7C1xB5NQl5vLvV0UD6EdSdRCAxhU4l6YKOFP65Gs1OGJSF3d9ZGc/5U6BmDOlze+6eqUPv+KJZEfE75z1TC6bivMz9xcYF8qzvawRG2e4eP9NQQrlLsxy3yCbAdsAnbFV5TK+bHncNeQL2wi4cDYubHLGejgPpEkJDnjY5AMGY2oBqlLAknW1DEkav9wdPajyIMaQjamUVxcPAQP4XXdsFc6D9zrfBr76pBsHkIqdM3XiRVaK0M9VPfuOYhuj2yyrB/nQDLnh0UDkEcdPd61B6Ze5NfHcT02005VgTHcGQ7TW5IdBwY9i1e4mngZCxKy065bxOKz/Li1HbMUrhPLDXksM1WSJtI6wqBUIjHC3X7rLAbaAErF0RP6Z3qc8feo+i5hH27c6kv2nczCz8444ZuE33ImmU+frJ4ofY9gRXwLUnWX57Ck3JRQrf2bpYkDjLkYzIOmFLvl+o8TjcoI8XoeHlilAGWTH6iQzFDzUhE5XxJIcrKcD3PXlVER+HyoXO/gGukbvJ8d/VfybZp5YimblBuxx7Ij9w85T7e4DzTlzEM32nHJj3AfoHBUxpnd09pnI5Zy/F70fGK1XBQ7dW7vkFf6M5tOYxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(186009)(1800799009)(451199024)(478600001)(31696002)(36756003)(966005)(86362001)(15650500001)(83380400001)(2616005)(5660300002)(26005)(44832011)(2906002)(53546011)(6486002)(6506007)(6512007)(41300700001)(4326008)(8676002)(8936002)(316002)(66476007)(66556008)(66946007)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mjljb3ZRVkd0Vm51QXcvbEJUTG9rYng4eC96WVFMMHVqZk8vM3dwQXpxb1pJ?=
 =?utf-8?B?eDZ2dVRzZEJVNy9PSUNGeXZJYjVkOHRzR01hWjJTUzk4akcwZ0xTVDAwSlU1?=
 =?utf-8?B?aldGMGFJNGJhQmZIRGtkUXpYYWZVcXZxcGUwUUNLNTZuQVNxeVRwbytVSC8z?=
 =?utf-8?B?cUROcjl3R3pZMDVpd2Y2OTFHMUlxVllVbTFVOEQ1akxtd2poN0U2S2JlMU1E?=
 =?utf-8?B?WTZzU0c3RW9DaU5RR3g4d3hxV1VGUDR3SjlVOHhjdkNxTkdRZW1iZ0tjUng3?=
 =?utf-8?B?ZHB2NWZvNXUxOUQxd0t6UmVyME5oK2F4dlpQL1crazVhNlJmbmlIUHVJbXN1?=
 =?utf-8?B?ZU5yYXpuWVk3bWFBWDBVRU1Bb2s0clkxVjZ2SkkvV0dUM3JMcFQ4WFEydEkw?=
 =?utf-8?B?M1hUTm9EZlJ2dVQ0L0xJNWJhUVphODFWbzlkdVBmelIreEpmYzI0Q1FLNWpJ?=
 =?utf-8?B?UkRkNmNJWGdhOThBZFBKVGgrVVNacTFzNjlYNWgrYnlxa3FJdVlubU9nOTl6?=
 =?utf-8?B?emR1TnNNRWJrQ1lWc0Z6dWJHTXU0bHc0YUtWS0p3MjdiVVd6ZHpUdTVtQ0Mx?=
 =?utf-8?B?WWN0R0dIVDF6azYzNklWWE9XeFdMend1bkVQQURnbEIzbXI1cDM5N0Y0TEV4?=
 =?utf-8?B?bWNMV3lFWmttdk81Ym9OYTUxdWdVV0J3cHphQlF0SkxsQjJUc2xLbGpOaVZo?=
 =?utf-8?B?RCtSQXBIU0tKV2h1eW1DdFRQUnBoSklCR2oxY05Eak5OaEl2TmsxMW9FZmpv?=
 =?utf-8?B?SlFnVlMwMFlHNUJ1REpsN040empBQU9pZnhUTVF1eEpiLzFNazhRblFZTmZP?=
 =?utf-8?B?dnlIU2hvNzZxQUpuQTFWNy8xSFF6QWJIellzYnluWWJIMWkycU5SUHJPK1N2?=
 =?utf-8?B?dWcxczBiaWRUazF5ekxZaEptSnFmbjFUaUtTS2NqSmlLbFdXMVBpaVZXK2FT?=
 =?utf-8?B?eXcxbGUwazdDTTN0Sm1HUGtYWTBTMmpFVzhLTUVOeDRpYjFQd0NLY3lleklZ?=
 =?utf-8?B?aWU1NGR0Y1FSN1RSTjdzU3RQWVRETzRZN0MxTGovOUNHVnVycWQ4bWtXVlVC?=
 =?utf-8?B?SnVZSi9HT1pCcHRxc0VybXU4MHl5REx5bTFvWk1jallwQWx2RXZxMkg0c3BZ?=
 =?utf-8?B?OEo3Yit4ZWpWSXNpV3VobFZESWRma3UrcHVjUGJqY2hCeTEzWWdIMkZNUDRR?=
 =?utf-8?B?SjJ4WnFNWHRMS2loOXdCYjIxdE5QRkwzRXlSNWh1VDVmbDVUSUNBTE1ScW9G?=
 =?utf-8?B?eU55TzlReTNYak92OW5ibHBZMnYwcnJlT2dENGZtL2Z6QUp4dDBqaEZqRDFR?=
 =?utf-8?B?cmQ5eDVaK1Y4YXpLL3NDdFB3OFcrVFpNUCsvL3dVZm9YdUdNTGVhWDBwclJY?=
 =?utf-8?B?eUNEMVQxWWFWeXdVRjBJSFNiTlBHZVVxUkY4MHpNaVIvd2cyY2F3MmdnTTkv?=
 =?utf-8?B?TWw3aHBiS2tSWWdUUHlZOXVxN2dnazlseFZIaGVRaTBOaWVOcG8xTEJNbkpV?=
 =?utf-8?B?cWJzOXpLWHVQdVJOd253Y2dzR2xSY3paUFl3QllPMHpyNUozM1pUMkh0c0Vj?=
 =?utf-8?B?d2k5VjFjcVdXZXJZL253b0J0SVVsOEo2TXBNTG5KWmtaL0owSnJzTlFIMHF1?=
 =?utf-8?B?MDhMdXpWUUJXL2JHRVpaTmNJb1FDNm5MY2ZHSHFBZEc3d0tOR1VjRlVtajJa?=
 =?utf-8?B?eHRTdHYxWXU2R2tiWGl2S29TYVVDUDhHNzhsQ3VCN2dKRzVQRGlQL3JIdC9x?=
 =?utf-8?B?dnhqcmpLNkRReUZtSW5Vc3lkZkpNR25zWG9aSWVzRURoN2dvQjNKRzN0RFFT?=
 =?utf-8?B?RGRIZGxCamdJMVRtWm91MGVqTkg4dTJocDFQZWw1OTlVQi9aVXd2WkFTQXpa?=
 =?utf-8?B?aTY2S1BFbitHelpIbHVWV1BBb2I0RUkwSE53RTZjOU9qV3l5NGNrdjdWOGJC?=
 =?utf-8?B?dER5WUpoZ09wVHEzRWZKTDlmWW1rR3A0K0g0bFZVOXppU05XNktZbmRHVm9E?=
 =?utf-8?B?cmJBelRDTGhHY1cwbm1UQ0p2VE9uRVc3ZkNGbXVidW42N2svUWk0SVltc2d0?=
 =?utf-8?B?c0ZVKzVwZHRnc3gvMU1CZXViYjJKNTBtT0hNM0NJU1ZzbC9lbnRRR3RwbWsx?=
 =?utf-8?Q?F4bBem+wf1VkQLf+0xoRdV8lt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35819ea0-f6b1-4b62-bf9a-08dbaa520152
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:42:19.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tbJeU6hP7EJe5pksJoJpyE0iqWmEHyU1glaFkBB7iy4IdgAeulPnKgouI94CjjtkahomAHOjTn11/ORaw15Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5086

On 8/31/2023 03:13, Juerg Haefliger wrote:
> This series updates check_whence to understand the RawFile keyword and
> updates WHENCE to use that for currently known firmware files.
> 
> Juerg Haefliger (3):
>    check_whence: Recognize RawFile keyword
>    WHENCE: amd-ucode: Use new RawFile keyword
>    WHENCE: Don't compress qcom json files
> 
>   WHENCE          | 47 +++++++++++++++++++++--------------------------
>   check_whence.py |  6 +++---
>   2 files changed, 24 insertions(+), 29 deletions(-)
> 

I tried to apply this series to check it, but I think it got caught up 
in the new CI changes that we are introducing.

$ git am 
20230831_juerg_haefliger_support_rawfile_in_check_whence_and_update_whence.mbx
Applying: check_whence: Recognize RawFile keyword
error: patch failed: check_whence.py:6
error: check_whence.py: patch does not apply
Patch failed at 0001 check_whence: Recognize RawFile keyword
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Can you re-base it?  If it's easier for you, you can also open a MR here 
now:

https://gitlab.com/kernel-firmware/linux-firmware
